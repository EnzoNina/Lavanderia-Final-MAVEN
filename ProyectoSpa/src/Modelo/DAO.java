
package Modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;


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
    public void SentenciaSQL(String sql) {
        try {
            connection = connect();
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la sentencia SQL: " + e.getMessage());
        }
    }
    public ResultSet consultaRegistro(String sql) {
        ResultSet rs = null;
        try {
            connection = connect();
            statement = connection.createStatement();
            rs = statement.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la consulta: " + e.getMessage());
        }
        return rs;
    }
    
}
