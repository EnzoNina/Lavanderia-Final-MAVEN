package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.lavanderia.entidades.jdbc.Servicios;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoServicios extends DaoGenerico {
    // Metodo para obtener Servicios

    public List<Servicios> getServicios() {
        List<Servicios> serviceList = new ArrayList<Servicios>();// Creamos lista
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT cod_servicio, nom_servicio, desc_servicio, cod_categoria, precio, estado FROM public.servicios WHERE estado = true";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            // Recorremos
            while (rs.next()) {
                Servicios obServicio = new Servicios(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getDouble(5), rs.getBoolean(6));
                serviceList.add(obServicio);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(DaoCategorias.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return serviceList;
    }

    public void addServicios(Servicios servicio) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.servicios (nom_servicio, desc_servicio, cod_categoria, precio,estado) VALUES (?, ?, ?, ?,?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, servicio.getNombre());
            stm.setString(2, servicio.getDescripcion());
            stm.setInt(3, servicio.getCod_categoria());
            stm.setDouble(4, servicio.getPrecio());
            stm.setBoolean(5, servicio.getEstado());
            stm.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    // M??todo para editar Servicios
    public void editServicios(Servicios servicio) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.servicios SET nom_servicio=?, desc_servicio=?, cod_categoria=?, precio=? WHERE cod_servicio = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, servicio.getNombre());
            stm.setString(2, servicio.getDescripcion());
            stm.setInt(3, servicio.getCod_categoria());
            stm.setDouble(4, servicio.getPrecio());
            stm.setInt(5, servicio.getCod());
            stm.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    // M??todo para eliminar Servicios
    public void removeServicios(Boolean estado, int cod) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.servicios SET estado = ? WHERE cod_servicio = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setBoolean(1, estado);
            stm.setInt(2, cod);
            stm.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    // M??todo para consultar por Categoria
    public List<Servicios> getServiciosXCategoria(int cod_categoria) {
        List<Servicios> serviceList = new ArrayList<Servicios>();// Creamos lista
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT cod_servicio, nom_servicio, desc_servicio, precio FROM public.servicios WHERE cod_categoria = ? ";

        try {
            PreparedStatement stm = conexion.prepareStatement(sentencia);
            stm.setInt(1, cod_categoria);
            ResultSet rs = stm.executeQuery();

            // Recorremos
            while (rs.next()) {
                Servicios s = new Servicios();
                s.setCod(rs.getInt(1));
                s.setNombre(rs.getString(2));
                s.setDescripcion(rs.getString(3));
                s.setPrecio(rs.getDouble(4));
                serviceList.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conexion.close();
            } catch (Exception e2) {
                throw new RuntimeException(e2);
            }
        }

        return serviceList;
    }
}
