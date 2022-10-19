package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionCategorias;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletServicios", urlPatterns = {"/ServletServicios"})
public class ServletServicios extends HttpServlet {

    @EJB
    private BOGestionServicios bo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listar";
        }

        switch (instruccion) {
            case "listar":
                getServicios(request, response);
                break;
            case "new":
                newServicio(request, response);
                break;
            case "edit":
                editServicio(request, response);
                break;
            case "delete":
                deleteServicio(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void getServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionCategorias boCa = new BOGestionCategorias();
        List<Servicios> lst = bo.getServicios();
        List<Integer> listCodCategorias = boCa.getCodCategorias();
        request.setAttribute("list", lst);
        request.setAttribute("categoriasCod", listCodCategorias);
        request.getRequestDispatcher("GestionJSP/servicios.jsp").forward(request, response);
    }

    // Metodos
    private void newServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nom");
        String descripcion = request.getParameter("desc");
        int cod_categoria = Integer.parseInt(request.getParameter("cate"));
        double precio = Double.parseDouble(request.getParameter("prec"));

        Servicios ob = new Servicios(nombre, descripcion, cod_categoria, precio);
        bo.addServicio(ob);
        response.sendRedirect("ServletServicios");

    }

    private void editServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));
        String nombre = request.getParameter("nom");
        String descripcion = request.getParameter("desc");
        int cod_categoria = Integer.parseInt(request.getParameter("cate"));
        double precio = Double.parseDouble(request.getParameter("prec"));

        Servicios ob = new Servicios(cod, nombre, descripcion, cod_categoria, precio);
        bo.editServicio(ob);
        response.sendRedirect("ServletServicios");
    }

    private void deleteServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("cod"));
        bo.removeServicio(cod);
        response.sendRedirect("ServletServicios");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
