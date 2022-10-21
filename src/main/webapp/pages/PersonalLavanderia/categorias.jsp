<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Categorias - Lavanderia - Personal</title>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
        <link rel="icon" href="http://localhost:8080/lavanderia/images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/tabulator.min.css">
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/bootstrap.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/fonts.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/style.css" />
        <%-- <style>
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
        </style> --%>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%-- <div class="ie-panel">
                <a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
                        src="http://localhost:8080/lavanderia/images/ie8-panel/warning_bar_0000_us.jpg" height="42"
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
        </div>  --%>
        <div class="">
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
        <%-- <script src="http://localhost:8080/lavanderia/js/script.js"></script>	 --%>
    </body>
</html>