
package Actividades;

import java.util.Date;

/**
 *
 * @author CLEVER
 */
public class Servicios {
    private String IDServicios;
    private String Caracteristica;
    private String Descripcion;
    private Date Tiempo;
    private double Precio;
    
    public Servicios(String Caracteristicas,String Descripcion,
    Date Tiempo,double Precio){
        this.Caracteristica=Caracteristicas;
        this.Descripcion = Descripcion;
        this.Tiempo=Tiempo;
        this.Precio=Precio;
    }

    public String getIDServicios() {
        return IDServicios;
    }

    public void setIDServicios(String IDServicios) {
        this.IDServicios = IDServicios;
    }

    public String getCaracteristica() {
        return Caracteristica;
    }

    public void setCaracteristica(String Caracteristica) {
        this.Caracteristica = Caracteristica;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public Date getTiempo() {
        return Tiempo;
    }

    public void setTiempo(Date Tiempo) {
        this.Tiempo = Tiempo;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
    
}
