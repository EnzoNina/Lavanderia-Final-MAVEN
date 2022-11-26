package pe.edu.lavanderia.dto;

public class DtoServicios {

    private int cod;
    private String nombre;
    private String descripcion;
    private double precio;

    public DtoServicios() {
    }

    

    /**
     * @param cod
     * @param nombre
     * @param precio
     */
    public DtoServicios(int cod, String nombre, double precio) {
        this.cod = cod;
        this.nombre = nombre;
        this.precio = precio;
    }



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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    @Override
    public String toString() {
        return "DtoServicios [cod=" + cod + ", nombre=" + nombre + ", precio=" + precio + "]";
    }    
}
