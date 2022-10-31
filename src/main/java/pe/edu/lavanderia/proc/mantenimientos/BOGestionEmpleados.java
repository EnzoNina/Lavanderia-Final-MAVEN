package pe.edu.lavanderia.proc.mantenimientos;

//import entidades.Empleado;
import java.util.ArrayList;
import java.util.List;
import pe.edu.lavanderia.dao.DaoEmpleados;
import pe.edu.lavanderia.entidades.jdbc.Empleados;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import pe.edu.lavanderia.dto.DtoEmpleados;

@Stateless
@LocalBean
public class BOGestionEmpleados {

    public BOGestionEmpleados() {
    }

    public List<Empleados> getEmpleados() {
        DaoEmpleados dao = new DaoEmpleados();
        return dao.getEmpleados();
    }

    public void addEmpleado(Empleados empleado) {
        DaoEmpleados dao = new DaoEmpleados();
        dao.addEmpleado(empleado);
    }

    public void editEmpleado(Empleados empleado) {
        DaoEmpleados dao = new DaoEmpleados();
        dao.editEmpleado(empleado);
    }

    public void removeEmpleado(int cod) {
        DaoEmpleados dao = new DaoEmpleados();
        dao.removeEmpleado(cod);
    }

    public String[] login(String user, String pass) {
        DaoEmpleados dao = new DaoEmpleados();
        return dao.login(user, pass);
    }

    public List<DtoEmpleados> getEmpleadosDTO() {
        List<DtoEmpleados> lstDto = new ArrayList<DtoEmpleados>();
        DaoEmpleados dao = new DaoEmpleados();
        List<Empleados> lst = dao.getEmpleados();

        for (Empleados empleados : lst) {
            DtoEmpleados dto = new DtoEmpleados();
            dto.setCod(empleados.getCod());
            dto.setDni(empleados.getDni());
            dto.setNombre(empleados.getNombre());
            dto.setApellidos(empleados.getApe_paterno() + " " + empleados.getApe_materno());
            dto.setCelular(empleados.getCelular());
            lstDto.add(dto);
        }
        return lstDto;
    }
}
