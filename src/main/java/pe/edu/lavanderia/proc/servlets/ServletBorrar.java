package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet("/ServletBorrar")
public class ServletBorrar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ServletBorrar() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        BOGestionClientes bo = new BOGestionClientes();
        bo.removeClientes(codigo);
        response.sendRedirect("ServletListaClientes");
    }

}
