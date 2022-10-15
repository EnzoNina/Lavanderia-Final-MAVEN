package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.Date;
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
        String sentencia = "SELECT cod_pedido, cod_cliente,tipo , direccion, horario, prendas, cantidad, observacion, monto, fecha_entrega, tipo FROM public.Pedidos";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();

            // Recorremos
            while (rs.next()) {
                Pedidos obpedido = new Pedidos(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getDate(10));
                serviceList.add(obpedido);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    public void addPedidos(Pedidos pedido, String tipo) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.Pedidos (cod_pedido, cod_cliente, tipo, direccion, horario, prendas, cantidad, observacion, monto, fecha_entrega) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, pedido.getCod());
            stm.setInt(2, pedido.getCod_cliente());
            stm.setString(3, tipo);
            stm.setString(4, pedido.getDireccion());
            stm.setDate(5, (Date) pedido.getFecha_estimada());
            stm.setString(6, pedido.getPrendas());
            stm.setString(7, pedido.getCantidad());
            stm.setString(8, pedido.getObservacion());
            stm.setDouble(9, pedido.getMonto());
            stm.setDate(10, (Date) pedido.getFecha_entrega());
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
    public void editPedidos(Pedidos pedido, String tipo) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.pedidos SET cod_cliente = ?, tipo=? ,direccion = ?, horario = ?, prendas = ?, cantidad = ?, observacion = ?, monto = ?, fecha_entrega = ? WHERE cod_pedido = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, pedido.getCod_cliente());
            stm.setString(2, tipo);
            stm.setString(3, pedido.getDireccion());
            stm.setDate(4, (Date) pedido.getFecha_estimada());
            stm.setString(5, pedido.getPrendas());
            stm.setString(6, pedido.getCantidad());
            stm.setString(7, pedido.getObservacion());
            stm.setDouble(8, pedido.getMonto());
            stm.setDate(9, (Date) pedido.getFecha_entrega());
            stm.setInt(10, pedido.getCod());
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
