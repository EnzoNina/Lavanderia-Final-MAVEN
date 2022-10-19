package pe.edu.lavanderia.entidades.jdbc;

public class Servicios {

    private int cod;
    private String nombre;
    private String descripcion;
    private int cod_categoria;
    private double precio;

    // Constructor
    public Servicios() {
    }

    public Servicios(String nombre, String descripcion, int cod_categoria, double precio) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.cod_categoria = cod_categoria;
        this.precio = precio;
    }

    public Servicios(int cod, String nombre, String descripcion, int cod_categoria, double precio) {
        super();
        this.cod = cod;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.cod_categoria = cod_categoria;
        this.precio = precio;
    }

    // Getter & Setter
    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCod_categoria() {
        return cod_categoria;
    }

    public void setCod_categoria(int cod_categoria) {
        this.cod_categoria = cod_categoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

}
