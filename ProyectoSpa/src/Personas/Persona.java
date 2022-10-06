package Personas;


import java.util.Date;
/**
 *
 * @author CLEVER
 */
public class Persona {
    protected String nombre;
    protected String apellido;
    protected String dni;
    protected String direccion;
    protected String distrito;
    protected String telefono;
    protected String correo;

    public Persona( String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.distrito = distrito;
        this.telefono = telefono;
        this.correo = correo;
    }
    //GETTER AND SETTER
    
}