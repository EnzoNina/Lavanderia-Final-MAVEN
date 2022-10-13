package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;

import pe.edu.lavanderia.dao.DaoPedidos;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;

public class BOGestionPedidos {

    final static DaoPedidos dao = new DaoPedidos();

    public List<Pedidos> getPedidos() {
        DaoPedidos dao = new DaoPedidos();
        return dao.getPedidos();
    }

    public void addServicio(Pedidos ob) {
        dao.addPedidos(ob);
    }

    public void editServicio(Pedidos ob) {
        dao.editPedidos(ob);
    }

    public void removeServicio(int cod) {
        dao.removePedidos(cod);
    }

}
