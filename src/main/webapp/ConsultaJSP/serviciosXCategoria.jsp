<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Servicios por Categoria - Lavanderia</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="icon" href="http://localhost:8080/lavanderia/images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/tabulator.min.css">
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/bootstrap.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/fonts.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/style.css" />       
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

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
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
        <div class="page">
            <div style="background: white; color: black;">
                <h4>Datos de la Categoria</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <c:out value="${lstServicios.cod_categoria}"></c:out>
                                </td>
                                <td>
                                <c:out value="${lstServicios.nombre}"></c:out>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <h4>Servicios de la Categoria</h4>

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripcion</th>                                
                                <th scope="col">Precio</th>                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lstServicios.lstServicios}" var="servicio">
                            <tr>
                                <td id="cod">
                                    <c:out value="${servicio.cod}"></c:out>
                                    </td>
                                    <td id="nom">
                                    <c:out value="${servicio.nombre}"></c:out>
                                    </td>
                                    <td id="desc">
                                    <c:out value="${servicio.descripcion}"></c:out>
                                    </td>
                                    <td id="precio">
                                    <c:out value="${servicio.precio}"></c:out>
                                    </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionServicios.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>

</html>