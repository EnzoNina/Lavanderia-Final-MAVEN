package pe.edu.lavanderia.proc.mantenimientos;

//import entidades.Servicio;
import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.dao.DaoServicios;
import pe.edu.lavanderia.dto.DtoServicios;
import pe.edu.lavanderia.dto.DtoCategorias;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import pe.edu.lavanderia.dao.DaoCategorias;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import pe.edu.lavanderia.entidades.jdbc.Categorias;

@Stateless
@LocalBean
public class BOGestionServicios {

    /*@PersistenceContext(unitName = "Lavanderia-JPA")
    private EntityManager em;*/
    public BOGestionServicios() {
    }

    public List<Servicios> getServicios() {
        DaoServicios daoServicio = new DaoServicios();
        return daoServicio.getServicios();
    }

    /*    public void addServicioJPA(Servicio ob) {
        em.persist(ob);
    }*/
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

    public List<DtoServicios> getServiciosDTO() {
        List<DtoServicios> lstDto = new ArrayList<DtoServicios>();

        DaoServicios dao = new DaoServicios();

        List<Servicios> lst = dao.getServicios();

        for (Servicios servicios : lst) {

            DtoServicios dto = new DtoServicios();

            dto.setCod(servicios.getCod());
            dto.setNombre(servicios.getNombre());
            dto.setDescripcion(servicios.getDescripcion());
            dto.setPrecio(servicios.getPrecio());
            lstDto.add(dto);
        }
        return lstDto;
    }

    public DtoCategorias getServiciosXCategoria(int cod_categoria) {
        //Creamos DTO
        DtoCategorias dtoCategorias = new DtoCategorias();
        //creamos lista de DtoServicios
        List<DtoServicios> lstDto = new ArrayList<DtoServicios>();
        //Creamos Dao de servicios
        DaoServicios dao = new DaoServicios();
        //Obtenemos la lista de servicios
        List<Servicios> lst = dao.getServiciosXCategoria(cod_categoria);

        for (Servicios servicio : lst) {
            DtoServicios dto = new DtoServicios();
            dto.setCod(servicio.getCod());
            dto.setNombre(servicio.getNombre());
            dto.setDescripcion(servicio.getDescripcion());
            dto.setPrecio(servicio.getPrecio());
            lstDto.add(dto);
        }
        //Establecemos la lista de DTOServicios
        dtoCategorias.setLstServicios(lstDto);
        //creamos dato categorias
        DaoCategorias daoCategorias = new DaoCategorias();
        //Obtenemos la categoria
        Categorias cat = daoCategorias.getXCodigo(cod_categoria);
        //Establecemos los datos
        dtoCategorias.setCod_categoria(cat.getCod_categoria());
        dtoCategorias.setNombre(cat.getNombre());
        dtoCategorias.setDescripcion(cat.getDescripcion());
        return dtoCategorias;
    }

}
