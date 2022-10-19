package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;
import pe.edu.lavanderia.dao.DaoEmpleados;
import pe.edu.lavanderia.entidades.jdbc.Empleados;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

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

    public boolean login(String user, String pass) {
        DaoEmpleados dao = new DaoEmpleados();
        return dao.login(user, pass);
    }
}
