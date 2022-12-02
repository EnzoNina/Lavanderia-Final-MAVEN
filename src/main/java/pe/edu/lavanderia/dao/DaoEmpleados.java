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

        String sentencia = "SELECT cod_empleado,usuario,tipo,nombre,ape_paterno,ape_materno,dni,celular,contraseña,estado FROM public.empleado WHERE estado = true";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();// Ejecutamos el query
            // Recorremos el resultado
            while (rs.next()) {
                // Creamos Empleado
                Empleados obEmpleado = new Empleados(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getBoolean(10));
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
        String sentencia = "INSERT INTO public.empleado (dni, nombre, ape_paterno, ape_materno, celular, usuario, contraseña,tipo,estado) VALUES(?, ?, ?, ?, ?, ?, ?,?,?);";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, empleado.getDni());
            stm.setString(2, empleado.getNombre());
            stm.setString(3, empleado.getApellidoPaterno());
            stm.setString(4, empleado.getApellidoMaterno());
            stm.setString(5, empleado.getCelular());
            stm.setString(6, empleado.getUsuario());
            stm.setString(7, empleado.getContraseña());
            stm.setString(8, empleado.getTipo());
            stm.setBoolean(9, empleado.getEstado());
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
        String sentencia = "UPDATE public.empleado SET dni=?, nombre=?, ape_paterno=?, ape_materno=?, celular=?, usuario=?, contraseña=?,tipo=? WHERE cod_empleado = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, empleado.getDni());
            stm.setString(2, empleado.getNombre());
            stm.setString(3, empleado.getApellidoPaterno());
            stm.setString(4, empleado.getApellidoMaterno());
            stm.setString(5, empleado.getCelular());
            stm.setString(6, empleado.getUsuario());
            stm.setString(7, empleado.getContraseña());
            stm.setString(8, empleado.getTipo());
            stm.setInt(9, empleado.getCod());
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
    public void removeEmpleado(Boolean estado,int cod) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.empleado SET estado=? WHERE cod_empleado = ?";
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

    public String[] login(String user, String pass) {
        String tipo = null;
        String cod_empleado = "";
        String nom_empleado = "";
        Connection co = getConexion();
        String[] arr = new String[3];
        try {
            String sql = "SELECT cod_empleado,tipo,nombre FROM empleado WHERE usuario = ? AND contraseña = ?";
            PreparedStatement pst = co.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cod_empleado = rs.getString(1);
                tipo = rs.getString(2);
                nom_empleado=rs.getString(3);
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

        arr[0] = cod_empleado;
        arr[1] = tipo;
        arr[2] = nom_empleado;

        return arr;
    }

}
