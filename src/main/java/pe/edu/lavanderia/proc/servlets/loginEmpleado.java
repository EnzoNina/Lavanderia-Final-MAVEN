package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionEmpleados;

@WebServlet(name = "loginEmpleado", urlPatterns = {"/loginEmpleado"})
public class loginEmpleado extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BOGestionEmpleados bo = new BOGestionEmpleados();

        // name del usuario cliente
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        boolean login = bo.login(user, pass);

        if (login) {
            response.sendRedirect("pages/Lavanderia/menu.jsp");
        } else {
            response.sendRedirect("pages/login.jsp");
        }

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
