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

    public void addPedido(Pedidos ob, String tipo) {
        dao.addPedidos(ob, tipo);
    }

    public void editPedido(Pedidos ob, String tipo) {
        dao.editPedidos(ob, tipo);
    }

    public void removePedido(int cod) {
        dao.removePedidos(cod);
    }

}
