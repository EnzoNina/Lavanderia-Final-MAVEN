package Personas;



/**
 *
 * @author CLEVER
 */
public class Personal extends Persona{
    private String IDPersonal;
    private String especialidad;
    public Personal(){
        
    }

    public Personal(String nombre, String apellido, String dni, String correo, String telefono, String direccion,String distrito) {
        super(nombre, apellido, dni, direccion,distrito,telefono,correo);
        this.IDPersonal = IDPersonal;
        this.especialidad = especialidad;
    }
    //Getters and Setters

    public String getIDPersonal() {
        return IDPersonal;
    }

    public void setIDPersonal(String IDPersonal) {
        this.IDPersonal = IDPersonal;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    
    

}