package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet("/ServletEditar")
public class ServletEditar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private BOGestionClientes bo;

    public ServletEditar() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("codigo"));
        String nombres = request.getParameter("nombres");
        String apePaterno = request.getParameter("pa");
        String apeMaterno = request.getParameter("ma");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
        Clientes ob = new Clientes(cod, nombres, apePaterno, apeMaterno, dni, celular, direccion, usuario, contra, correo);
        bo.editClientes(ob);
        response.sendRedirect("ServletListaClientes");
    }

}
