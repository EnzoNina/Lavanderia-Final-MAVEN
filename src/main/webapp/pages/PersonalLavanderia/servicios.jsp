<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Servicios - Lavanderia</title>
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
                            <div class="col-xxl-4 col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title">Pedidos Recientes</h5>
                                            <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#exampleModal"
                                                    data-toggle="modal">Agregar Servicio
                                            </button>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Codigo</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Descripcion</th>                            
                                                        <th scope="col">Precio</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lst}" var="servicio">
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
                                </div><!-- End Recent Sales -->
                            </div>
                        </div><!-- End Left side columns -->
                    </div>
                </div>
            </section>

        </main><!-- End #main -->   


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
                            <input type="hidden" name="tipo" value="personal"/>
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

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>

    </body>

</html>