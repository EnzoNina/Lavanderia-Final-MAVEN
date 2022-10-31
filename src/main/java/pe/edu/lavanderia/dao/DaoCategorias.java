package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import pe.edu.lavanderia.entidades.jdbc.Categorias;

public class DaoCategorias extends DaoGenerico {

    // Obtenemos categorias
    public List<Categorias> getCategorias() {
        List<Categorias> list = new ArrayList<Categorias>();
        Connection conexion = getConexion();
        String sentencia = "SELECT cod_categoria, nom_categoria, desc_categoria, estado FROM public.categorias";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Categorias ob = new Categorias(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
                list.add(ob);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return list;
    }

    // Agregamos categorias
    public void addCategoria(Categorias ob) {
        Connection conexion = getConexion();
        String cadena = "INSERT INTO public.categorias (nom_categoria,desc_categoria,estado) values(?,?,?)";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setString(1, ob.getNombre());
            ps.setString(2, ob.getDescripcion());
            ps.setBoolean(3, ob.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoCategorias.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Editamos categorias
    public void editCategoria(Categorias ob) {
        Connection conexion = getConexion();
        String cadena = "UPDATE public.categorias SET nom_categoria=?, desc_categoria=?, estado=? WHERE cod_categoria=?";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setString(1, ob.getNombre());
            ps.setString(2, ob.getDescripcion());
            ps.setBoolean(3, ob.getEstado());
            ps.setInt(4, ob.getCod_categoria());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoCategorias.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Remover categorias
    public void remoteCategoria(int codigo) {
        Connection con = getConexion();
        String sentencia = "DELETE FROM public.categorias WHERE cod_categoria=?";
        try {
            PreparedStatement ps = con.prepareStatement(sentencia);
            ps.setInt(1, codigo);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public List<Integer> getCodCategorias() {
        List<Integer> list = new ArrayList<Integer>();
        Connection conexion = getConexion();
        String sentencia = "SELECT cod_categoria FROM public.categorias";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cod = rs.getInt("cod_categoria");
                list.add(cod);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return list;
    }

    public Categorias getXCodigo(int cod_categoria) {
        Categorias c = new Categorias();
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT nom_categoria,desc_categoria FROM public.categorias WHERE cod_categoria=?";

        try {
            PreparedStatement stm = conexion.prepareStatement(sentencia);
            stm.setInt(1, cod_categoria);
            ResultSet rs = stm.executeQuery();

            // Recorremos
            while (rs.next()) {
                c.setCod_categoria(cod_categoria);
                c.setNombre(rs.getString(1));
                c.setDescripcion(rs.getString("desc_categoria"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

}
