package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;

import pe.edu.lavanderia.dao.DaoServicios;
import pe.edu.lavanderia.entidades.jdbc.Servicios;

public class BOGestionServicios {

    public List<Servicios> getServicios() {
        DaoServicios daoService = new DaoServicios();
        return daoService.getServicios();
    }

}
