package pe.edu.lavanderia.entidades.jdbc;

public class Empleados {

    private int cod;
    private String dni;
    private String nombre;
    private String ape_paterno;
    private String ape_materno;
    private String celular;
    private String usuario;
    private String contraseña;

    // Constructores
    public Empleados() {
    }

    public Empleados(String dni, String nombre, String ape_paterno, String ape_materno, String celular, String usuario, String contraseña) {
        this.dni = dni;
        this.nombre = nombre;
        this.ape_paterno = ape_paterno;
        this.ape_materno = ape_materno;
        this.celular = celular;
        this.usuario = usuario;
        this.contraseña = contraseña;
    }
    
    
    

    public Empleados(int cod, String dni, String nombre, String ape_paterno, String ape_materno, String celular, String usuario, String contraseña) {
        this.cod = cod;
        this.dni = dni;
        this.nombre = nombre;
        this.ape_paterno = ape_paterno;
        this.ape_materno = ape_materno;
        this.celular = celular;
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApe_paterno() {
        return ape_paterno;
    }

    public void setApe_paterno(String ape_paterno) {
        this.ape_paterno = ape_paterno;
    }

    public String getApe_materno() {
        return ape_materno;
    }

    public void setApe_materno(String ape_materno) {
        this.ape_materno = ape_materno;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

}
