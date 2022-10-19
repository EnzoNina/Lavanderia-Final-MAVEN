package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;
import pe.edu.lavanderia.dao.DaoClientes;
import pe.edu.lavanderia.entidades.jdbc.Clientes;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

@Stateless
@LocalBean
public class BOGestionClientes {

    public BOGestionClientes() {

    }

    public List<Clientes> getClientes() {
        DaoClientes dao = new DaoClientes();
        return dao.getClientes();
    }

    public Clientes buscarClientePorDNI(String cadenaBusqueda) {
        DaoClientes dao = new DaoClientes();
        return dao.searchClientes(cadenaBusqueda);
    }

    public void addClientes(Clientes cliente) {
        DaoClientes dao = new DaoClientes();
        dao.addClientes(cliente);
    }

    public void editClientes(Clientes cliente) {
        DaoClientes dao = new DaoClientes();
        dao.editClientes(cliente);
    }

    public void removeClientes(int cod) {
        DaoClientes dao = new DaoClientes();
        dao.removeClientes(cod);
    }

    public boolean login(String user, String pass) {
        DaoClientes dao = new DaoClientes();
        return dao.login(user, pass);
    }
}
