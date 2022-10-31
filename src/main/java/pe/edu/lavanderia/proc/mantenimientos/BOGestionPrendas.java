package pe.edu.lavanderia.proc.mantenimientos;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import pe.edu.lavanderia.dao.DaoPrendas;
import pe.edu.lavanderia.dto.DtoPrendasLista;
import pe.edu.lavanderia.entidades.jdbc.Prendas;
import pe.edu.lavanderia.entidades.jdbc.TipoPrenda;
import pe.edu.lavanderia.entidades.jdbc.TipoTela;

@Stateless
@LocalBean
public class BOGestionPrendas {

    public BOGestionPrendas() {
    }

    public List<Prendas> getPrendas() {
        DaoPrendas dao = new DaoPrendas();
        return dao.getPrendas();
    }

    public List<TipoPrenda> getTipoPrendas() {
        DaoPrendas dao = new DaoPrendas();
        return dao.getTipoPrendas();
    }

    public List<TipoTela> getTipoTela() {
        DaoPrendas dao = new DaoPrendas();
        return dao.getTipoTelas();
    }

    public List<DtoPrendasLista> getPrendasList(){
        DaoPrendas dao = new DaoPrendas();
        return dao.getPrendasList();
    }

    public void addPrenda(Prendas ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.addPrendas(ob);
    }

    public void addTipoPrenda(TipoPrenda ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.addTipoPrenda(ob);
    }

    public void addTipoTela(TipoTela ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.addTipoTela(ob);
    }

    public void editPrenda(Prendas ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.editPrendas(ob);
    }

    public void editTipoPrenda(TipoPrenda ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.editTipoPrenda(ob);
    }

    public void editTipoTela(TipoTela ob) {
        DaoPrendas dao = new DaoPrendas();
        dao.editTipoTela(ob);
    }

    public void removePrenda(int cod) {
        DaoPrendas dao = new DaoPrendas();
        dao.removePrendas(cod);
    }

    public void removeTipoPrenda(int cod) {
        DaoPrendas dao = new DaoPrendas();
        dao.removeTipoPrenda(cod);
    }

    public void removeTipoTela(int cod) {
        DaoPrendas dao = new DaoPrendas();
        dao.removeTipoTela(cod);
    }
}
