package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.dto.DtoCategorias;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet("/ServletServiciosXCategoria")
public class ServletServiciosXCategoria extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ServletServiciosXCategoria() {
        super();

    }

    @EJB
    private BOGestionServicios bo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod_categoria = Integer.parseInt(request.getParameter("cod_categoria"));
        DtoCategorias dto = bo.getServiciosXCategoria(cod_categoria);
        request.getSession().setAttribute("lstServicios", dto);
        request.getRequestDispatcher("ConsultaJSP/serviciosXCategoria.jsp").forward(request, response);
    }

}
