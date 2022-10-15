package pe.edu.lavanderia.proc.mantenimientos;

import java.util.List;

import pe.edu.lavanderia.dao.DaoCategorias;
import pe.edu.lavanderia.entidades.jdbc.Categorias;

public class BOGestionCategorias {
    final static DaoCategorias dao = new DaoCategorias();

    public List<Categorias> getCategorias() {
        return dao.getCategorias();
    }
    
    public List<Integer> getCodCategorias(){
        return dao.getCodCategorias();
    }

    public void addCategoria(Categorias ob) {
        dao.addCategoria(ob);
    }

    public void editCategoria(Categorias ob) {
        dao.editCategoria(ob);
    }

    public void removeCategoria(int cod) {
        dao.remoteCategoria(cod);
    }

}
