package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.entidades.jdbc.Pedidos;

public class DaoPedidos extends DaoGenerico {
    // Metodo para obtener Pedidos

    public List<Pedidos> getPedidos() {
        List<Pedidos> serviceList = new ArrayList<Pedidos>();// Creamos lista
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT cod_pedido, cod_cliente, direccion, horario, prendas, cantidad, observacion, monto, fecha_entrega FROM public.Pedidos";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            // Recorremos
            while (rs.next()) {
                Pedidos obpedido = new Pedidos(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6),rs.getString(7),rs.getDouble(8),rs.getDate(9));
                serviceList.add(obpedido);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    public void addPedidos(Pedidos pedido) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.Pedidos (cod_pedido, cod_cliente, direccion, horario, prendas, cantidad, observacion, monto, fecha_entrega) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, pedido.getCod());
            stm.setInt(2, pedido.getCod_cliente());
            stm.setString(3, pedido.getDireccion());
            stm.setString(4, pedido.getHorario());
            stm.setString(5, pedido.getPrendas());
            stm.setInt(6, pedido.getCantidad());
            stm.setString(7, pedido.getObservacion());
            stm.setDouble(8, pedido.getMonto());
            stm.setDate(9, (java.sql.Date) pedido.getFecha_entrega());
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

    // Método para editar Pedidos
    public void editPedidos(Pedidos pedido) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.pedidos SET cod_cliente = ?, direccion = ?, horario = ?, prendas = ?, cantidad = ?, observacion = ?, monto = ?, fecha_entrega = ? WHERE cod_pedido = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, pedido.getCod_cliente());
            stm.setString(2, pedido.getDireccion());
            stm.setString(3, pedido.getHorario());
            stm.setString(4, pedido.getPrendas());
            stm.setInt(5, pedido.getCantidad());
            stm.setString(6, pedido.getObservacion());
            stm.setDouble(7, pedido.getMonto());
            stm.setDate(8, (java.sql.Date) pedido.getFecha_entrega());
            stm.setInt(9, pedido.getCod());
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

    // Método para eliminar Pedidos
    public void removePedidos(int cod) {
        Connection cnx = getConexion();
        String sentencia = "DELETE FROM public.pedidos WHERE cod_pedido = ?";
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

}
