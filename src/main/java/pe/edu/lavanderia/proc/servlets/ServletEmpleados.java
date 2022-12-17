package pe.edu.lavanderia.proc.servlets;

//import entidades.Empleado;
import javax.ejb.EJB;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import pe.edu.lavanderia.dao.DaoEmpleados;
import pe.edu.lavanderia.dto.DtoEmpleados;
import pe.edu.lavanderia.entidades.jdbc.Empleados;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionEmpleados;

@WebServlet(name = "ServletEmpleados", urlPatterns = {"/ServletEmpleados"})
public class ServletEmpleados extends HttpServlet {

    @EJB
    private BOGestionEmpleados bo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listar";
        }

        switch (instruccion) {
            case "listar":
                getEmpleados(request, response);
                break;
            case "new":
                newEmpleado(request, response);
                break;
            case "edit":
                editEmpleado(request, response);
                break;
            case "delete":
                deleteEmpleado(request, response);
                break;
            case "exportarReporteEmpleado":
                exportReportEmployees(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void getEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");

        if (tipo == null) {
            tipo = "administracion";
        }
        if (tipo.equalsIgnoreCase("personal")) {

            List<DtoEmpleados> lst = bo.getEmpleadosDTO();

            request.setAttribute("lst", lst);
            request.getRequestDispatcher("pages/PersonalLavanderia/empleadoPersonal.jsp").forward(request, response);
        } else if (tipo.equalsIgnoreCase("administracion")) {

            List<Empleados> lst = bo.getEmpleados();
            request.setAttribute("lst", lst);
            request.getRequestDispatcher("pages/Lavanderia/empleado.jsp").forward(request, response);
        }
    }

    // Metodos
    private void newEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");
        String nombres = request.getParameter("nombres");
        String dni = request.getParameter("dni");
        String ape_materno = request.getParameter("ma");
        String ape_paterno = request.getParameter("pa");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        String empleadoTipo = request.getParameter("empleado");

        if (tipo == null) {
            tipo = "administracion";
        }

        Empleados ob = new Empleados(dni, nombres, ape_paterno, ape_materno, celular, usuario, contraseña, empleadoTipo, true);

        bo.addEmpleado(ob);

        if (tipo.equalsIgnoreCase("personal")) {
            response.sendRedirect("ServletEmpleados?tipo=personal");
        } else {
            response.sendRedirect("ServletEmpleados");
        }

    }

    private void editEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("codi"));
        String nombres = request.getParameter("nombres");
        String dni = request.getParameter("dni");
        String ape_materno = request.getParameter("ma");
        String ape_paterno = request.getParameter("pa");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        String tipoEmpleado = request.getParameter("empleado");
                                
        Empleados o = new Empleados(cod, usuario,tipoEmpleado,nombres,ape_paterno,ape_materno,dni,celular,contraseña,true);
        bo.editEmpleado(o);
        response.sendRedirect("ServletEmpleados");
    }

    private void deleteEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("codi"));
        bo.removeEmpleado(false, cod);
        response.sendRedirect("ServletEmpleados");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //AGREGADO
    private void exportReportEmployees(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoEmpleados daoEmpleado = new DaoEmpleados();
        ServletOutputStream out = response.getOutputStream();
        try {
            InputStream logoEmpresa = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("jasperReports/img/lavanderia.png"),
                    reportEmployees = this.getServletConfig()
                            .getServletContext()
                            .getResourceAsStream("jasperReports/Empleado.jasper");
            if (logoEmpresa != null && reportEmployees != null) {

                List<Empleados> reportesEmpleados = new ArrayList<>();
                List<Empleados> reportesEmpleados2 = new ArrayList<>();

                reportesEmpleados.add(new Empleados());

                reportesEmpleados2 = daoEmpleado.getEmpleados();
                reportesEmpleados.addAll(reportesEmpleados2);

                JasperReport report = (JasperReport) JRLoader.loadObject(reportEmployees);
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(reportesEmpleados.toArray());

                Map<String, Object> parameters = new HashMap();
                parameters.put("ds", ds);
                parameters.put("logoEmpresa", logoEmpresa);
                response.setContentType("application/pdf");
                response.addHeader("Content-disposition", "inline; filename=ReportesEmpleados.pdf");
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
                out.close();
            } else {
                response.setContentType("text/plain");
                out.println("ERROR: No se pudo generar el reporte");
                out.println("ERROR: Esto puede debrse a que la lista de datos no fue recibida o el archivo plantilla del reporte no se ha encontrado");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("ERROR: Al intentar generar el reporte: " + e.getMessage());
            e.printStackTrace();
        }

    }

}
