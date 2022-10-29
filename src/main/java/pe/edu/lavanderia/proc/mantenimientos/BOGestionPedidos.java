package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import pe.edu.lavanderia.dao.DaoPedidos;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;

@Stateless
@LocalBean
public class BOGestionPedidos {

    public BOGestionPedidos() {
    }

    final static DaoPedidos dao = new DaoPedidos();

    public List<Pedidos> getPedidos() {
        DaoPedidos dao = new DaoPedidos();
        return dao.getPedidos();
    }

    public void addPedido(Pedidos ob) {
        dao.addPedidos(ob);
    }

    public void editPedido(Pedidos ob, String tipo) {
        dao.editPedidos(ob, tipo);
    }

    public void removePedido(int cod) {
        dao.removePedidos(cod);
    }

    public void programarVisita(VisitaDomiciliaria ob) {
        dao.programarVisita(ob);
    }

    public void addDetallePedido(List<String> lstRopaServicio, List<Integer> lstRopaCant,List<Double>lstSubTotal) {
        dao.addDetallePedido(lstRopaServicio, lstRopaCant,lstSubTotal);
    }

}
