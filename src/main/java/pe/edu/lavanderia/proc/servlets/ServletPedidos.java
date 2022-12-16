package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import pe.edu.lavanderia.dto.DtoPrendaListaMostrar;
import pe.edu.lavanderia.dto.DtoPrendasLista;
import pe.edu.lavanderia.dto.DtoServicios;
import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPrendas;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletPedidos", urlPatterns = { "/ServletPedidos" })
public class ServletPedidos extends HttpServlet {

    @EJB
    private BOGestionClientes bOGestionClientes;

    @EJB
    private BOGestionPedidos bo;

    List<Integer> lstRopaCant = new ArrayList<Integer>();
    List<Double> lstSubTotal = new ArrayList<Double>();
    List<DtoPrendaListaMostrar> lstRopaMandar = new ArrayList<DtoPrendaListaMostrar>();
    List<DtoServicios> lstServicio = new ArrayList<DtoServicios>();

    double total = 0.00;
    String tipoLogin = "";

    public ServletPedidos() {
        tipoLogin = "";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listar";
        }
        switch (instruccion) {
            case "listar":
                cargarServicios(request, response);
                break;
            case "buscar":
                buscarCliente(request, response);
                break;
            case "addRopa":
                addRopa(request, response);
                break;
            case "deleteRopa":
                deleteRopa(request, response);
                break;
            case "deleteServicio":
                deleteServicio(request, response);
                break;
            case "agregarServicio":
                addServicio(request, response);
                break;
            case "new":
                newPedido(request, response);
                break;
            case "generarBoleta":
                generarBoleta(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void generarBoleta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los datos del cliente
        String nombres = (String) request.getSession().getAttribute("nombres");
        String apellidos = (String) request.getSession().getAttribute("apellidos");
        String dni = (String) request.getSession().getAttribute("DNI");
        String direccion = (String) request.getSession().getAttribute("direccion");

        Random ra = new Random();
        int num = ra.nextInt(999);
        String nroBoleta = "BO001-000" + num;

        ServletOutputStream out = response.getOutputStream();
        try {
            InputStream logoEmpresa = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("jasperReports/img/lavanderia.png"),
                    reporetBoleta = this.getServletConfig()
                            .getServletContext()
                            .getResourceAsStream("jasperReports/Boleta.jasper");

            if (logoEmpresa != null && reporetBoleta != null) {
                // Creamos Arrays y agregamos los datos
                List<DtoServicios> lstServicios = new ArrayList<>();
                List<DtoServicios> lstServicios2 = new ArrayList<>();

                lstServicios.add(new DtoServicios());

                lstServicios2 = lstServicio;
                lstServicios.addAll(lstServicios2);

                // Creamos objeto Jasper Report
                JasperReport report = (JasperReport) JRLoader.loadObject(reporetBoleta);
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(lstServicios.toArray());

                // Creamos los parametros del Jasper Report
                Map<String, Object> parametros = new HashMap();
                parametros.put("ds", ds);
                parametros.put("logoEmpresa", logoEmpresa);
                parametros.put("total", total);
                parametros.put("nombres", nombres + " " + apellidos);
                parametros.put("direccion", direccion);
                parametros.put("dni", dni);
                parametros.put("nroBoleta", nroBoleta);

                response.setContentType("application/pdf");
                response.addHeader("Content-disposition", "inline; filename=" + nroBoleta + ".pdf");
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parametros, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
                out.close();

            } else {
                response.setContentType("text/plain");
                out.println("ERROR: No se pudo generar el reporte");
                out.println(
                        "ERROR: Esto puede deberse a que la lista de datos no fue recibida o el archivo plantilla del reporte no se ha encontrado");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("ERROR: Al intentar generar el reporte: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void newPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos el codigo del empleado
        int cod_empleado = Integer.parseInt((request.getSession().getAttribute("cod_empleado")).toString());
        int cod_cliente = Integer.parseInt((request.getSession().getAttribute("cod")).toString());
        String observacion = request.getParameter("observacion");
        String fecha_entrega = request.getParameter("fecha_entrega");
        Date fecha_entregaSQL = Date.valueOf(fecha_entrega);

        Pedidos ob = new Pedidos(cod_cliente, cod_empleado, fecha_entregaSQL, observacion, "presencial", total);

        bo.addPedido(ob);
        bo.addPrendas(lstRopaMandar);
        bo.addDetallePedido(lstServicio, lstSubTotal);

        request.getSession().setAttribute("listaServicio", null); // Establecemos la lista de servicio
        request.getSession().setAttribute("listaRopa", null);
        request.getSession().setAttribute("DNI", "DNI");
        request.getSession().setAttribute("nombres", "Nombres");
        request.getSession().setAttribute("apellidos", "Apellidos");
        request.getSession().setAttribute("direccion", "Direccion");

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    private void addServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servicioTotal = request.getParameter("servicio");

        // Creamos array con los datos del servicio
        String[] arrPartes = servicioTotal.split("-");
        // Obtenemos el costo del servicio
        double costoServicio = Double.parseDouble(arrPartes[2]);
        // Calculamos el monto del servicio
        double montotemp = costoServicio;
        // Agregamos el sub total a la lista
        lstSubTotal.add(montotemp);
        // Calculamos el total
        total += montotemp;
        request.getSession().setAttribute("monto", total);
        // Creamos objeto de servicio
        DtoServicios obServicio = new DtoServicios(Integer.parseInt(arrPartes[0]), arrPartes[1],
                Double.parseDouble(arrPartes[2]), arrPartes[3]);
        // Agregamos el objeto a la lista
        lstServicio.add(obServicio);

        request.getSession().setAttribute("monto", total);// Establecemos el total
        request.getSession().setAttribute("listaServicio", lstServicio); // Establecemos la lista de servicio

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    private void deleteServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int codServicio = Integer.parseInt(request.getParameter("codServicio"));
        double precioServicio = Double.parseDouble(request.getParameter("precio"));

        for (DtoServicios servicio : lstServicio) {
            if (servicio.getCod() == codServicio) {
                lstServicio.remove(servicio);
                total -= precioServicio;
                lstSubTotal.remove(precioServicio);
                request.getSession().setAttribute("monto", total);
                break;
            }
        }

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }

    }

    private void deleteRopa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codRopa = Integer.parseInt(request.getParameter("codPrenda"));

        for (DtoPrendaListaMostrar ropa : lstRopaMandar) {
            if (ropa.getCod() == codRopa) {
                lstRopaMandar.remove(ropa);
                break;
            }
        }

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    private void addRopa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos el codigo de la ropa
        int codRopa = Integer.parseInt(request.getParameter("codigoPrenda"));
        String tipoPrenda = request.getParameter("tp");
        String tipoTela = request.getParameter("tt");
        String color = request.getParameter("color");
        // Obtenemos la cantida de la ropa
        int cantidadRopa = Integer.parseInt(request.getParameter("cantidad"));

        // Creamos objeto de DtoPrendasMostrar
        DtoPrendaListaMostrar obDtoMostrar = new DtoPrendaListaMostrar(codRopa, tipoPrenda, tipoTela, color,
                cantidadRopa);

        // Agregamos ropa y cantidad
        lstRopaCant.add(cantidadRopa);

        lstRopaMandar.add(obDtoMostrar);

        request.getSession().setAttribute("listaRopa", lstRopaMandar);

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    private void cargarServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Creamos los objetos de BO Servicios y Prendas, para obtener las listas
        BOGestionServicios bo = new BOGestionServicios();
        BOGestionPrendas boPrendas = new BOGestionPrendas();

        List<Servicios> lst = bo.getServicios();
        List<DtoPrendasLista> lstPrendasDTO = boPrendas.getPrendasList();

        // Mandamos la lista de servicios y la lista de prendas
        request.getSession().setAttribute("list", lst);
        request.getSession().setAttribute("lstPrendas", lstPrendasDTO);
        // Establecemos valores defectos a los datos del cliente
        request.getSession().setAttribute("DNI", "DNI");
        request.getSession().setAttribute("nombres", "Nombres");
        request.getSession().setAttribute("apellidos", "Apellidos");
        request.getSession().setAttribute("direccion", "Direccion");

        // Establecemos valores por defecto de las prendas y el servicio
        request.getSession().setAttribute("monto", "0.00");// Establecemos el total

        tipoLogin = (String) request.getSession().getAttribute("tipoLogin");

        System.out.println("Tipo de Usuario: " + tipoLogin);

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    private void buscarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("DNI");
        Clientes cli = bOGestionClientes.buscarClientePorDNI(dni);
        dni = cli.getDni();
        int cod = cli.getCod();
        String direccion = cli.getDireccion();
        String nombres = cli.getNombre();
        String apellidos = cli.getApellidoPaterno() + cli.getApellidoMaterno();

        request.getSession().setAttribute("DNI", dni);
        request.getSession().setAttribute("cod", cod);
        request.getSession().setAttribute("direccion", direccion);
        request.getSession().setAttribute("nombres", nombres);
        request.getSession().setAttribute("apellidos", apellidos);

        if (tipoLogin.equalsIgnoreCase("personal")) {
            System.out.println("Ingresando a Personal");
            request.getRequestDispatcher("sales/nuevoPedidoPersonal.jsp").forward(request, response);
        } else {
            System.out.println("Ingresando a Adminstrador");
            request.getRequestDispatcher("sales/nuevoPedido.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
