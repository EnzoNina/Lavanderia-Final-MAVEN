
package Personas;
import java.util.Date;

/**
 *
 * @author CLEVER
 */
public class Cliente extends Persona{
    
    private String FechaNacimiento;
    private String EstadoCivil;
    
    public Cliente() {
    }

    public Cliente(String nombre, String apellido, String dni, String direccion,
            String distrito, String telefono, String correo,
            String IDCliente,String FechaNacimiento,String EstadoCivil) {
        super(nombre, apellido, dni, direccion,distrito,telefono,correo);
        
        this.FechaNacimiento = FechaNacimiento;
        this.EstadoCivil = EstadoCivil;
        
    }

    
    
    //Getters and Setters

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getEstadoCivil() {
        return EstadoCivil;
    }

    public void setEstadoCivil(String EstadoCivil) {
        this.EstadoCivil = EstadoCivil;
    }
    
    
    
    
    
    
    
}
