// Modal Editar Cliente
$("#editEmpleado").on("show.bs.modal", function (e) {
    var cod = $(e.relatedTarget).data("codi");
    var nombres = $(e.relatedTarget).data("nombres");

    var dni = $(e.relatedTarget).data("dni");
    var celular = $(e.relatedTarget).data("celular");
    var usuario = $(e.relatedTarget).data("usuario");
    var contraseña = $(e.relatedTarget).data("contra");

    var apellidoPaterno = $(e.relatedTarget).data("pa");
    var apellidoMaterno = $(e.relatedTarget).data("ma");
    $(e.currentTarget).find('input[name="codi"]').val(cod);
    $(e.currentTarget).find('input[name="nombres"]').val(nombres);

    $(e.currentTarget).find('input[name="dni"]').val(dni);
    $(e.currentTarget).find('input[name="celular"]').val(celular);
    $(e.currentTarget).find('input[name="usuario"]').val(usuario);
    $(e.currentTarget).find('input[name="contra"]').val(contraseña);

    $(e.currentTarget).find('input[name="pa"]').val(apellidoPaterno);
    $(e.currentTarget).find('input[name="ma"]').val(apellidoMaterno);
});

// Modal borrar cliente

$("#deleteEmpleado").on("show.bs.modal", function (e) {
    var cod = $(e.relatedTarget).data("codi");
    $(e.currentTarget).find('input[name="codi"]').val(cod);
});
