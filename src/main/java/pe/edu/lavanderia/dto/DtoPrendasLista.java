package pe.edu.lavanderia.dto;

public class DtoPrendasLista {

    private int cod;
    private String tipoPrenda;
    private String tipoTela;
    private String color;


    public DtoPrendasLista(int cod, String tipoPrenda, String tipoTela, String color) {
        this.cod = cod;
        this.tipoPrenda = tipoPrenda;
        this.tipoTela = tipoTela;
        this.color = color;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getTipoPrenda() {
        return tipoPrenda;
    }

    public void setTipoPrenda(String tipoPrenda) {
        this.tipoPrenda = tipoPrenda;
    }

    public String getTipoTela() {
        return tipoTela;
    }

    public void setTipoTela(String tipoTela) {
        this.tipoTela = tipoTela;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
