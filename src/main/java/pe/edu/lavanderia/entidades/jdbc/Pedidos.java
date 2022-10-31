package pe.edu.lavanderia.entidades.jdbc;

import java.sql.Date;

public class Pedidos {

    private int cod_pedido;
    private int cod_cliente;
    private int cod_empleado;
    private Date fecha_entrega;
    private String observaciones;
    private String tipo;
    private double total;

    //Constructor
    public Pedidos(int cod_pedido, int cod_cliente, int cod_empleado, Date fecha_entrega, String observaciones, String tipo, double total) {
        this.cod_pedido = cod_pedido;
        this.cod_cliente = cod_cliente;
        this.cod_empleado = cod_empleado;
        this.fecha_entrega = fecha_entrega;
        this.observaciones = observaciones;
        this.tipo = tipo;
        this.total = total;
    }

    public Pedidos(int cod_cliente, int cod_empleado, Date fecha_entrega, String observaciones, String tipo, double total) {
        this.cod_cliente = cod_cliente;
        this.cod_empleado = cod_empleado;
        this.fecha_entrega = fecha_entrega;
        this.observaciones = observaciones;
        this.tipo = tipo;
        this.total = total;
    }

    //Getter & Setter
    public int getCod_pedido() {
        return cod_pedido;
    }

    public void setCod_pedido(int cod_pedido) {
        this.cod_pedido = cod_pedido;
    }

    public int getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public int getCod_empleado() {
        return cod_empleado;
    }

    public void setCod_empleado(int cod_empleado) {
        this.cod_empleado = cod_empleado;
    }

    public Date getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(Date fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Pedidos{" + "cod_pedido=" + cod_pedido + ", cod_cliente=" + cod_cliente + ", cod_empleado=" + cod_empleado + ", fecha_entrega=" + fecha_entrega + ", observaciones=" + observaciones + ", tipo=" + tipo + ", total=" + total + '}';
    }
           
}
