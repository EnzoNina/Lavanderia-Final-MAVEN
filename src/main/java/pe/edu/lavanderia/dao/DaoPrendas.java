package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import pe.edu.lavanderia.dto.DtoPrendasLista;
import pe.edu.lavanderia.entidades.jdbc.Prendas;
import pe.edu.lavanderia.entidades.jdbc.TipoPrenda;
import pe.edu.lavanderia.entidades.jdbc.TipoTela;

public class DaoPrendas extends DaoGenerico {

    // Obtenemos Prendas
    public List<Prendas> getPrendas() {
        List<Prendas> list = new ArrayList<Prendas>();
        Connection conexion = getConexion();
        String sentencia = "SELECT * FROM prendas";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prendas ob = new Prendas(rs.getInt(1), rs.getInt(3), rs.getInt(4), rs.getString(2));
                list.add(ob);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return list;
    }

    // Agregamos Prendas
    public void addPrendas(Prendas ob) {
        Connection conexion = getConexion();
        String cadena = "INSERT INTO public.prendas (cod_tipo_prenda,cod_tipo_tela,color) values(?,?,?)";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setInt(1, ob.getCod_tipoPrenda());
            ps.setInt(2, ob.getCod_tipoTela());
            ps.setString(3, ob.getColor());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addTipoPrenda(TipoPrenda ob) {
        Connection con = getConexion();
        String cadena = "INSERT INTO public.tipo_prendas (nombre_tipo_prenda) VALUES(?)";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(cadena);
            ps.setString(1, ob.getTipoPrenda());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addTipoTela(TipoTela ob) {
        Connection con = getConexion();
        String cadena = "INSERT INTO public.tipo_telas (nombre_tipo_tela) VALUES(?)";
        PreparedStatement ps;

        try {
            ps = con.prepareStatement(cadena);
            ps.setString(1, ob.getTipoTela());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Editamos Prendas
    public void editPrendas(Prendas ob) {
        Connection conexion = getConexion();
        String cadena = "UPDATE public.prendas SET cod_tipo_prenda=?, cod_tipo_tela=?, color=? WHERE cod_prenda=?";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setInt(1, ob.getCod_tipoPrenda());
            ps.setInt(2, ob.getCod_tipoTela());
            ps.setString(3, ob.getColor());
            ps.setInt(4, ob.getCod());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void editTipoPrenda(TipoPrenda ob) {
        Connection conexion = getConexion();
        String cadena = "UPDATE public.tipo_prendas SET nombre_tipo_prenda=? WHERE cod_tipo_prenda=?";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setString(1, ob.getTipoPrenda());
            ps.setInt(2, ob.getCodTipoPrenda());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void editTipoTela(TipoTela ob) {
        Connection conexion = getConexion();
        String cadena = "UPDATE public.tipo_telas SET nombre_tipo_tela=? WHERE cod_tipo_tela=?";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(cadena);
            ps.setString(1, ob.getTipoTela());
            ps.setInt(2, ob.getCod_tipoTela());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoPrendas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Remover prendas
    public void removePrendas(int codigo) {
        Connection con = getConexion();
        String sentencia = "DELETE FROM public.prendas WHERE cod_prenda=?";
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

    public void removeTipoPrenda(int codigo) {
        Connection con = getConexion();
        String sentencia = "DELETE FROM public.tipo_prendas WHERE cod_tipo_prenda=?";
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

    public void removeTipoTela(int codigo) {
        Connection con = getConexion();
        String sentencia = "DELETE FROM public.tipo_telas WHERE cod_tipo_tela=?";
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

    public List<TipoTela> getTipoTelas() {
        List<TipoTela> list = new ArrayList<TipoTela>();
        Connection conexion = getConexion();
        String sentencia = "SELECT cod_tipo_tela,nombre_tipo_tela FROM public.tipo_telas";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TipoTela ob = new TipoTela(rs.getInt(1), rs.getString(2));
                list.add(ob);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return list;
    }

    public List<TipoPrenda> getTipoPrendas() {
        List<TipoPrenda> list = new ArrayList<TipoPrenda>();
        Connection conexion = getConexion();
        String sentencia = "SELECT cod_tipo_prenda,nombre_tipo_prenda FROM public.tipo_prendas";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TipoPrenda ob = new TipoPrenda(rs.getInt(1), rs.getString(2));
                list.add(ob);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return list;
    }

    public List<DtoPrendasLista> getPrendasList() {
        List<DtoPrendasLista> lst = new ArrayList<DtoPrendasLista>();
        Connection conexion = getConexion();
        String sql = "select * from prendas  join tipo_prendas  on prendas.cod_tipo_prenda = tipo_prendas.cod_tipo_prenda join tipo_telas on prendas.cod_tipo_tela =tipo_telas.cod_tipo_tela";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DtoPrendasLista ob = new DtoPrendasLista(rs.getInt(1), rs.getString(2), rs.getString(6),
                        rs.getString(8));
                lst.add(ob);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return lst;
    }

}
