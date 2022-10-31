package pe.edu.lavanderia.entidades.jdbc;

public class TipoTela {

    private int cod_tipoTela;
    private String tipoTela;

    public TipoTela(int cod_tipoTela, String tipoTela) {
        this.cod_tipoTela = cod_tipoTela;
        this.tipoTela = tipoTela;
    }

    public TipoTela(String tipoTela) {
        this.tipoTela = tipoTela;
    }

    public int getCod_tipoTela() {
        return cod_tipoTela;
    }

    public void setCod_tipoTela(int cod_tipoTela) {
        this.cod_tipoTela = cod_tipoTela;
    }

    public String getTipoTela() {
        return tipoTela;
    }

    public void setTipoTela(String tipoTela) {
        this.tipoTela = tipoTela;
    }

}
