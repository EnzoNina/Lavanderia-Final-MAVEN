package pe.edu.lavanderia.dto;

public class DtoPrendaListaMostrar {
    private int cod;
    private String tipoPrenda;
    private String tipoTela;
    private String color;
    private int cantidad;

    
    public DtoPrendaListaMostrar(int cod, String tipoPrenda, String tipoTela, String color, int cantidad) {
        this.cod = cod;
        this.tipoPrenda = tipoPrenda;
        this.tipoTela = tipoTela;
        this.color = color;
        this.cantidad = cantidad;
    }


    /**
     * @return the cod
     */
    public int getCod() {
        return cod;
    }


    /**
     * @param cod the cod to set
     */
    public void setCod(int cod) {
        this.cod = cod;
    }


    /**
     * @return the tipoPrenda
     */
    public String getTipoPrenda() {
        return tipoPrenda;
    }


    /**
     * @param tipoPrenda the tipoPrenda to set
     */
    public void setTipoPrenda(String tipoPrenda) {
        this.tipoPrenda = tipoPrenda;
    }


    /**
     * @return the tipoTela
     */
    public String getTipoTela() {
        return tipoTela;
    }


    /**
     * @param tipoTela the tipoTela to set
     */
    public void setTipoTela(String tipoTela) {
        this.tipoTela = tipoTela;
    }


    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }


    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }


    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }


    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
        
    @Override
    public String toString() {
        return "DtoPrendaListaMostrar [cod=" + cod + ", tipoPrenda=" + tipoPrenda + ", tipoTela=" + tipoTela
                + ", color=" + color + ", cantidad=" + cantidad + "]";
    }
    
    
    
}
