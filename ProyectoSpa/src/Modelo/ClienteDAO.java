/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Personas.Cliente;
import javax.swing.table.DefaultTableModel;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author CLEVER
 */
public class ClienteDAO {
    DAO dao = new DAO();
    public void insertarCliente(Cliente cliente) {
            String sql = "INSERT INTO Cliente (NCliente,ACliente,DNI,DirecCliente,DisCliente,Telefono,CoCliente,FechaNac,EstadoCivil) VALUES ('" + cliente.getNombre() + "', '" + cliente.getApellido() + "', '" + cliente.getDni() + "', '" + cliente.getDireccion() + "', '" + cliente.getDistrito() + "', '" + cliente.getTelefono() + "', '" + cliente.getCorreo() + "', '" + cliente.getFechaNacimiento() + "', '" + cliente.getEstadoCivil() + "')";
            dao.SentenciaSQL(sql);
            
        }
    
        public void actualizarCliente(Cliente cliente) {
            String sql = "UPDATE Cliente SET NCliente = '" + cliente.getNombre() + "', ACliente = '" + cliente.getApellido() + "', DNI = '" + cliente.getDni() + "', DirecCliente = '" + cliente.getDireccion() + "', DisCliente = '" + cliente.getDistrito() + "', Telefono = '" + cliente.getTelefono() + "', CoCliente = '" + cliente.getCorreo() + "', FechaNac = '" + cliente.getFechaNacimiento() + "', EstadoCivil = '" + cliente.getEstadoCivil() + "' WHERE DNI  = '" + cliente.getDni() + "'";
            dao.SentenciaSQL(sql);
        }
    
        public void eliminarCliente(Cliente cliente) {
            String sql = "DELETE FROM Cliente WHERE dni = '" + cliente.getDni() + "'";
            dao.SentenciaSQL(sql);
        }
    
        public DefaultTableModel listarClientes() {
            String sql = "SELECT * FROM Cliente";
            ResultSet rs = dao.consultaRegistro(sql);
            DefaultTableModel modelo = new DefaultTableModel();
            modelo.addColumn("Nombre");
            modelo.addColumn("Apellido");
            modelo.addColumn("DNI");
            modelo.addColumn("Direccion");
            modelo.addColumn("Distrito");
            modelo.addColumn("Telefono");
            modelo.addColumn("Correo");
            modelo.addColumn("Fecha de Nacimiento");
            modelo.addColumn("Estado Civil");
            try {
                while (rs.next()) {
                    Object[] fila = new Object[9];
                    fila[0] = rs.getString("nombre");
                    fila[1] = rs.getString("apellido");
                    fila[2] = rs.getString("dni");
                    fila[3] = rs.getString("direccion");
                    fila[4] = rs.getString("distrito");
                    fila[5] = rs.getString("telefono");
                    fila[6] = rs.getString("correo");
                    fila[7] = rs.getString("fechaNacimiento");
                    fila[8] = rs.getString("estadoCivil");
                    modelo.addRow(fila);
                } 
            } catch (SQLException e) {
                System.out.println("Error al listar los clientes: " + e.getMessage());
                    
            }
           return modelo; 

        }
}