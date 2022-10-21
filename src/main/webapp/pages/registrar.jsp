<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Registrar Nuevo Cliente</title>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/fonts.css" />
        <link rel="stylesheet" href="../css/style.css" />
        <style>
            .ie-panel {
                display: none;
                background: #212121;
                padding: 10px 0;
                box-shadow: 3px 3px 5px 0 rgba(0, 0, 0, 0.3);
                clear: both;
                text-align: center;
                position: relative;
                z-index: 1;
            }

            html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {
                display: block;
            }
        </style>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('../images/fondo2.jpg');">
        <div class="ie-panel">
            <a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
                    src="../images/ie8-panel/warning_bar_0000_us.jpg" height="42"
                    width="820"
                    alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
        </div>
        <div class="preloader">
            <div class="preloader-body">
                <div class="cssload-container">
                    <div class="cssload-speeding-wheel"></div>
                </div>
                <p>Cargando...</p>
            </div>
        </div>
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