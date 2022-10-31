package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.lavanderia.entidades.jdbc.Pedidos;
import pe.edu.lavanderia.entidades.jdbc.VisitaDomiciliaria;

public class DaoPedidos extends DaoGenerico {
    // Metodo para obtener Pedidos

    public List<Pedidos> getPedidos() {
        List<Pedidos> serviceList = new ArrayList<Pedidos>();// Creamos lista
        Connection conexion = getConexion();// Obtenemos conexion
        String sentencia = "SELECT cod_pedido, cod_cliente, cod_empleado, fecha_entrega, observacion, tipo,total FROM public.pedidos";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();
            // Recorremos
            while (rs.next()) {
                Pedidos obpedido = new Pedidos(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getDouble(7));
                serviceList.add(obpedido);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    public int getUltimoCodigo() {
        int cod = 0;
        Connection conexion = getConexion();
        String sql = "select max(cod_pedido) as cod from pedidos; ";
        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            // Recorremos
            while (rs.next()) {
                cod = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cod;
    }

    public void addPedidos(Pedidos ob) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.pedidos (cod_cliente, observacion, fecha_entrega, tipo, cod_empleado,total) VALUES(?,?,?,?, ?, ?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setInt(1, ob.getCod_cliente());
            stm.setString(2, ob.getObservaciones());
            stm.setDate(3, ob.getFecha_entrega());
            stm.setString(4, ob.getTipo());
            stm.setInt(5, ob.getCod_empleado());
            stm.setDouble(6, ob.getTotal());
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

    public void programarVisita(VisitaDomiciliaria ob) {
        Connection cnx = getConexion();
        String sql = "INSERT INTO public.visita_domiciliaria (cod_cliente, prendas, cantidad,fecha_recojo,cod_hora,distrito) VALUES(?, ?, ?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, ob.getCod_cliente());
            stm.setArray(2, cnx.createArrayOf("varchar", ob.getPrendas()));
            stm.setArray(3, cnx.createArrayOf("int4", ob.getCantidad()));
            stm.setDate(4, ob.getFecha_recojo());
            stm.setInt(5, ob.getCod_horario());
            stm.setString(6, ob.getDistrito());
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

    public void addDetallePedido(List<String> lstRopaServicio, List<Integer> lstRopaCant, List<Double> lstSubTotal) {
        int cod_pedido = getUltimoCodigo();
        Connection conexion = getConexion();// Obtenemos conexion

        for (int i = 0; i < lstRopaCant.size(); i++) {
            String sql = "INSERT INTO public.detalle_pedido (cod_pedido, cod_servicio, cantidad, subtotal) VALUES( ?, ?, ?, ?)";
            try {
                PreparedStatement stm = conexion.prepareStatement(sql);
                stm.setInt(1, cod_pedido);
                stm.setInt(2, Integer.parseInt(lstRopaServicio.get(i)));
                stm.setInt(3, lstRopaCant.get(i));
                stm.setDouble(4, lstSubTotal.get(i));
                stm.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }

    }
}
