<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Registrar Nuevo Cliente</title>
        <%@ include file="../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('../images/fondo2.jpg');">
        <%@ include file="../Common/body.html" %>
        <div class="page">
            <div class="col-auto bg-danger p-5 text-center register">
                <form action="<%=request.getContextPath()%>/ServletRegister"
                      class="formulario" method="post">
                    <input type="hidden" name="tipo" value="<%=request.getParameter("tipo")%>"/>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Nombres</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nombre" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Apellido
                            Paterno</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="apePaterno" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                            Materno</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="apeMaterno" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Correo Electronico</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="correo" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">DNI</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="DNI" maxlength=8
                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Direccion</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="direccion" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Celular</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="celular"
                                   maxlength=9
                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="usuario" required/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="contra" required/>
                        </div>
                    </div>
                    <input type="submit" value="Registrar"
                           class="btn btn-dark botonRegistrar">
                </form>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="../js/core.min.js"></script>
        <script src="../js/script.js"></script>
    </body>

</html>