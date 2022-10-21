package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.entidades.jdbc.Servicios;

public class DaoServicios extends DaoGenerico {
    // Metodo para obtener Servicios

    public List<Servicios> getServicios() {
        List<Servicios> serviceList = new ArrayList<Servicios>();// Creamos lista
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT cod_servicio, nom_servicio, desc_servicio, cod_categoria, precio FROM public.servicios";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            // Recorremos
            while (rs.next()) {
                Servicios obServicio = new Servicios(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getDouble(5));
                serviceList.add(obServicio);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    public void addServicios(Servicios servicio) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.servicios (nom_servicio, desc_servicio, cod_categoria, precio) VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, servicio.getNombre());
            stm.setString(2, servicio.getDescripcion());
            stm.setInt(3, servicio.getCod_categoria());
            stm.setDouble(4, servicio.getPrecio());
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

    // Método para editar Servicios
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

    // Método para eliminar Servicios
    public void removeServicios(int cod) {
        Connection cnx = getConexion();
        String sentencia = "DELETE FROM public.servicios WHERE cod_servicio = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, cod);
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

    //Método para consultar por Categoria
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
