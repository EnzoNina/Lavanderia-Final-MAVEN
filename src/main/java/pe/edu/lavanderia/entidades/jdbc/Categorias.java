package pe.edu.lavanderia.entidades.jdbc;

public class Categorias {

    private int cod_categoria;
    private String nombre;
    private String descripcion;
    private boolean estado;

    // Constructor
    public Categorias() {
    }

    public Categorias(int cod_categoria, String nombre, String descripcion, boolean estado) {
        super();
        this.cod_categoria = cod_categoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public Categorias(String nombre, String descripcion, boolean estado) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    // Getter & Setter
    public int getCod_categoria() {
        return cod_categoria;
    }

    public void setCod_categoria(int cod_categoria) {
        this.cod_categoria = cod_categoria;
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

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Categorias [cod_categoria=" + cod_categoria + ", nombre=" + nombre + ", descripcion=" + descripcion
                + ", estado=" + estado + "]";
    }

}
