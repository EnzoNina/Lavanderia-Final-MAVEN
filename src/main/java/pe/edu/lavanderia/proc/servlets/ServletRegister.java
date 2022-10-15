package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ServletRegister() {
        super();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos datos
        String nombre = request.getParameter("nombre");
        String apePaterno = request.getParameter("apePaterno");
        String apeMaterno = request.getParameter("apeMaterno");
        String DNI = request.getParameter("DNI");
        String direccion = request.getParameter("direccion");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        // Creamos objeto cliente
        Clientes ob = new Clientes(nombre, apePaterno, apeMaterno, DNI, celular, direccion, usuario, contraseña);
        BOGestionClientes bo = new BOGestionClientes();
        bo.addClientes(ob);
        // Regresamos a la lista de clientes
        response.sendRedirect("ServletListaClientes");
    }

}
