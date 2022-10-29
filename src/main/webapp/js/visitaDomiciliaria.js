function cambiarValor() {
    var input = document.getElementById("instruccion");
    input.value = "agregarRopa";
    document.formulario.submit();
}

function completarPedido() {
    var input = document.getElementById("instruccion");
    input.value = "new";
    document.formulario.submit();
}
