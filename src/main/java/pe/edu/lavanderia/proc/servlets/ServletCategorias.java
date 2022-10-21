package pe.edu.lavanderia.proc.servlets;

import entidades.Categoria;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.lavanderia.dto.DtoCategorias;
import pe.edu.lavanderia.entidades.jdbc.Categorias;
import pe.edu.lavanderia.proc.mantenimientos.BOGestionCategorias;

@WebServlet(name = "ServletCategorias", urlPatterns = {"/ServletCategorias"})
public class ServletCategorias extends HttpServlet {
    
    @EJB
    private BOGestionCategorias bo;

    //final static BOGestionCategorias bo = new BOGestionCategorias();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instruccion = request.getParameter("instruccion");
        
        if (instruccion == null) {
            instruccion = "listar";
        }
        
        switch (instruccion) {
            case "listar":
                getCategorias(request, response);
                break;
            case "new":
                newCategoria(request, response);
                break;
            case "edit":
                editCategoria(request, response);
                break;
            case "delete":
                deleteCategoria(request, response);
                break;
            default:
                throw new AssertionError();
        }
        
    }
    
    private void getCategorias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipo = request.getParameter("tipo");
        
        if (tipo == null) {
            tipo = "administracion";
        }
        
        if (tipo.equalsIgnoreCase("personal")) {
            List<DtoCategorias> lst = bo.getCategoriasDTO();
            request.setAttribute("lst", lst);
            request.getRequestDispatcher("pages/PersonalLavanderia/categorias.jsp").forward(request, response);
        } else if (tipo.equalsIgnoreCase("administracion")) {
            List<Categorias> lst = bo.getCategorias();
            request.setAttribute("list", lst);
            request.getRequestDispatcher("GestionJSP/categorias.jsp").forward(request, response);
        }
    }

    // Metodos
    private void newCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nom");
        String descripcion = request.getParameter("desc");
        boolean estado = false;
        String esta = request.getParameter("estado");
        
        if (esta.equalsIgnoreCase("true")) {
            estado = true;
        } else {
            estado = false;
        }
        
        //Categorias ob = new Categorias(nombre, descripcion, estado);
        Categoria obJPA = new Categoria();
        obJPA.setNomCategoria(nombre);
        obJPA.setDescCategoria(descripcion);
        obJPA.setEstado(estado);
        bo.addCategoriaJPA(obJPA);
        
        if (tipo.equalsIgnoreCase("personal")) {
            response.sendRedirect("ServletCategorias?tipo=personal");
        } else {
            response.sendRedirect("ServletCategorias");
            
        }
        
    }
    
    private void editCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("cod"));
        String nombre = request.getParameter("nom");
        String descripcion = request.getParameter("desc");
        boolean estado = false;
        String esta = request.getParameter("estado");
        
        if (esta.equalsIgnoreCase("true")) {
            estado = true;
        } else {
            estado = false;
        }
        
        Categorias ob = new Categorias(cod, nombre, descripcion, estado);
        bo.editCategoria(ob);
        response.sendRedirect("ServletCategorias");
    }
    
    private void deleteCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("codigo"));
        bo.removeCategoria(cod);
        response.sendRedirect("ServletCategorias");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
