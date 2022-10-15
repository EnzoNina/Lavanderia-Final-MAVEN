/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.lavanderia.entidades.jdbc;

import java.util.Date;

/**
 *
 * @author sammael
 */
public class Pedidos {

    private int cod;
    private int cod_cliente;
    private String tipo;
    private String direccion;
    private Date fecha_estimada;
    private String prendas;
    private String cantidad;
    private String observacion;
    private double monto;
    private Date fecha_entrega;

    public Pedidos() {
    }

    public Pedidos(int cod_cliente, String tipo, String direccion, Date fecha_estimada, String prendas, String cantidad, String observacion, double monto, Date fecha_entrega) {
        this.cod_cliente = cod_cliente;
        this.tipo = tipo;
        this.direccion = direccion;
        this.fecha_estimada = fecha_estimada;
        this.prendas = prendas;
        this.cantidad = cantidad;
        this.observacion = observacion;
        this.monto = monto;
        this.fecha_entrega = fecha_entrega;
    }

    public Pedidos(int cod, int cod_cliente, String tipo, String direccion, Date fecha_estimada, String prendas, String cantidad, String observacion, double monto, Date fecha_entrega) {
        this.cod = cod;
        this.cod_cliente = cod_cliente;
        this.tipo = tipo;
        this.direccion = direccion;
        this.fecha_estimada = fecha_estimada;
        this.prendas = prendas;
        this.cantidad = cantidad;
        this.observacion = observacion;
        this.monto = monto;
        this.fecha_entrega = fecha_entrega;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public int getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFecha_estimada() {
        return fecha_estimada;
    }

    public void setFecha_estimada(Date fecha_estimada) {
        this.fecha_estimada = fecha_estimada;
    }

    public String getPrendas() {
        return prendas;
    }

    public void setPrendas(String prendas) {
        this.prendas = prendas;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(Date fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

}
