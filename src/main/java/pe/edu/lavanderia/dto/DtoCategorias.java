package pe.edu.lavanderia.dto;

import java.util.List;
import pe.edu.lavanderia.entidades.jdbc.Categorias;

public class DtoCategorias {

    private int cod_categoria;
    private String nombre;
    private String descripcion;

    private Categorias categorias;
    private List<DtoServicios> lstServicios;

    public int getCod_categoria() {
        return cod_categoria;
    }

    public void setCod_categoria(int cod_categoria) {
        this.cod_categoria = cod_categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    

    public Categorias getCategorias() {
        return categorias;
    }

    public void setCategorias(Categorias categorias) {
        this.categorias = categorias;
    }

    public List<DtoServicios> getLstServicios() {
        return lstServicios;
    }

    public void setLstServicios(List<DtoServicios> lstServicios) {
        this.lstServicios = lstServicios;
    }

}
