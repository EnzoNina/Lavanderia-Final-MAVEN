<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Menu - Cliente</title>
        <%@ include file="../../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
        <div class="page">
            <div class=" container col-auto bg-danger p-5 text-center">
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="">
                                <img src="http://localhost:8080/lavanderia/images/pedidos-icon.png" class="card-img-top" alt="Clientes">
                                <div class="card-body">
                                    <h5 class="card-title">Estado de Pedido</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="">
                                <img src="http://localhost:8080/lavanderia/images/pedido-icon.png" class="card-img-top" alt="Pedidos">
                                <div class="card-body">
                                    <h5 class="card-title">Pedidos</h5>
                                </div>
                            </a>
                        </div>
                    </div>                
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <a href="<%=request.getContextPath()%>/ServletVisitaDomiciliaria">
                                <img src="http://localhost:8080/lavanderia/images/nuevopedido-icon.png" class="card-img-top" alt="Nuevo Pedido">
                                <div class="card-body">
                                    <h5 class="card-title">Programar visita Domiciliaria</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>

</html>
