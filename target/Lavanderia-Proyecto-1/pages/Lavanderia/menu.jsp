<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Menu - Lavanderia</title>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet" href="../../css/bootstrap.css" />
        <link rel="stylesheet" href="../../css/fonts.css" />
        <link rel="stylesheet" href="../../css/style.css" />
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
          style="background-image: url('../../images/fondo2.jpg');">
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
            <div class="container" style="max-width: 800px; margin-top: 100px;">
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletListaClientes">
                                <img src="../../images/clients-icon.png" class="card-img-top"
                                     alt="Clientes">
                                <div class="card-body">
                                    <h5 class="card-title">Mant. Clientes</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletEmpleados">
                                <img src="../../images/clients-icon.png" class="card-img-top"
                                     alt="Clientes">
                                <div class="card-body">
                                    <h5 class="card-title">Mant. Empleados</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="pedidos.html"> <img
                                    src="../../images/pedido-icon.png" class="card-img-top"
                                    alt="Pedidos">
                                <div class="card-body">
                                    <h5 class="card-title">Pedidos</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6" style="margin-top: 10px;">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletServicios"> 
                                <img
                                    src="../../images/servicios-icon.png" class="card-img-top"
                                    alt="Servicios">
                                <div class="card-body">
                                    <h5 class="card-title">Mant. Servicios</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6" style="margin-top: 10px;">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletCategorias"> 
                                <img
                                    src="../../images/categorias-icon.png" class="card-img-top"
                                    alt="Categorias">
                                <div class="card-body">
                                    <h5 class="card-title">Mant. Categorias</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6" style="margin-top: 10px;">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletPedidos"> 

                                <img src="../../images/nuevopedido-icon.png"
                                     class="card-img-top" alt="Nuevo Pedido">
                                <div class="card-body">
                                    <h5 class="card-title">Nuevo Pedido</h5>
                                </div>
                            </a>
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="../../js/core.min.js"></script>
        <script src="../../js/script.js"></script>
    </body>

</html>