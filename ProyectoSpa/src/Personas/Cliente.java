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
    private String IDCliente;
    private Date FechaNacimiento;
    private String EstadoCivil;

    public Cliente(String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito,
            String IDCliente,Date FechaNacimiento,String EstadoCivil) {
        super(nombre, apellido, dni, direccion,distrito,telefono,correo);
        this.IDCliente = IDCliente;
        this.FechaNacimiento = FechaNacimiento;
        this.EstadoCivil = EstadoCivil;
        
    }
    //Getters and Setters
    
    
    
}
