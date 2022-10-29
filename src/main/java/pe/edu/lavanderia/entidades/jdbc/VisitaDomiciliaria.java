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

    //Constructor
    public VisitaDomiciliaria(int cod_cliente, String[] prendas, Integer[] cantidad, Date fecha_recojo, int cod_horario, String distrito) {
        this.cod_cliente = cod_cliente;
        this.prendas = prendas;
        this.cantidad = cantidad;
        this.fecha_recojo = fecha_recojo;
        this.cod_horario = cod_horario;
        this.distrito = distrito;
    }

    //Getter and Setter
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

}
