package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.dto.DtoPrendasLista;
import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPrendas;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletVisitaDomiciliaria", urlPatterns = {"/ServletVisitaDomiciliaria"})
public class ServletVisitaDomiciliaria extends HttpServlet {

    // Atributos
    List<String> listaPrendas = new ArrayList<String>();
    List<Integer> listaCantidad = new ArrayList<Integer>();

    @EJB
    private BOGestionServicios boServicios;

    @EJB
    private BOGestionPrendas boPrendas;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");
        if (instruccion == null) {
            instruccion = "listar";
        }

        switch (instruccion) {
            case "listar":
                cargarServicios(request, response);
                break;
            case "agregarRopa":
                agregarRopa(request, response);
                break;
            case "new":
                newVisita(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void cargarServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Servicios> lstServicios = boServicios.getServicios();
        List<DtoPrendasLista> lstPrendas = boPrendas.getPrendasList();
        request.setAttribute("lstServicios", lstServicios);
        request.setAttribute("lstPrendas", lstPrendas);
        request.getRequestDispatcher("pages/User/visitaDomiciliaria.jsp").forward(request, response);
    }

    private void cargar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Servicios> lstServicios = boServicios.getServicios();
        List<DtoPrendasLista> lstPrendas = boPrendas.getPrendasList();
        request.setAttribute("lstServicios", lstServicios);
        request.setAttribute("lstPrendas", lstPrendas);
    }

    private void agregarRopa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prenda = request.getParameter("prenda");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        listaPrendas.add(prenda);
        listaCantidad.add(cantidad);
        cargar(request, response);
        request.setAttribute("lstRopaTotal", listaPrendas);
        request.getRequestDispatcher("pages/User/visitaDomiciliaria.jsp").forward(request, response);
    }

    private void newVisita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionPedidos boPedidos = new BOGestionPedidos();
        BOGestionClientes boClientes = new BOGestionClientes();
        //Obtenemos el dni del cliente
        String dni = (String) request.getSession().getAttribute("DNI");
        System.out.println("EL DNI" + dni);
        //Obtenemos al cliente
        Clientes cliente = boClientes.buscarClientePorDNI(dni);
        //Creamos el array de la cantida
        Integer[] arrCantidad = new Integer[listaCantidad.size()];
        arrCantidad = listaCantidad.toArray(arrCantidad);
        //Creamos el array de las prenads
        String[] arrPrendas = new String[listaPrendas.size()];
        arrPrendas = listaPrendas.toArray(arrPrendas);
        //Obtenemos fecha
        String fecha = request.getParameter("fecha_recojo");
        int cod_hora = Integer.parseInt(request.getParameter("hora"));
        Date fecha_recojo = Date.valueOf(fecha);
        //Obtenemos distrito
        String distrito = request.getParameter("distrito");
        VisitaDomiciliaria visita = new VisitaDomiciliaria(cliente.getCod(), arrPrendas, arrCantidad, fecha_recojo, cod_hora, distrito);
        boPedidos.programarVisita(visita);
        request.getRequestDispatcher("pages/User/menuUser.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
