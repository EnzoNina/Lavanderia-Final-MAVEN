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
