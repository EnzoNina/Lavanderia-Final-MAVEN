/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author CLEVER
 */
public class DAO {
    Connection connection = null;
    Statement statement = null;
    
    public Connection connect(){
        Connection conn = null;
        try
        {
            conn=DriverManager.getConnection("jdbc:sqlite:ProyectoSpa.db");
            System.out.println("Conectado");
        }catch(SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return conn;
    }
    
}
