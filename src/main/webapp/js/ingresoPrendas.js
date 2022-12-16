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

function generarReporte() {
  var input = document.getElementById("instruccion");
  input.value = "generarBoleta";
  document.formulario.submit();
}
