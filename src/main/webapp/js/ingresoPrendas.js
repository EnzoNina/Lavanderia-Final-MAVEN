function cambiarValor() {
    var input = document.getElementById("instruccion");
    input.value = "agregarServicio";
    document.formulario.submit();
}

function completarIngreso() {
    var input = document.getElementById("instruccion");
    input.value = "new";
    
    document.formulario.submit();
}