package Personas;


import java.util.Date;
/**
 *
 * @author CLEVER
 */
public abstract class  Persona {
    protected String nombre;
    protected String apellido;
    protected String dni;
    protected String direccion;
    protected String distrito;
    protected String telefono;
    protected String correo;
    public Persona(){
        
    }

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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
}