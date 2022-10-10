// Modal Editar Cliente
$("#categoria").on("show.bs.modal", function (e) {
  var cod = $(e.relatedTarget).data("cod");
  var nom = $(e.relatedTarget).data("nom");

  var desc = $(e.relatedTarget).data("desc");
  var estado = $(e.relatedTarget).data("estado");
  
  $(e.currentTarget).find('input[name="cod"]').val(cod);
  $(e.currentTarget).find('input[name="nom"]').val(nom);

  $(e.currentTarget).find('input[name="desc"]').val(desc);
  $(e.currentTarget).find('input[name="estado"]').val(estado);
});

// Modal borrar cliente

$("#delete").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="codigo"]').val(co);
});
