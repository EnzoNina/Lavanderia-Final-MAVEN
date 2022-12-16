package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;

@WebServlet(name = "ServletLoadPedidos", urlPatterns = {"/ServletLoadPedidos"})
public class ServletLoadPedidos extends HttpServlet {

    @EJB
    private BOGestionPedidos bo;

    // final static BOGestionCategorias bo = new BOGestionCategorias();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listar";
        }

        switch (instruccion) {
            case "listar":
                getPedidos(request, response);
                break;
            case "edit":
                editPedidos(request, response);
                break;
            case "delete":
                deletePedidos(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void getPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");

        if (tipo == null) {
            tipo = "administracion";
        }
        //Cargamos lista de pedidos y lo mandamos al JSP
        List<Pedidos> lst = bo.getPedidos();
        List<VisitaDomiciliaria> lstVisitas = bo.getAllVisitas();

        request.setAttribute("lst", lst);
        request.setAttribute("listaVisitasDomiciliarias", lstVisitas);

        if (tipo.equalsIgnoreCase("personal")) {
            request.getRequestDispatcher("pages/PersonalLavanderia/menuPersonal.jsp").forward(request, response);
        } else if (tipo.equalsIgnoreCase("administracion")) {// Sino, nos dirige al menu del administrador

            request.getRequestDispatcher("pages/Lavanderia/menu.jsp").forward(request, response);
        }
    }

    private void editPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void deletePedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
