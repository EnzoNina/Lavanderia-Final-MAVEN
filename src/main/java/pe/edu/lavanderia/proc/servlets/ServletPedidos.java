package pe.edu.lavanderia.proc.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.entidades.jdbc.Clientes;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletPedidos", urlPatterns = {"/ServletPedidos"})
public class ServletPedidos extends HttpServlet {

    List<String> lstRopa = new ArrayList<String>();
    List<Integer> lstRopaCant = new ArrayList<Integer>();
    List<String> lstRopaServicio = new ArrayList<String>();
    List<String> lstRopaTotal = new ArrayList<String>();
    double monto = 0.00;

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
        List<Servicios> lst = bo.getServicios();
        request.setAttribute("list", lst);
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    public void cargar(HttpServletRequest request, HttpServletResponse response) {
        BOGestionServicios bo = new BOGestionServicios();
        List<Servicios> lst = bo.getServicios();
        request.setAttribute("list", lst);
    }

    private void buscarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("DNI");
        BOGestionClientes bo = new BOGestionClientes();
        Clientes cli = bo.buscarClientePorDNI(dni);
        dni = cli.getDni();
        int cod = cli.getCod();
        String direccion = cli.getDireccion();
        String nombres = cli.getNombres();
        String apellidos = cli.getApellidoPaterno() + cli.getApellidoMaterno();
        cargar(request, response);
        request.setAttribute("DNI", dni);
        request.setAttribute("cod", cod);
        request.setAttribute("direccion", direccion);
        request.setAttribute("nombres", nombres);
        request.setAttribute("apellidos", apellidos);
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    private void agregarRopa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dni = request.getParameter("DNI");
        int cod = Integer.parseInt(request.getParameter("cod"));
        String direccion = request.getParameter("dire");
        String nombres = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String ropa = request.getParameter("prendas");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        String servicioTotal = request.getParameter("servicio");

        //Creamos array con los datos del servicio
        String[] arr = servicioTotal.split("-");
        //Calculamos costo
        double costoServicio = Double.parseDouble(arr[2]);
        double montotemp = costoServicio * cantidad;
        monto += montotemp;
        lstRopa.add(ropa);
        lstRopaCant.add(cantidad);
        lstRopaServicio.add(arr[1]);
        lstRopaTotal.add(ropa + "-" + cantidad + "-" + arr[1]);
        cargar(request, response);
        request.setAttribute("DNI", dni);
        request.setAttribute("cod", cod);
        request.setAttribute("direccion", direccion);
        request.setAttribute("nombres", nombres);
        request.setAttribute("apellidos", apellidos);
        request.setAttribute("monto", monto);
        request.setAttribute("lstRopaTotal", lstRopaTotal);
        request.getRequestDispatcher("pages/Lavanderia/nuevoPedido.jsp").forward(request, response);
    }

    private void newPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ropa = "";
            BOGestionPedidos bo = new BOGestionPedidos();
            String tipo = request.getParameter("tipo");
            int cod_cliente = Integer.parseInt(request.getParameter("cod"));
            String direccion = request.getParameter("dire");
            String observacion = request.getParameter("obs");
            String fecha_entrega = request.getParameter("fecha_entrega");
            String fecha_estimada = request.getParameter("fecha_estimada");

            SimpleDateFormat sdt = new SimpleDateFormat("yyyy-mm-dd");            
            Date fecha_entregaSQL = sdt.parse(fecha_entrega);
            Date fecha_estimadaSQL = sdt.parse(fecha_estimada);
            String cantidad = "";
            //lstRopa.add(ropa + "-" + cantidad + "-" + arr[1]);
            for (int i = 0; i < lstRopa.size(); i++) {
                ropa += "-" + lstRopa.get(i);
            }
            for (int i = 0; i < lstRopaCant.size(); i++) {
                cantidad += "-" + lstRopaCant.get(i);
            }
            //-Terno Gris-5-Terno de 2 piezas-Terno Gris-5-Terno de 2 piezas

            for (Integer string : lstRopaCant) {
                System.out.println(string);
            }

            for (String string : lstRopa) {
                System.out.println(string);
            }

            Pedidos pe = new Pedidos(cod_cliente, tipo, direccion, fecha_estimadaSQL, ropa, cantidad, observacion, monto, fecha_entregaSQL);
        } catch (Exception e) {
            System.out.println(e);
        }
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
