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
            <%@include file="../../Common/header.html" %>
        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">
            <%@include file="../../Common/asideAdministrador.jsp" %>
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

                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
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
    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <%@include file="../../Common/footer.html" %>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <%@include file="../../Common/imports.html" %>
</body>

</html>