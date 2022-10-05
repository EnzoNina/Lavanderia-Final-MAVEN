/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
    protected String telefono;
    protected String correo;
    protected String distrito;
    //protected Date fechaNacimiento;
    protected String EstadoCivil;

    public Persona( String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito, String EstadoCivil) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.distrito = distrito;
        //this.fechaNacimiento = new Date();
        this.EstadoCivil = EstadoCivil;
    }
    //Getters and Setters
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
    
    public String getEstadoCivil() {
        return EstadoCivil;
    }
    public void setEstadoCivil(String estadoCivil) {
        EstadoCivil = estadoCivil;
    }
}
