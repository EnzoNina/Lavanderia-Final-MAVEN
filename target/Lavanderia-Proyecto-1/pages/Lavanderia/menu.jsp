<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Menu - Lavanderia</title>
        <%@ include file="../../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('../../images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
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
                            <a href="<%=request.getContextPath()%>/ServletPrendas">
                                <img src="../../images/prendas.jpg" class="card-img-top"
                                     alt="Clientes">
                                <div class="card-body">
                                    <h5 class="card-title">Mant. Prendas</h5>
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