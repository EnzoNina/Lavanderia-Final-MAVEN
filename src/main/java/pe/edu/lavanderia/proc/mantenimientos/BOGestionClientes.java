package pe.edu.lavanderia.proc.mantenimientos;

import java.util.ArrayList;
import java.util.List;
import pe.edu.lavanderia.dao.DaoClientes;
import pe.edu.lavanderia.entidades.jdbc.Clientes;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import pe.edu.lavanderia.dto.DtoClientes;

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

    public List<DtoClientes> getClientesDTO() {
        List<DtoClientes> lstDto = new ArrayList<DtoClientes>();
        DaoClientes dao = new DaoClientes();
        List<Clientes> lst = dao.getClientes();
        for (Clientes clientes : lst) {
            DtoClientes dto = new DtoClientes();
            dto.setCod(clientes.getCod());
            dto.setNombres(clientes.getNombres());
            dto.setApellidoPaterno(clientes.getApellidoPaterno());
            dto.setApellidoMaterno(clientes.getApellidoMaterno());
            dto.setDni(clientes.getDni());
            dto.setCelular(clientes.getCelular());
            dto.setDireccion(clientes.getDireccion());
            lstDto.add(dto);
        }
        return lstDto;
        
    }

    public boolean login(String user, String pass) {
        DaoClientes dao = new DaoClientes();
        return dao.login(user, pass);
    }
}
