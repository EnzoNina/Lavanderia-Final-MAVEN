package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.Properties;
import javax.ejb.EJB;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

    @EJB
    private BOGestionClientes bo;

    public ServletRegister() {
        super();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos datos
        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nombre");
        String apePaterno = request.getParameter("apePaterno");
        String apeMaterno = request.getParameter("apeMaterno");
        String DNI = request.getParameter("DNI");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String celular = request.getParameter("celular");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");

        try {
            //Establecemos propiedades del Java Mail
            Properties propiedad = new Properties();
            propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
            propiedad.setProperty("mail.smtp.starttls.enable", "true");
            propiedad.setProperty("mail.smtp.port", "587");
            propiedad.setProperty("mail.smtp.auth", "true");

            Session sesion = Session.getDefaultInstance(propiedad);

            String correoEnvia = "lavautp2022@gmail.com";
            String contrasena = "ikukiemjuxiqjllx";
            String destinatario = correo;
            String asunto = "Lavanderia UTP";
            String mensaje = "Bienvenido " + nombre + " felicidades por tu registro";

            MimeMessage mail = new MimeMessage(sesion);

            mail.setFrom(new InternetAddress(correoEnvia));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            mail.setSubject(asunto);
            mail.setText(mensaje);

            Transport transporte = sesion.getTransport("smtp");
            transporte.connect(correoEnvia, contrasena);
            transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            transporte.close();

            // Creamos objeto cliente
            Clientes ob = new Clientes(nombre, apePaterno, apeMaterno, DNI, celular, direccion, usuario, contraseña, correo, true);
            bo.addClientes(ob);

            if (tipo == null) {
                tipo = "administracion";
            }

            if (tipo.equalsIgnoreCase("user")) {                
                response.sendRedirect("pages/login.jsp");
            } else if (tipo.equalsIgnoreCase("personal")) {
                response.sendRedirect("ServletListaClientes?tipo=personal");
            } else {
                // Regresamos a la lista de clientes            
                response.sendRedirect("ServletListaClientes");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
