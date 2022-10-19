package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.dto.DtoClientes;

import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet("/ServletListaClientes")
public class ServletGetListaClientes extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private BOGestionClientes bo;

    public ServletGetListaClientes() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        if (tipo.equals("personal")) {
            //Crear bo que te retorne una lista de dtoClientes
            List<DtoClientes> lst = bo.getClientesDTO();
            request.getSession().setAttribute("clientList", lst);
            request.getRequestDispatcher("pages/PersonalLavanderia/clients.jsp").forward(request, response);
        } else {
            List<Clientes> lst = bo.getClientes();
            request.getSession().setAttribute("clientList", lst);
            request.getRequestDispatcher("GestionJSP/clients.jsp").forward(request, response);
        }

    }

}
