package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;

@WebServlet(name = "ServletLoadVisitas", urlPatterns = {"/ServletLoadVisitas"})
public class ServletLoadVisitas extends HttpServlet {

    @EJB
    private BOGestionPedidos bo;

    // final static BOGestionCategorias bo = new BOGestionCategorias();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GHOLAAAAAAAAAAAAA");
        // Cargamos lista de visitas y mandamos al JSP

        int codCliente = Integer.parseInt((String) request.getSession().getAttribute("cod_cliente"));

        List<VisitaDomiciliaria> lst = bo.getVisitas(codCliente);

        request.setAttribute("lst", lst);

        request.getRequestDispatcher("pages/User/menuUser.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
