<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Servicios - Lavanderia</title>
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
                <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#exampleModal"
                        data-toggle="modal">Agregar
                    Servicio</button>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Accion</th>
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
                                    <td id="cate">
                                    <c:out value="${servicio.cod_categoria}"></c:out>
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



                <!-- Modal Editar -->
                <div class="modal fade" id="editar" tabindex="-1" aria-labelledby="editar"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editar">Editar
                                    servicio</h5>
                            </div>
                            <div class="modal-body">
                                <form method="get" action="<%=request.getContextPath()%>/ServletServicios">
                                    <input type="hidden" name="instruccion" value="edit" />

                                    <div class="mb-3 row" style="display:none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="cod" />
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Servicio</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nom" required />
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
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo-Categoria</label>
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
                                            <a>Editar</a>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



            </div>

            <!-- Modal Borrar -->
            <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="delete"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="delete">Borrar
                                servicio</h5>
                        </div>
                        <div class="modal-body">
                            <form method="get" action="<%=request.getContextPath()%>/ServletServicios">
                                <input type="hidden" name="instruccion" value="delete" />     
                                <h4>¿Esta seguro que desea borrar la categoria?</h4>                                   
                                <div class="mb-3 row" style="display:none;" >
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="cod" />
                                    </div>
                                </div>                                         
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary">
                                        <a>Borrar</a>
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