package Personas;



/**
 *
 * @author CLEVER
 */
public class Personal extends Persona{
    private String IDPersonal;
    private String especialidad;

    public Personal(String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito) {
        super(nombre, apellido, dni, direccion,distrito,telefono,correo);
        this.IDPersonal = IDPersonal;
        this.especialidad = especialidad;
    }
    //Getters and Setters
    
    
    

}