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
public class Cliente extends Persona{
    private String codigoCliente;

    public Cliente(String nombre, String apellido, String dni, String correo,
            String telefono, String direccion,String distrito, String EstadoCivil,
            String codigoCliente) {
        super(nombre, apellido, dni, correo, telefono, direccion,distrito, EstadoCivil);
        this.codigoCliente = codigoCliente;
    }
    //Getters and Setters
    public String getCodigoCliente() {
        return codigoCliente;
    }
    public void setCodigoCliente(String codigoCliente) {
        this.codigoCliente = codigoCliente;
    }
    
    
}
