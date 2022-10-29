<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Categorias - Lavanderia - Personal</title>
        <%@ include file="../../Common/estilos.html" %>
    </head>
    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
        <div class="page">
        <a class="btn btn-primary" href="http://localhost:8080/lavanderia/pages/PersonalLavanderia/menuPersonal.jsp">Volver al Menu</a>
            <div style="background: white; color: black;">
                <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregar"
                        data-toggle="modal">Agregar categoria</button>                
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripcion</th>                            
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${lst}" var="categoria">
                            <tr>
                                <td id="cod" > <c:out value="${categoria.cod_categoria}" ></c:out> </td>
                                    <td id="nombre">
                                        <a href="ServletServiciosXCategoria?cod_categoria=${categoria.cod_categoria}">
                                        <c:out value="${categoria.nombre}" ></c:out> 
                                        </a>
                                    </td>
                                    <td id="desc" > <c:out value="${categoria.descripcion}" ></c:out> </td>                                
                                </tr>
                        </c:forEach>                                                
                    </tbody>
                </table>

                <!-- Agregar Categoria -->

                <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="agregar" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="agregar">Agregar categoria</h5>
                            </div>
                            <div class="modal-body">
                                <form method="get" action="<%=request.getContextPath()%>/ServletCategorias" >
                                    <input type="hidden" name="instruccion" value="new"/>
                                    <input type="hidden" name="tipo" value="personal"/>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Categoria</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nom" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Descripcion</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="desc" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Estado</label>
                                        <div class="col-sm-10">
                                            <select class="form-select" name="estado" aria-label="Estado...">                                                
                                                <option value="true">True</option>
                                                <option value="false">False</option>                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                            Cerrar
                                        </button>
                                        <button type="submit" class="btn btn-primary">
                                            <a >Agregar</a>
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
        <script src="http://localhost:8080/lavanderia/js/gestionCategorias.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>
</html>