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
       <%@ include file="../../Common/estilos.html" %>
    </head>
    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
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