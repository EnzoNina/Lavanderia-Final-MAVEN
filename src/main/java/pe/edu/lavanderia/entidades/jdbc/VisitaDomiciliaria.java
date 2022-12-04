package pe.edu.lavanderia.entidades.jdbc;

import java.sql.Date;

public class VisitaDomiciliaria {

    private int cod_visitaDomiciliaria;
    private int cod_cliente;
    private String[] prendas;
    private Integer[] cantidad;
    private Date fecha_recojo;
    private int cod_horario;
    private String distrito;
    private String[] servicios;

    private String arrPrendaString;
    private String arrCantString;
    private String arrCodString;

    // Constructor
    public VisitaDomiciliaria(int cod_visitaDomiciliaria, int cod_cliente, Date fecha_recojo, int cod_horario, String distrito, String arrPrendaString, String arrCantString, String arrCodString) {
        this.cod_visitaDomiciliaria = cod_visitaDomiciliaria;
        this.cod_cliente = cod_cliente;
        this.fecha_recojo = fecha_recojo;
        this.cod_horario = cod_horario;
        this.distrito = distrito;
        this.arrPrendaString = arrPrendaString;
        this.arrCantString = arrCantString;
        this.arrCodString = arrCodString;
    }

    public VisitaDomiciliaria(int cod_cliente, String[] prendas, Integer[] cantidad, Date fecha_recojo, int cod_horario,
            String distrito, String[] servicios) {
        this.cod_cliente = cod_cliente;
        this.prendas = prendas;
        this.cantidad = cantidad;
        this.fecha_recojo = fecha_recojo;
        this.cod_horario = cod_horario;
        this.distrito = distrito;
        this.servicios = servicios;
    }

    public VisitaDomiciliaria(int cod_visitaDomiciliaria, int cod_cliente, String[] prendas, Integer[] cantidad,
            Date fecha_recojo, int cod_horario, String distrito, String[] servicios) {
        this.cod_visitaDomiciliaria = cod_visitaDomiciliaria;
        this.cod_cliente = cod_cliente;
        this.prendas = prendas;
        this.cantidad = cantidad;
        this.fecha_recojo = fecha_recojo;
        this.cod_horario = cod_horario;
        this.distrito = distrito;
        this.servicios = servicios;
    }

    // Getter and Setter
    public int getCod_visitaDomiciliaria() {
        return cod_visitaDomiciliaria;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public void setCod_visitaDomiciliaria(int cod_visitaDomiciliaria) {
        this.cod_visitaDomiciliaria = cod_visitaDomiciliaria;
    }

    public int getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String[] getPrendas() {
        return prendas;
    }

    public void setPrendas(String[] prendas) {
        this.prendas = prendas;
    }

    public Integer[] getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer[] cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha_recojo() {
        return fecha_recojo;
    }

    public void setFecha_recojo(Date fecha_recojo) {
        this.fecha_recojo = fecha_recojo;
    }

    public int getCod_horario() {
        return cod_horario;
    }

    public void setCod_horario(int cod_horario) {
        this.cod_horario = cod_horario;
    }

    public String getArrPrendaString() {
        return arrPrendaString;
    }

    public void setArrPrendaString(String arrPrendaString) {
        this.arrPrendaString = arrPrendaString;
    }

    public String getArrCantString() {
        return arrCantString;
    }

    public void setArrCantString(String arrCantString) {
        this.arrCantString = arrCantString;
    }

    public String getArrCodString() {
        return arrCodString;
    }

    public void setArrCodString(String arrCodString) {
        this.arrCodString = arrCodString;
    }

    /**
     * @return the servicios
     */
    public String[] getServicios() {
        return servicios;
    }

    /**
     * @param servicios the servicios to set
     */
    public void setServicios(String[] servicios) {
        this.servicios = servicios;
    }

    @Override
    public String toString() {
        return "VisitaDomiciliaria{" + "cod_visitaDomiciliaria=" + cod_visitaDomiciliaria + ", cod_cliente=" + cod_cliente + ", prendas=" + prendas + ", cantidad=" + cantidad + ", fecha_recojo=" + fecha_recojo + ", cod_horario=" + cod_horario + ", distrito=" + distrito + ", servicios=" + servicios + '}';
    }

}
