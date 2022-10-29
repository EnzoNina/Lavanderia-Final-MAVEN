<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Servicios|Categoria - Lavanderia</title>
        <%@ include file="../../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
        <div class="page">
            <div style="background: white; color: black;">
                <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#exampleModal"
                        data-toggle="modal">Agregar
                    Servicio</button>

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
                        <c:forEach items="${list}" var="servicio">
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
                                    <td>
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#editar"
                                                data-cod="${servicio.cod}" data-nom="${servicio.nombre}"
                                        data-desc="${servicio.descripcion}" data-cate="${servicio.cod_categoria}"
                                        data-prec="${servicio.precio}">Editar</button>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#delete"
                                            data-cod="${servicio.cod}">Eliminar</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Modal Agregar Servicio -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Agregar
                                    servicio</h5>
                            </div>
                            <div class="modal-body">
                                <form method="get" action="<%=request.getContextPath()%>/ServletServicios">
                                    <input type="hidden" name="instruccion" value="new" />
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Servicio</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nom" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail"
                                               class="col-sm-2 col-form-label">Descripcion</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="desc" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo
                                            - Categoria</label>
                                        <div class="col-sm-10">

                                            <select class="form-select" name="cate"
                                                    aria-label="Codigo Categoria...">
                                                <c:forEach items="${categoriasCod}" var="codCategoria">
                                                    <option value="${codCategoria}">
                                                        <c:out value="${codCategoria}"></c:out>
                                                        </option>
                                                </c:forEach>
                                            </select>                                               
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Precio</label>
                                        <div class="col-sm-10">
                                            <input type="number" step=".01" class="form-control" name="prec" required/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">
                                            <a>Agregar</a>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionServicios.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>

</html>