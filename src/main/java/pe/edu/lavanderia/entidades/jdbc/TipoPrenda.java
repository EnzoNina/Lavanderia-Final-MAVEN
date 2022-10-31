package pe.edu.lavanderia.entidades.jdbc;

public class TipoPrenda {

    private int codTipoPrenda;
    private String tipoPrenda;

    public TipoPrenda(int codTipoPrenda, String tipoPrenda) {
        this.codTipoPrenda = codTipoPrenda;
        this.tipoPrenda = tipoPrenda;
    }

    public TipoPrenda(String tipoPrenda) {
        this.tipoPrenda = tipoPrenda;
    }

    //Getter and Setter

    public int getCodTipoPrenda() {
        return codTipoPrenda;
    }

    public void setCodTipoPrenda(int codTipoPrenda) {
        this.codTipoPrenda = codTipoPrenda;
    }

    public String getTipoPrenda() {
        return tipoPrenda;
    }

    public void setTipoPrenda(String tipoPrenda) {
        this.tipoPrenda = tipoPrenda;
    }
    
}
