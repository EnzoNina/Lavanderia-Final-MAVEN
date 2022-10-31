package pe.edu.lavanderia.dto;

import java.util.List;

public class DtoCategorias {

    //Datos del DTO
    private int cod_categoria;
    private String nombre;
    private String descripcion;
    //Datos de categorias
    //private Categorias categorias;
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

    public List<DtoServicios> getLstServicios() {
        return lstServicios;
    }

    public void setLstServicios(List<DtoServicios> lstServicios) {
        this.lstServicios = lstServicios;
    }
}
