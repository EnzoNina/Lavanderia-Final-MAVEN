package pe.edu.lavanderia.entidades.jdbc;

public class Prendas {

    private int cod;
    private int cod_tipoPrenda;
    private int cod_tipoTela;
    private String color;

    public Prendas(int cod, int cod_tipoPrenda, int cod_tipoTela, String color) {
        this.cod = cod;
        this.cod_tipoPrenda = cod_tipoPrenda;
        this.cod_tipoTela = cod_tipoTela;
        this.color = color;
    }

    public Prendas(int cod_tipoPrenda, int cod_tipoTela, String color) {
        this.cod_tipoPrenda = cod_tipoPrenda;
        this.cod_tipoTela = cod_tipoTela;
        this.color = color;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public int getCod_tipoPrenda() {
        return cod_tipoPrenda;
    }

    public void setCod_tipoPrenda(int cod_tipoPrenda) {
        this.cod_tipoPrenda = cod_tipoPrenda;
    }

    public int getCod_tipoTela() {
        return cod_tipoTela;
    }

    public void setCod_tipoTela(int cod_tipoTela) {
        this.cod_tipoTela = cod_tipoTela;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
