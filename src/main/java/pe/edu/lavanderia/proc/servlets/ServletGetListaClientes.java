package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;

@WebServlet("/ServletListaClientes")
public class ServletGetListaClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletGetListaClientes() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BOGestionClientes bo = new BOGestionClientes();
		List<Clientes> lst = bo.getClientes();
		request.setAttribute("clientList", lst);
		request.getRequestDispatcher("GestionJSP/clients.jsp").forward(request, response);		
	}

}
