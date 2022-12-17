package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet(name = "loginUsuario", urlPatterns = {"/loginUsuario"})
public class loginUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // LLamar el id del cliente y la contraseña
        BOGestionClientes bo = new BOGestionClientes();

        // name del usuario cliente
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        String arra[] = bo.login(user, pass);

        request.getSession().setAttribute("cod_cliente", arra[0]);
        request.getSession().setAttribute("nombrePerfil", arra[2]);

        if (!arra[0].isEmpty()) {            
            request.getSession().setAttribute("DNI", arra[1]);
            System.out.println("EL DNI SE ESTABLECIO EN " + arra[1]);
            response.sendRedirect("ServletLoadVisitas");
        } else {
            response.sendRedirect("pages/login.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
