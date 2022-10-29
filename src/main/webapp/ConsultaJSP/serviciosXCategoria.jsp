<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Servicios por Categoria - Lavanderia</title>
        <%@ include file="../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../Common/body.html" %>
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