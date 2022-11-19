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
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPrendas;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletPedidos", urlPatterns = {"/ServletPedidos"})
public class ServletPedidos extends HttpServlet {

    @EJB
    private BOGestionClientes bOGestionClientes;

    @EJB
    private BOGestionPedidos bo;

    List<String> lstRopa = new ArrayList<String>();
    List<Integer> lstRopaCant = new ArrayList<Integer>();
    List<String> lstRopaServicio = new ArrayList<String>();
    List<String> lstRopaTotal = new ArrayList<String>();
    List<Double> lstSubTotal = new ArrayList<Double>();
    double total = 0.00;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");
                       
        if (instruccion == null) {
            instruccion = "listar";
        }
        
        String a = (String) request.getSession().getAttribute("DNI");
        System.out.println("aaaaaaaa " + a);

        switch (instruccion) {
            case "listar":
                cargarServicios(request, response);
                break;
            case "buscar":
                buscarCliente(request, response);
                break;
            case "agregarRopa":
                agregarRopa(request, response);
                break;
            case "new":
                newPedido(request, response);
                break;
            case "edit":
                editPedido(request, response);
                break;
            case "delete":
                deletePedido(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void cargarServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionServicios bo = new BOGestionServicios();
        BOGestionPrendas boPrendas = new BOGestionPrendas();
        List<Servicios> lst = bo.getServicios();
        List<DtoPrendasLista> lstPrendas = boPrendas.getPrendasList();
        request.setAttribute("list", lst);
        request.setAttribute("lstPrendas", lstPrendas);
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    public void cargar(HttpServletRequest request, HttpServletResponse response) {
        BOGestionServicios bo = new BOGestionServicios();
        BOGestionPrendas boPrendas = new BOGestionPrendas();
        List<DtoPrendasLista> lstPrendas = boPrendas.getPrendasList();
        List<Servicios> lst = bo.getServicios();
        request.setAttribute("lstPrendas", lstPrendas);
        request.setAttribute("list", lst);
    }

    private void buscarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("DNI");        
        Clientes cli = bOGestionClientes.buscarClientePorDNI(dni);
        dni = cli.getDni();
        int cod = cli.getCod();
        String direccion = cli.getDireccion();
        String nombres = cli.getNombre();
        String apellidos = cli.getApellidoPaterno() + cli.getApellidoMaterno();        
        cargar(request, response);
        request.getSession().setAttribute("DNI", dni);
        request.getSession().setAttribute("cod", cod);
        request.getSession().setAttribute("direccion", direccion);
        request.getSession().setAttribute("nombres", nombres);
        request.getSession().setAttribute("apellidos", apellidos);        
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    private void agregarRopa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Datos del cliente

        String ropa = request.getParameter("prenda");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        String servicioTotal = request.getParameter("servicio");

        //Creamos array con los datos del servicio
        String[] arr = servicioTotal.split("-");
        //Calculamos costo
        double costoServicio = Double.parseDouble(arr[2]);
        double montotemp = costoServicio * cantidad;
        lstSubTotal.add(montotemp);
        total += montotemp;
        lstRopa.add(ropa);
        lstRopaCant.add(cantidad);
        lstRopaServicio.add(arr[0]);
        lstRopaTotal.add("Codigo de Ropa:" + ropa + "-" + "Cantidad: " + cantidad + "-" + "Servicio:" + arr[1]);
        cargar(request, response);        
        request.setAttribute("monto", total);
        request.setAttribute("lstRopaTotal", lstRopaTotal);
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    private void newPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Obtenemos el codigo del empleado
        int cod_empleado = Integer.parseInt((request.getSession().getAttribute("cod_empleado")).toString());
        String tipo = request.getParameter("tipo");
        int cod_cliente = Integer.parseInt(( request.getSession().getAttribute("cod")).toString());
        String observacion = request.getParameter("observacion");
        String fecha_entrega = request.getParameter("fecha_entrega");

        Date fecha_entregaSQL = Date.valueOf(fecha_entrega);
        Pedidos ob = new Pedidos(cod_cliente, cod_empleado, fecha_entregaSQL, observacion, tipo, total);
        System.out.println(ob.toString());
        bo.addPedido(ob);
        bo.addDetallePedido(lstRopaServicio, lstRopaCant, lstSubTotal);
        response.sendRedirect("pages/Lavanderia/menu.jsp");        
    }

    private void editPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionPedidos bo = new BOGestionPedidos();
        int cod = Integer.parseInt(request.getParameter("cod"));
        String nombre = request.getParameter("nom");
        String descripcion = request.getParameter("desc");
        int cod_categoria = Integer.parseInt(request.getParameter("cate"));
        double precio = Double.parseDouble(request.getParameter("prec"));
    }

    private void deletePedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BOGestionPedidos bo = new BOGestionPedidos();
        int cod = Integer.parseInt(request.getParameter("codigo"));

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
