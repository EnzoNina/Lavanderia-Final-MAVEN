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
                   href="http://localhost:8080/lavanderia/pages/registrar.jsp">Agregar
                    cliente</a>


                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellido Paterno</th>
                            <th scope="col">Apellido Materno</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Contraseña</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clientList}" var="cliente">
                            <tr>
                                <td id="codigo"><c:out value="${cliente.cod}"></c:out></td>
                                <td id="nombre"><c:out value="${cliente.nombres}"></c:out></td>
                                <td id="apePaterno"><c:out
                                        value="${cliente.apellidoPaterno}"></c:out></td>
                                <td id="apeMaterno"><c:out
                                        value="${cliente.apellidoMaterno}"></c:out></td>
                                <td id="dni"><c:out value="${cliente.dni}"></c:out></td>
                                <td id="celular"><c:out value="${cliente.celular}"></c:out></td>
                                <td id="usuario"><c:out value="${cliente.usuario}"></c:out></td>
                                <td id="contraseña"><c:out value="${cliente.contraseña}"></c:out></td>
                                <td id="direccion"><c:out value="${cliente.direccion}"></c:out></td>
                                    <td>
                                        <button class="btn btn-primary" data-target="#editCliente"
                                                data-cod="${cliente.cod}" data-nombres="${cliente.nombres}"
                                        data-pa="${cliente.apellidoPaterno}"
                                        data-ma="${cliente.apellidoMaterno}" data-dni="${cliente.dni}"
                                        data-celular="${cliente.celular}"
                                        data-usuario="${cliente.usuario}"
                                        data-contra="${cliente.contraseña}"
                                        data-direccion="${cliente.direccion}" data-toggle="modal">Editar</button>

                                    <button class="btn btn-primary editar"
                                            data-target="#deleteCliente" data-toggle="modal"
                                            data-cod="${cliente.cod}">Eliminar</button>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>

                <!-- Modal Editar-->
                <div class="modal fade" id="editCliente" tabindex="-1"
                     aria-labelledby="editCliente" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editCliente">Editar Cliente</h5>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/ServletEditar"
                                      method="post">
                                    <div class="mb-3 row" style="display: none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="codigo" value=""  />
                                        </div>
                                    </div>
                                    <div class="mb-3 row" style="margin-top: auto">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Nombres</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nombres"
                                                   value="" required />
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Paterno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="pa" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Materno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="ma" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">DNI</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="dni" value=""
                                                   maxlength=8
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Direccion</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="direccion"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Celular</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="celular"
                                                   value="" maxlength=9
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="usuario"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="contra" value="" required/>
                                        </div>
                                    </div>
                                    <input type="submit" value="Editar"
                                           class="btn btn-dark botonRegistrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Borrar-->
                <div class="modal fade" id="deleteCliente" tabindex="-1"
                     aria-labelledby="deleteCliente" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteCliente">Eliminar Cliente</h5>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/ServletBorrar" method="post" >
                                    <div class="mb-3 row" style="display: none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="codigo" value="" />
                                        </div>
                                    </div>

                                    <h4 style="text-align: center" >El cliente sera borrado permanentemente</h4>
                                    <h5 style="text-align: center" >¿Esta seguro?</h5>
                                    <input type="submit" value="Borrar" class="btn btn-primary">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Cancelar</button>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionCliente.js"></script>
    </body>
</html>