// Modal Editar Cliente
$("#editar").on("show.bs.modal", function (e) {
  var cod = $(e.relatedTarget).data("cod");
  var nom = $(e.relatedTarget).data("nom");

  var desc = $(e.relatedTarget).data("desc");
  var cate = $(e.relatedTarget).data("cate");
  var prec = $(e.relatedTarget).data("prec");
  
  $(e.currentTarget).find('input[name="cod"]').val(cod);
  $(e.currentTarget).find('input[name="nom"]').val(nom);

  $(e.currentTarget).find('input[name="desc"]').val(desc);
  $(e.currentTarget).find('input[name="cate"]').val(cate);

  $(e.currentTarget).find('input[name="prec"]').val(prec);
});

// Modal borrar cliente

$("#delete").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="cod"]').val(co);
});
