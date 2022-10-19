package pe.edu.lavanderia.dto;

import java.util.List;
import pe.edu.lavanderia.entidades.jdbc.Categorias;

public class DtoCategorias {

    private Categorias categorias;

    private List<DtoServicios> lstServicios;

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
