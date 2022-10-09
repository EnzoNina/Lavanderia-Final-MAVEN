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
import java.sql.PreparedStatement;

import javax.swing.table.DefaultTableModel;
/**
 *
 * @author CLEVER
 */
public class DAO {
    Connection connection = null;
    Statement statement = null;
    Connection conn = null;
    public Connection connect(){
        
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
    public int SentenciaSQL (String strSentenciaSQL)
    {
        try
        {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            pstm.execute();
            return 1;
        }catch(SQLException e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public ResultSet consultaRegistro(String strSentenciaSQL)
    {
        try
        {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            ResultSet respuesta = pstm.executeQuery();
            return respuesta;
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
