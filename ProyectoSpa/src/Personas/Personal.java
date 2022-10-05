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
public class Personal extends Persona{
    private String codigoPersonal;
    private String especialidad;

    public Personal(String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito, String EstadoCivil, String codigoPersonal, String especialidad) {
        super(nombre, apellido, dni, correo, telefono, direccion, distrito, EstadoCivil);
        this.codigoPersonal = codigoPersonal;
        this.especialidad = especialidad;
    }
    //Getters and Setters
    public String getCodigoPersonal() {
        return codigoPersonal;
    }
    public void setCodigoPersonal(String codigoPersonal) {
        this.codigoPersonal = codigoPersonal;
    }
    
    

}
