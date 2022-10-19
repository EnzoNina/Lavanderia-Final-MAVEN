package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;
import pe.edu.lavanderia.dao.DaoCategorias;
import pe.edu.lavanderia.entidades.jdbc.Categorias;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

@Stateless
@LocalBean
public class BOGestionCategorias {

    public BOGestionCategorias() {
    }

    public List<Categorias> getCategorias() {
        DaoCategorias dao = new DaoCategorias();
        return dao.getCategorias();
    }

    public List<Integer> getCodCategorias() {
        DaoCategorias dao = new DaoCategorias();
        return dao.getCodCategorias();
    }

    public void addCategoria(Categorias ob) {
        DaoCategorias dao = new DaoCategorias();
        dao.addCategoria(ob);
    }

    public void editCategoria(Categorias ob) {
        DaoCategorias dao = new DaoCategorias();
        dao.editCategoria(ob);
    }

    public void removeCategoria(int cod) {
        DaoCategorias dao = new DaoCategorias();
        dao.remoteCategoria(cod);
    }

}
