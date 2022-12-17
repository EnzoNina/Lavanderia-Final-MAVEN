package pe.edu.lavanderia.proc.servlets;

//import entidades.Servicio;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.dto.DtoPrendasLista;

import pe.edu.lavanderia.entidades.jdbc.Prendas;
import pe.edu.lavanderia.entidades.jdbc.TipoPrenda;
import pe.edu.lavanderia.entidades.jdbc.TipoTela;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionPrendas;

@WebServlet(name = "ServletPrendas", urlPatterns = {"/ServletPrendas"})
public class ServletPrendas extends HttpServlet {

    @EJB
    private BOGestionPrendas bo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listar";
        }

        switch (instruccion) {
            case "listar":
                getPrendas(request, response);
                break;
            case "new":
                newPrenda(request, response);
                break;
            case "edit":
                editPrenda(request, response);
                break;
            case "delete":
                deletePrenda(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void getPrendas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<DtoPrendasLista> lst = bo.getPrendasList();
        List<TipoPrenda> lstTipoPrenda = bo.getTipoPrendas();
        List<TipoTela> lstTipoTela = bo.getTipoTela();

        request.setAttribute("lst", lst);
        request.setAttribute("lstTipoPrenda", lstTipoPrenda);
        request.setAttribute("lstTipoTela", lstTipoTela);

        String tipoLogin = (String) request.getSession().getAttribute("tipoLogin");

        if (tipoLogin.equalsIgnoreCase("personal")) {
            request.getRequestDispatcher("pages/PersonalLavanderia/prendas.jsp").forward(request, response);
        } else if (tipoLogin.equalsIgnoreCase("administrador")) {
            request.getRequestDispatcher("pages/Lavanderia/prendas.jsp").forward(request, response);
        }
    }

    // Metodos
    private void newPrenda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        if (tipo.equalsIgnoreCase("prenda")) {
            int tipoPrenda = Integer.parseInt(request.getParameter("tipoPrenda"));
            int tipoTela = Integer.parseInt(request.getParameter("tipoTela"));
            String color = request.getParameter("color");
            Prendas ob = new Prendas(tipoPrenda, tipoTela, color);
            bo.addPrenda(ob);
        } else if (tipo.equalsIgnoreCase("tipoPrenda")) {
            String TP = request.getParameter("TP");
            bo.addTipoPrenda(new TipoPrenda(TP));
        } else if (tipo.equalsIgnoreCase("tipoTela")) {
            String TT = request.getParameter("TT");
            bo.addTipoTela(new TipoTela(TT));
        }
        response.sendRedirect("ServletPrendas");
    }

    private void editPrenda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        if (tipo.equalsIgnoreCase("prenda")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            int tipoPrenda = Integer.parseInt(request.getParameter("tipoPrenda"));
            int tipoTela = Integer.parseInt(request.getParameter("tipoTela"));
            System.out.println("TIPO TELA : " + tipoTela);
            String color = request.getParameter("color");
            Prendas ob = new Prendas(cod, tipoPrenda, tipoTela, color);
            bo.editPrenda(ob);
        } else if (tipo.equalsIgnoreCase("tipoPrenda")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            String TP = request.getParameter("TP");
            bo.editTipoPrenda(new TipoPrenda(cod, TP));
        } else if (tipo.equalsIgnoreCase("tipoTela")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            String TT = request.getParameter("TT");
            bo.editTipoTela(new TipoTela(cod, TT));
        }
        response.sendRedirect("ServletPrendas");
    }

    private void deletePrenda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        if (tipo.equalsIgnoreCase("prenda")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            bo.removePrenda(cod);
        } else if (tipo.equalsIgnoreCase("tipoPrenda")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            bo.removeTipoPrenda(cod);
        } else if (tipo.equalsIgnoreCase("tipoTela")) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            bo.removeTipoTela(cod);
        }

        response.sendRedirect("ServletPrendas");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
