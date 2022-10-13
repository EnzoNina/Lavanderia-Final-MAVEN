package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;

import pe.edu.lavanderia.dao.DaoServicios;
import pe.edu.lavanderia.entidades.jdbc.Servicios;

public class BOGestionServicios {

    final static DaoServicios dao = new DaoServicios();

    public List<Servicios> getServicios() {
        DaoServicios daoServicio = new DaoServicios();
        return daoServicio.getServicios();
    }

    public void addServicio(Servicios ob) {
        dao.addServicios(ob);
    }

    public void editServicio(Servicios ob) {
        dao.editServicios(ob);
    }

    public void removeServicio(int cod) {
        dao.removeServicios(cod);
    }

}
