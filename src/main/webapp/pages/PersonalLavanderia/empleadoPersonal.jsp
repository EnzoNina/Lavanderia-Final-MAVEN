<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Empleados - Lavanderia</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <%@include file="../../Common/header.jsp" %>
        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">
            <%@include file="../../Common/asideEmpleado.jsp" %>
        </aside><!-- End Sidebar-->


        <main id="main" class="main">
            <section class="section dashboard">
                <div class="row">
                    <!-- Left side columns -->
                    <div class="col-lg-12">
                        <div class="row">
                            <!-- Customers Card -->
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title">Empleados</h5>
                                            <a class="btn btn-primary" data-target="#nuevoEmpleado" data-toggle="modal" >Agregar Empleado</a>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Codigo</th>
                                                        <th scope="col">DNI</th>
                                                        <th scope="col">Nombres</th>
                                                        <th scope="col">Apellidos</th>                            
                                                        <th scope="col">Celular</th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lst}" var="empleado">
                                                        <tr>
                                                            <td id="codigo"><c:out value="${empleado.cod}"></c:out></td>
                                                            <td id="dni"><c:out value="${empleado.dni}"></c:out></td>
                                                            <td id="nombres"><c:out value="${empleado.nombre}"></c:out></td>
                                                            <td id="apePaterno"><c:out
                                                                    value="${empleado.apellidos}"></c:out></td>
                                                            <td id="celular"><c:out value="${empleado.celular}"></c:out></td>                                
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

        <!-- Modal Agregar-->
        <div class="modal fade" id="nuevoEmpleado" tabindex="-1"
             aria-labelledby="nuevoEmpleado" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="nuevoEmpleado">Agregar Empleado</h5>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/ServletEmpleados"
                              method="get">
                            <input type="hidden" name="instruccion" value="new" />
                            <input type="hidden" name="tipo" value="personal"/>                            
                            <select class="form-select" name="empleado"
                                    aria-label="Tipo Empleado">
                                <option value="personal">personal</option>                                        
                            </select> 
                            <div class="mb-3 row" style="display: none;">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="codigo" value="" />
                                </div>
                            </div>
                            <div class="mb-3 row" style="margin-top: auto">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Nombres</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="nombres"
                                           value="" required/>
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
                                    <input type="text" class="form-control" name="contra" value="" required style="width: 90%; margin-left: 10px"/>
                                </div>
                            </div>
                            <input type="submit" value="Agregar"
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


        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>
    </body>
</html>