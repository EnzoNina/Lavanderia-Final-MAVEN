package pe.edu.lavanderia.entidades.jdbc;

public class Clientes extends Personas {

    private int cod;
    private String direccion;
    private String usuario;
    private String correo;

    // Constructores

    public Clientes() {
    }
    
    public Clientes(int cod, String nombre, String apellidoPaterno, String apellidoMaterno, String dni, String celular, String direccion, String usuario, String contraseña, String correo,Boolean estado) {
        super(nombre, apellidoPaterno, apellidoMaterno, dni, celular, contraseña,estado);
        this.cod = cod;
        this.direccion = direccion;
        this.usuario = usuario;
        this.correo = correo;
    }

    public Clientes(String nombre, String apellidoPaterno, String apellidoMaterno, String dni, String celular, String direccion, String usuario, String contraseña, String correo,Boolean estado) {
       super(nombre, apellidoPaterno, apellidoMaterno, dni, celular, contraseña,estado);
        this.direccion = direccion;
        this.usuario = usuario;
        this.correo = correo;
    }

    public Clientes(int cod, String direccion, String usuario, String correo) {
        this.cod = cod;
        this.direccion = direccion;
        this.usuario = usuario;
        this.correo = correo;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
}
