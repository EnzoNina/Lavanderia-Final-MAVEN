$("#addRopa").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="codigoPrenda"]').val(co);

  var tp = $(e.relatedTarget).data("tp");
  $(e.currentTarget).find('input[name="tipoPrenda"]').val(tp);

  var tt = $(e.relatedTarget).data("tt");
  $(e.currentTarget).find('input[name="tipoTela"]').val(tt);

  var color = $(e.relatedTarget).data("color");
  $(e.currentTarget).find('input[name="color"]').val(color);
});

$("#deletePrenda").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  $(e.currentTarget).find('input[name="codPrenda"]').val(co);

  var co = $(e.relatedTarget).data("cant");
  $(e.currentTarget).find('input[name="cantidad"]').val(co);

});

$("#deleteSV").on("show.bs.modal", function (e) {
  var co = $(e.relatedTarget).data("cod");
  var precio = $(e.relatedTarget).data("precio");

  $(e.currentTarget).find('input[name="codServicio"]').val(co);
  $(e.currentTarget).find('input[name="precio"]').val(precio);
});
