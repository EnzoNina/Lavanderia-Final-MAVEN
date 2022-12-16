package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import pe.edu.lavanderia.dao.DaoPedidos;
import pe.edu.lavanderia.dto.DtoPrendaListaMostrar;
import pe.edu.lavanderia.dto.DtoServicios;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;

@Stateless
@LocalBean
public class BOGestionPedidos {

    public BOGestionPedidos() {
    }

    final static DaoPedidos dao = new DaoPedidos();

    public List<Pedidos> getPedidos() {        
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

    public void addDetallePedido(List<DtoServicios> lstRopaServicio,List<Double>lstSubTotal) {
        dao.addDetallePedido(lstRopaServicio,lstSubTotal);
    }

    public void addPrendas(List<DtoPrendaListaMostrar> lstRopaMandar) {
        dao.addPrendas(lstRopaMandar);
    }

    public List<VisitaDomiciliaria> getVisitas(int codCliente) {
        return dao.getVisitas(codCliente);
    }
    public List<VisitaDomiciliaria> getAllVisitas(){
        return dao.getAllVisitas();
    }

}
