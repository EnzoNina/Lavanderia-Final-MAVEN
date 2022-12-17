package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import pe.edu.lavanderia.entidades.jdbc.Clientes;

public class DaoClientes extends DaoGenerico {

    // Metodo para listar Clientes
    public List<Clientes> getClientes() {
        List<Clientes> clientList = new ArrayList<Clientes>();// Creamos arrayList
        Connection conexion = getConexion();// Obtenemos conexion a la base de datos
        // Preparamos sentencia
        String sentencia = "SELECT cod_cliente, nombres, ape_paterno, ape_materno, dni, celular, direccion, usuario,contraseña,correo,estado FROM public.clientes WHERE estado = true";

        PreparedStatement ps;
        try {
            ps = conexion.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();// Ejecutamos el query
            // Recorremos el resultado
            while (rs.next()) {
                // Creamos cliente
                Clientes obCliente = new Clientes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getBoolean(11));
                clientList.add(obCliente);

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
        return clientList;
    }

    // Método para filtrar Clientes
    public Clientes searchClientes(String cadenaBusqueda) {
        Clientes u = new Clientes();
        Connection cnx = getConexion();
        String sentencia = "SELECT cod_cliente, nombres, ape_paterno, ape_materno, dni, celular, direccion FROM public.clientes WHERE dni = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, cadenaBusqueda);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                u.setCod(rs.getInt(1));
                u.setNombre(rs.getString(2));
                u.setApellidoPaterno(rs.getString(3));
                u.setApellidoMaterno(rs.getString(4));
                u.setDni(rs.getString(5));
                u.setCelular(rs.getString(6));
                u.setDireccion(rs.getString(7));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return u;
    }

    // Método para agregar Clientes
    public void addClientes(Clientes cliente) {
        Connection cnx = getConexion();
        String sentencia = "INSERT INTO public.clientes (nombres, ape_paterno, ape_materno, dni, celular, direccion, usuario, contraseña,correo,estado) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, cliente.getNombre());
            stm.setString(2, cliente.getApellidoPaterno());
            stm.setString(3, cliente.getApellidoMaterno());
            stm.setString(4, cliente.getDni());
            stm.setString(5, cliente.getCelular());
            stm.setString(6, cliente.getDireccion());
            stm.setString(7, cliente.getUsuario());
            stm.setString(8, cliente.getContraseña());
            stm.setString(9, cliente.getCorreo());
            stm.setBoolean(10, cliente.getEstado());
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

    // Método para editar Clientes
    public void editClientes(Clientes cliente) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE public.clientes SET nombres = ?, ape_paterno = ?, ape_materno = ?, celular = ?, direccion = ?, usuario = ?, contraseña = ?, dni=?,correo=? WHERE cod_cliente= ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sentencia);
            stm.setString(1, cliente.getNombre());
            stm.setString(2, cliente.getApellidoPaterno());
            stm.setString(3, cliente.getApellidoMaterno());
            stm.setString(4, cliente.getCelular());
            stm.setString(5, cliente.getDireccion());
            stm.setString(6, cliente.getUsuario());
            stm.setString(7, cliente.getContraseña());
            stm.setString(8, cliente.getDni());
            stm.setString(9, cliente.getCorreo());
            stm.setInt(10, cliente.getCod());
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

    // Método para eliminar Clientes
    public void removeClientes(Boolean estado, int cod) {
        Connection cnx = getConexion();
        String sentencia = "UPDATE  public.clientes SET estado = ?WHERE cod_cliente = ?";
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

        String dni = null;
        String[] array = new String[3];
        String cod = null;
        String nombre =null;

        Connection co = getConexion();
        try {
            String sql = "SELECT dni,cod_cliente,nombres FROM clientes WHERE usuario = ? AND contraseña = ?";
            PreparedStatement pst = co.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);           
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                dni = rs.getString(1);
                cod = rs.getString(2);
                nombre=rs.getString(3);
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

        if (dni != null) {
            dni = dni;
        } else {
            dni = "";
        }

        array[0] = cod;
        array[1] = dni;
        array[2]=nombre;

        return array;
    }

}
