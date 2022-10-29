// Modal Editar Prendas
$("#editar").on("show.bs.modal", function (e) {
  var cod = $(e.relatedTarget).data("cod");
  var color = $(e.relatedTarget).data("color");

  $(e.currentTarget).find('input[name="cod"]').val(cod);
  $(e.currentTarget).find('input[name="color"]').val(color);
});

// Modal borrar Prendas
$("#delete").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="cod"]').val(co);
});

// Modal Editar Tipo Prenda
$("#editarTP").on("show.bs.modal", function (e) {
  var cod = $(e.relatedTarget).data("cod");
  var tipo = $(e.relatedTarget).data("tipo");

  $(e.currentTarget).find('input[name="cod"]').val(cod);
  $(e.currentTarget).find('input[name="TP"]').val(tipo);
});

// Modal borrar Tipo Prenda
$("#deleteTP").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="cod"]').val(co);
});

// Modal Editar Tipo Tela
$("#editarTT").on("show.bs.modal", function (e) {
  var cod = $(e.relatedTarget).data("cod");
  var tipo = $(e.relatedTarget).data("tipo");

  $(e.currentTarget).find('input[name="cod"]').val(cod);
  $(e.currentTarget).find('input[name="TT"]').val(tipo);
});

// Modal borrar Tipo Tela
$("#deleteTT").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="cod"]').val(co);
});
