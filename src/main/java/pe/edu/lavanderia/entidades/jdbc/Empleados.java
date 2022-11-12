package pe.edu.lavanderia.entidades.jdbc;

public class Empleados extends Personas {

    private int cod;
    private String usuario;
    private String tipo;

    public Empleados() {
    }

    public Empleados(int cod, String usuario, String tipo) {
        this.cod = cod;
        this.usuario = usuario;
        this.tipo = tipo;
    }
    
    /*public Empleados(String dni, String nombre, String apellidoPaterno, String apellidoMaterno, String celular, String usuario, String contraseña,Boolean estado) {
        super(nombre, apellidoPaterno, apellidoMaterno, dni, celular, contraseña,estado);
        this.usuario = usuario;
    }*/
    
    public Empleados(String dni, String nombre, String apellidoPaterno, String apellidoMaterno, String celular, String usuario, String contraseña, String tipo,Boolean estado) {
        super(nombre, apellidoPaterno, apellidoMaterno, dni, celular, contraseña,estado);
        this.usuario = usuario;
        this.tipo = tipo;
    }
    
    public Empleados(int cod, String usuario, String tipo, String nombre, String apellidoPaterno, String apellidoMaterno, String dni, String celular, String contraseña,Boolean estado) {
        super(nombre, apellidoPaterno, apellidoMaterno, dni, celular, contraseña,estado);
        this.cod = cod;
        this.usuario = usuario;
        this.tipo = tipo;
    }
    

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    

}
