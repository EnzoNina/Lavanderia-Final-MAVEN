<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
    <title>Mantenimiento Categorias</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <%@include file="../../Common/header.jsp" %>
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
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title">Categoria</h5>
                                            <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregar"
                                            data-toggle="modal">Agregar categoria</button>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Descripcion</th>
                                                        <th scope="col">Estado</th>                                                        
                                                        <th scope="col">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${list}" var="categoria">
                                                        <tr>
                                                            <td id="cod">
                                                                <c:out value="${categoria.cod_categoria}"></c:out>
                                                                </td>
                                                                <td id="nombre">
                                                                    <a href="ServletServiciosXCategoria?cod_categoria=${categoria.cod_categoria}">
                                                                    <c:out value="${categoria.nombre}"></c:out>
                                                                    </a>
                                                                </td>
                                                                <td id="desc">
                                                                <c:out value="${categoria.descripcion}"></c:out>
                                                                </td>
                                                                <td id="estado">
                                                                <c:out value="${categoria.estado}"></c:out>
                                                                </td>
                                                                <td>
                                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#categoria"
                                                                            data-cod="${categoria.cod_categoria}" data-nom="${categoria.nombre}"
                                                                    data-desc="${categoria.descripcion}"
                                                                    data-estado="${categoria.estado}"><i class="bi bi-pencil-square"></i></button>
                                                                <button class="btn btn-primary" data-toggle="modal" data-target="#delete"
                                                                        data-cod="${categoria.cod_categoria}"><i class="bi bi-trash3"></i></button>
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
                                    <label for="text" class="col-sm-4 col-form-label">Categoria</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="nom" required/>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-4 col-form-label">Descripcion</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="desc" required/>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-4 col-form-label">Estado</label>
                                    <div class="col-sm-8">
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

        <!--Editar Categoria-->
        <div class="modal fade" id="categoria" tabindex="-1" aria-labelledby="categoria" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="categoria">Editar categoria</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletCategorias" >
                            <input type="hidden" name="instruccion" value="edit"/>
                            <div class="mb-3 row" style="display:none;">
                                <label for="text" class="col-sm-2 col-form-label">Cod</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" required/>
                                </div>
                            </div>
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
                                        <option value="1">True</option>
                                        <option value="2">False</option>                                                
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                    Cerrar
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <a >Editar</a>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Borrar Modal-->
        <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="delete" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete">Borrar Categoria</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletCategorias" >
                            <input type="hidden" name="instruccion" value="delete"/>
                            <h4>¿Esta seguro que desea borrar la categoria?</h4>
                            <div class="mb-3 row" style="display:none;">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="codigo" value="" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                    Cerrar
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <a >Borrar</a>
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
        <script src="http://localhost:8080/lavanderia/js/gestionCategorias.js"></script>
    </body>

</html>