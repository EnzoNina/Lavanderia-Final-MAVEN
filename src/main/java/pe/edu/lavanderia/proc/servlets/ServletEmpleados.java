package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.entidades.jdbc.Empleados;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionEmpleados;

@WebServlet(name = "ServletEmpleados", urlPatterns = {"/ServletEmpleados"})
public class ServletEmpleados extends HttpServlet {

    //final static BOGestionEmpleados bo = new BOGestionEmpleados();
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
            default:
                throw new AssertionError();
        }

    }

    private void getEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionEmpleados bo = new BOGestionEmpleados();
        List<Empleados> lst = bo.getEmpleados();
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("GestionJSP/empleado.jsp").forward(request, response);
    }

    // Metodos
    private void newEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BOGestionEmpleados bo = new BOGestionEmpleados();

        String nombre = request.getParameter("nombres");
        String dni = request.getParameter("dni");
        String ape_materno = request.getParameter("ma");
        String ape_paterno = request.getParameter("pa");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");

        Empleados o = new Empleados(dni, nombre, ape_paterno, ape_materno, celular, usuario, contraseña);
        bo.addEmpleado(o);
        response.sendRedirect("ServletEmpleados");

    }

    private void editEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionEmpleados bo = new BOGestionEmpleados();
        int cod = Integer.parseInt(request.getParameter("codi"));
        String nombre = request.getParameter("nombres");
        String dni = request.getParameter("dni");
        String ape_materno = request.getParameter("ma");
        String ape_paterno = request.getParameter("pa");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");

        Empleados o = new Empleados(cod, dni, nombre, ape_paterno, ape_materno, celular, usuario, contraseña);
        bo.editEmpleado(o);
        response.sendRedirect("ServletEmpleados");
    }

    private void deleteEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionEmpleados bo = new BOGestionEmpleados();
        int cod = Integer.parseInt(request.getParameter("codi"));
        bo.removeEmpleado(cod);
        response.sendRedirect("ServletEmpleados");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
