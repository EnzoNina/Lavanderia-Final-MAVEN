package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;

import pe.edu.lavanderia.dao.DaoClientes;
import pe.edu.lavanderia.entidades.jdbc.Clientes;

public class BOGestionClientes {

	public List<Clientes> getClientes() {
		DaoClientes daoCliente = new DaoClientes();
		return daoCliente.getClientes();
	}

	public List<Clientes> searchClientes(String cadenaBusqueda) {
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
}
