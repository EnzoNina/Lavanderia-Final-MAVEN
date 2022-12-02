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

import pe.edu.lavanderia.dto.DtoPrendaListaMostrar;
import pe.edu.lavanderia.dto.DtoPrendasLista;
import pe.edu.lavanderia.dto.DtoServicios;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPedidos;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPrendas;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionServicios;

@WebServlet(name = "ServletVisitaDomiciliaria", urlPatterns = { "/ServletVisitaDomiciliaria" })
public class ServletVisitaDomiciliaria extends HttpServlet {

    // Atributos
    List<String> listaPrendas = new ArrayList<String>();
    List<DtoPrendaListaMostrar> lstRopaMandar = new ArrayList<DtoPrendaListaMostrar>();
    List<Integer> listaCantidad = new ArrayList<Integer>();
    List<DtoServicios> lstServicio = new ArrayList<DtoServicios>();
    List<Integer> codServicios = new ArrayList<Integer>();

    @EJB
    private BOGestionServicios boServicios;

    @EJB
    private BOGestionPrendas boPrendas;

    @EJB
    private BOGestionPedidos boPedidos;

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
            case "addRopa":
                addRopa(request, response);
                break;
            case "agregarServicio":
                addServicio(request, response);
                break;
            case "new":
                newVisita(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void addRopa(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int codRopa = Integer.parseInt(request.getParameter("codigoPrenda"));
        String tipoPrenda = request.getParameter("tp");
        String tipoTela = request.getParameter("tt");
        String color = request.getParameter("color");
        // Obtenemos la cantida de la ropa
        int cantidadRopa = Integer.parseInt(request.getParameter("cantidad"));

        // Creamos objeto de DtoPrendasMostrar
        DtoPrendaListaMostrar obDtoMostrar = new DtoPrendaListaMostrar(codRopa, tipoPrenda, tipoTela, color,
                cantidadRopa);

        // Agregamos ropa y cantidad
        listaCantidad.add(cantidadRopa);
        listaPrendas.add( String.valueOf(codRopa));
        lstRopaMandar.add(obDtoMostrar);

        request.getSession().setAttribute("listaRopa", lstRopaMandar);
        request.getRequestDispatcher("pages/User/visitaDomiciliaria.jsp").forward(request, response);
    }

    private void cargarServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Servicios> lst = boServicios.getServicios();
        List<DtoPrendasLista> lstPrendasDTO = boPrendas.getPrendasList();

        // Mandamos la lista de servicios y la lista de prendas
        request.getSession().setAttribute("list", lst);
        request.getSession().setAttribute("lstPrendas", lstPrendasDTO);

        request.getRequestDispatcher("pages/User/visitaDomiciliaria.jsp").forward(request, response);
    }

    private void addServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servicioTotal = request.getParameter("servicio");
        // Creamos array con los datos del servicio
        String[] arrPartes = servicioTotal.split("-");

        // Creamos objeto de servicio
        DtoServicios obServicio = new DtoServicios(Integer.parseInt(arrPartes[0]), arrPartes[1],
                Double.parseDouble(arrPartes[2]));
        // Agregamos el objeto a la lista
        lstServicio.add(obServicio);
        codServicios.add(Integer.parseInt(arrPartes[0]));

        request.getSession().setAttribute("listaServicio", lstServicio); // Establecemos la lista de servicio
        request.getRequestDispatcher("pages/User/visitaDomiciliaria.jsp").forward(request, response);
    }

    private void newVisita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos el codigo del cliente
        int codCliente = Integer.parseInt((String) request.getSession().getAttribute("DNI"));
        // Creamos el array de la cantida
        // Obtenemos fecha
        String fecha = request.getParameter("fecha_recojo");
        int cod_hora = Integer.parseInt(request.getParameter("hora"));
        Date fecha_recojo = Date.valueOf(fecha);
        // Obtenemos distrito
        String distrito = request.getParameter("distrito");

        // Creamos el array de las prendas
        String[] arrPrendas = new String[listaPrendas.size()];
        arrPrendas = listaPrendas.toArray(arrPrendas);

        // Creamos el array de la cantidad de prendas
        Integer[] arrCantidad = new Integer[listaCantidad.size()];
        arrCantidad = listaCantidad.toArray(arrCantidad);

        // Creamos el array de los codigos de servicios
        Integer[] arrServicios = new Integer[codServicios.size()];
        arrServicios = codServicios.toArray(arrServicios);

        VisitaDomiciliaria visita = new VisitaDomiciliaria(codCliente, arrPrendas, arrCantidad, fecha_recojo, cod_hora,
                distrito, arrServicios);

        boPedidos.programarVisita(visita);

        request.getRequestDispatcher("pages/User/menuUser.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
