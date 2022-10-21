<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes"%>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Clientes - Lavanderia</title>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="icon"
              href="http://localhost:8080/lavanderia/images/favicon.ico"
              type="image/x-icon" />
        <link rel="stylesheet"
              href="http://localhost:8080/lavanderia/css/tabulator.min.css">
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet"
              href="http://localhost:8080/lavanderia/css/bootstrap.css" />
        <link rel="stylesheet"
              href="http://localhost:8080/lavanderia/css/fonts.css" />
        <link rel="stylesheet"
              href="http://localhost:8080/lavanderia/css/style.css" />
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
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <div class="ie-panel">
            <a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
                    src="http://localhost:8080/lavanderia/images/ie8-panel/warning_bar_0000_us.jpg"
                    height="42" width="820"
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
                <a class="btn btn-primary"
                   href="http://localhost:8080/lavanderia/pages/registrar.jsp?tipo=personal">Agregar
                    cliente</a>


                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellidos</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Celular</th>                            
                            <th scope="col">Direccion</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clientList}" var="cliente">
                            <tr>
                                <td id="codigo"><c:out value="${cliente.cod}"></c:out></td>
                                <td id="nombre"><c:out value="${cliente.nombres}"></c:out></td>
                                <td id="apePaterno"><c:out
                                        value="${cliente.apellidos}"></c:out></td>                            
                                <td id="dni"><c:out value="${cliente.dni}"></c:out></td>
                                <td id="celular"><c:out value="${cliente.celular}"></c:out></td>                                
                                <td id="direccion"><c:out value="${cliente.direccion}"></c:out></td>                                    
                                </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionCliente.js"></script>
    </body>
</html>