package pe.edu.lavanderia.proc.mantenimientos;

import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.dao.DaoServicios;
import pe.edu.lavanderia.dto.DtoServicios;
import pe.edu.lavanderia.dto.DtoCategorias;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.dao.DaoCategorias;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import pe.edu.lavanderia.entidades.jdbc.Categorias;


@Stateless
@LocalBean
public class BOGestionServicios {
    
    public BOGestionServicios() {
    }
    
    public List<Servicios> getServicios() {
        DaoServicios daoServicio = new DaoServicios();
        return daoServicio.getServicios();
    }
    
    public void addServicio(Servicios ob) {
        DaoServicios dao = new DaoServicios();
        dao.addServicios(ob);
    }
    
    public void editServicio(Servicios ob) {
        DaoServicios dao = new DaoServicios();
        dao.editServicios(ob);
    }
    
    public void removeServicio(int cod) {
        DaoServicios dao = new DaoServicios();
        dao.removeServicios(cod);
    }
    
    public DtoCategorias getServiciosXCategoria(int cod_categoria) {
        DtoCategorias dtoCategorias = new DtoCategorias();
        List<DtoServicios> lstDto = new ArrayList<DtoServicios>();
        DaoServicios dao = new DaoServicios();
        List<Servicios> lst = dao.getServiciosXCategoria(cod_categoria);
        for (Servicios servicios : lst) {
            DtoServicios dto = new DtoServicios();
            dto.setCod(servicios.getCod());
            dto.setNombre(servicios.getNombre());
            dto.setDescripcion(servicios.getDescripcion());
            dto.setPrecio(servicios.getPrecio());
            lstDto.add(dto);
        }
        dtoCategorias.setLstServicios(lstDto);
        DaoCategorias daoCategorias = new DaoCategorias();
        Categorias cat = daoCategorias.getXCodigo(cod_categoria);
        dtoCategorias.setCategorias(cat);
        return dtoCategorias;
    }
    
}
