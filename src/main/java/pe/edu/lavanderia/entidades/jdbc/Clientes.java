package pe.edu.lavanderia.entidades.jdbc;

public class Clientes {

    private int cod;
    private String nombres;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String dni;
    private String celular;
    private String direccion;
    private String usuario;
    private String contraseña;

    // Constructores
    public Clientes() {
    }

    public Clientes(int cod, String nombres, String apellidoPaterno, String apellidoMaterno, String dni, String celular,
            String direccion, String usuario, String contraseña) {
        this.cod = cod;
        this.nombres = nombres;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.dni = dni;
        this.celular = celular;
        this.direccion = direccion;
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    public Clientes(String nombres, String apellidoPaterno, String apellidoMaterno, String dni, String celular,
            String direccion, String usuario, String contraseña) {
        super();
        this.nombres = nombres;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.dni = dni;
        this.celular = celular;
        this.direccion = direccion;
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    // Getter & Setter
    public int getCod() {
        return cod;
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

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "Clientes [cod=" + cod + ", nombres=" + nombres + ", apellidoPaterno=" + apellidoPaterno
                + ", apellidoMaterno=" + apellidoMaterno + ", dni=" + dni + ", celular=" + celular + ", direccion="
                + direccion + ", usuario=" + usuario + ", contraseña=" + contraseña + "]";
    }
}