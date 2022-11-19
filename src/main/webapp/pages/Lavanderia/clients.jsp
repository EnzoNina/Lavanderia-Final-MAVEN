<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Clientes - Lavanderia</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>

    <body>        
        <div>
            <!-- ======= Header ======= -->
            <header id="header" class="header fixed-top d-flex align-items-center">
                <%@include file="../../Common/header.html" %>
            </header><!-- End Header -->

            <!-- ======= Sidebar ======= -->
            <aside id="sidebar" class="sidebar">
                <%@include file="../../Common/asideAdministrador.jsp" %>
            </aside><!-- End Sidebar-->

            <div class="container">
                <a class="btn btn-primary" href="http://localhost:8080/lavanderia/pages/Lavanderia/menu.jsp">Volver al Menu</a>
                <!--Contenedor de Tabla-->
                <main id="main" class="main">
                    <section class="section dashboard">
                        <div class="row">
                            <!-- Left side columns -->
                            <div class="col-lg-12">
                                <div class="row">
                                    <!-- Customers Card -->
                                    <div class="col-xxl-4 col-xl-12">
                                        <!-- Recent Sales -->
                                        <div class="col-12">
                                            <div class="card recent-sales overflow-auto">
                                                <div class="card-body">
                                                    <h5 class="card-title">Pedidos Recientes</h5>

                                                    <table class="table table-borderless datatable">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">Nombres</th>
                                                                <th scope="col">Apellido Paterno</th>
                                                                <th scope="col">Apellido Materno</th>
                                                                <th scope="col">Correo Electronico</th>
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
                                                                    <td style="width: auto;" id="codigo">
                                                                        <c:out value="${cliente.cod}"></c:out>
                                                                        </td>
                                                                        <td style="width: auto;" id="nombre">
                                                                        <c:out value="${cliente.nombre}"></c:out>
                                                                        </td>
                                                                        <td id="apePaterno">
                                                                        <c:out value="${cliente.apellidoPaterno}"></c:out>
                                                                        </td>
                                                                        <td id="apeMaterno">
                                                                        <c:out value="${cliente.apellidoMaterno}"></c:out>
                                                                        </td>
                                                                        <td id="correo">
                                                                        <c:out value="${cliente.correo}"></c:out>
                                                                        </td>
                                                                        <td id="dni">
                                                                        <c:out value="${cliente.dni}"></c:out>
                                                                        </td>
                                                                        <td id="celular">
                                                                        <c:out value="${cliente.celular}"></c:out>
                                                                        </td>
                                                                        <td id="usuario">
                                                                        <c:out value="${cliente.usuario}"></c:out>
                                                                        </td>
                                                                        <td id="contraseña">
                                                                        <c:out value="${cliente.contraseña}"></c:out>
                                                                        </td>
                                                                        <td id="direccion">
                                                                        <c:out value="${cliente.direccion}"></c:out>
                                                                        </td>

                                                                        <td class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                                            <button class="btn btn-primary" data-target="#editCliente" data-cod="${cliente.cod}"
                                                                                data-nombres="${cliente.nombre}" data-pa="${cliente.apellidoPaterno}"
                                                                                data-ma="${cliente.apellidoMaterno}" data-dni="${cliente.dni}" data-correo="${cliente.correo}"
                                                                                data-celular="${cliente.celular}" data-usuario="${cliente.usuario}" data-contra="${cliente.contraseña}"
                                                                                data-direccion="${cliente.direccion}" data-toggle="modal">Editar</button>

                                                                        <button class="btn btn-primary editar" data-target="#deleteCliente" data-toggle="modal"
                                                                                data-cod="${cliente.cod}">Eliminar</button>
                                                                    </td>

                                                                </tr>

                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- End Recent Sales -->
                                    </div>
                                </div><!-- End Left side columns -->
                            </div>
                        </div>
                    </section>

                </main><!-- End #main -->
                
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
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Correo Electronico</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="correo"
                                                   value="" required/>
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
        
        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>
    </body>
</html>


