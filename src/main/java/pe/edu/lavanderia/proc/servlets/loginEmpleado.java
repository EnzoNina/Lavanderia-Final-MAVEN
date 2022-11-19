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
import pe.edu.lavanderia.proc.mantenimientos.BOGestionEmpleados;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;

@WebServlet(name = "loginEmpleado", urlPatterns = {"/loginEmpleado"})
public class loginEmpleado extends HttpServlet {

    @EJB
    private BOGestionEmpleados bOGestionEmpleados;

    @EJB
    private BOGestionPedidos boPedidos;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // name del usuario cliente
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        String[] datosEmpleado = bOGestionEmpleados.login(user, pass);

        List<Pedidos> lst = boPedidos.getPedidos();
        request.getSession().setAttribute("lstUltimosPedidos", lst);

        if (datosEmpleado[1].equalsIgnoreCase("administrador")) {
            System.out.println("Cod empleado: " + datosEmpleado[0]);
            request.getSession().setAttribute("cod_empleado", datosEmpleado[0]);

            request.getRequestDispatcher("pages/Lavanderia/menu.jsp").forward(request, response);
        } else if (datosEmpleado[1].equalsIgnoreCase("personal")) {
            request.getSession().setAttribute("cod_empleado", datosEmpleado[0]);
            request.getRequestDispatcher("pages/PersonalLavanderia/menuPersonal.jsp").forward(request, response);            
        } else {
            response.sendRedirect("pages/login.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
