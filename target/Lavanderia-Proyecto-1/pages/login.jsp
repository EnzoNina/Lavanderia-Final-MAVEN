<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Login</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" />
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

            html.ie-10 .ie-panel,
            html.lt-ie-10 .ie-panel {
                display: block;
            }
        </style>
    </head>

    <body>
        <div class="ie-panel">
            <a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
                    src="../images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820"
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
        <div class="page secca">
            <section class="section section-md bg-xs-overlay secca">
                <div class="container" id="contaCard">
                    <div class="row row-30 justify-content-center">
                        <div class="col-xl-3 col-md-6 col-12 wow fadeInDown" data-wow-delay=".3s">
                            <div class="pricing-box bg-gray-dark">
                                <div class="pricing-box-tittle">Usuarios</div>
                                <hr />
                                <div class="pricing-box-inner">
                                    <img src="../images/user.png" alt="Login Usuario" />
                                </div>
                                <a class="button button-190 button-circle btn-primary-rounded" data-toggle="modal"
                                   data-target="#exampleModal" style="color: white">Login
                                </a>
                                <a href="register.html">¿No tiene una cuenta? <span class="text-primary">Cree una ahora</span></a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-12 wow fadeInUp" data-wow-delay=".4s">
                            <div class="pricing-box bg-gray-primary">
                                <div class="pricing-box-tittle">Personal de Lavanderia</div>
                                <hr />
                                <div class="pricing-box-inner">
                                    <img src="../images/lavanderia-login.png" alt="Login Lavanderia" />
                                </div>
                                <a class="button button-190 button-circle btn-rounded-outline" data-toggle="modal"
                                   data-target="#modalLavanderia">Login</a>
                                <a href="register.html">¿No tiene una cuenta? <strong style="color:#404044;">Cree una ahora</strong></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Modal User-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Login User</h5>
                        </div>
                        <div class="modal-body">
                            <form action="<%=request.getContextPath()%>/loginUsuario"  method="post">
                                <div class="mb-3 row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="user" />
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="pass" />
                                    </div>
                                </div>                                

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Iniciar Sesion
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal Empleado -->
            <div class="modal fade" id="modalLavanderia" tabindex="-1" aria-labelledby="modalLavanderia" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalLavanderia">Login Lavanderia</h5>
                        </div>
                        <div class="modal-body">
                            <form action="<%=request.getContextPath()%>/loginEmpleado"  method="post">
                                <div class="mb-3 row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="user" />
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="pass" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Iniciar Sesion
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="../js/core.min.js"></script>
        <script src="../js/script.js"></script>
    </body>

</html>