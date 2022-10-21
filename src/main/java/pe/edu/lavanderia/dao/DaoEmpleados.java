package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.entidades.jdbc.Empleados;

public class DaoEmpleados extends DaoGenerico {

    // Metodo para listar Empleados
    public List<Empleados> getEmpleados() {
        List<Empleados> clientList = new ArrayList<Empleados>();// Creamos arrayList
        Connection conexion = getConexion();// Obtenemos conexion a la base de datos
        // Preparamos sentencia

        String sentencia = "SELECT cod_empleado, dni, nombre, ape_paterno, ape_materno, celular, usuario, contraseña FROM public.empleado";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();// Ejecutamos el query
            // Recorremos el resultado
            while (rs.next()) {
                // Creamos Empleado
                Empleados obEmpleado = new Empleados(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                clientList.add(obEmpleado);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientList;
    }

    // Método para agregar Empleados
    public void addEmpleado(Empleados empleado) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.empleado (dni, nombre, ape_paterno, ape_materno, celular, usuario, contraseña) VALUES(?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, empleado.getDni());
            stm.setString(2, empleado.getNombre());
            stm.setString(3, empleado.getApe_paterno());
            stm.setString(4, empleado.getApe_materno());
            stm.setString(5, empleado.getCelular());
            stm.setString(6, empleado.getUsuario());
            stm.setString(7, empleado.getContraseña());
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

    // Método para editar Empleados
    public void editEmpleado(Empleados empleado) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.empleado SET dni=?, nombre=?, ape_paterno=?, ape_materno=?, celular=?, usuario=?, contraseña=? WHERE cod_empleado = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, empleado.getDni());
            stm.setString(2, empleado.getNombre());
            stm.setString(3, empleado.getApe_paterno());
            stm.setString(4, empleado.getApe_materno());
            stm.setString(5, empleado.getCelular());
            stm.setString(6, empleado.getUsuario());
            stm.setString(7, empleado.getContraseña());
            stm.setInt(8, empleado.getCod());
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

    // Método para eliminar Empleados
    public void removeEmpleado(int cod) {
        Connection cnx = getConexion();
        String sentencia = "DELETE FROM public.empleado WHERE cod_empleado = ?";
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

    public String login(String user, String pass) {
        String tipo = null;
        Connection co = getConexion();
        try {
            String sql = "SELECT tipo FROM empleado WHERE usuario = ? AND contraseña = ?";
            PreparedStatement pst = co.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                tipo = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                co.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        if (tipo == null) {
            tipo = "ninguno";
        }

        return tipo;
    }

}
