<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Prendas - Lavanderia - Personal</title>
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
                    <div class="col-lg-6">
                        <div class="row">
                            <!-- Customers Card -->
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title">Tipo Prenda</h5>
                                            <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregarTP"
                                                    data-toggle="modal">Agregar Tipo Prenda</button>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Tipo Prenda</th>
                                                        <th scope="col">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lstTipoPrenda}" var="tipoPrenda">
                                                        <tr>
                                                            <td id="codTP" ><c:out value="${tipoPrenda.codTipoPrenda}" ></c:out> </td>
                                                            <td id="tipoPrenda"><c:out value="${tipoPrenda.tipoPrenda}" >  </c:out></td>
                                                                <td>
                                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#editarTP" 
                                                                            data-cod="${tipoPrenda.codTipoPrenda}" 
                                                                    data-tipo="${tipoPrenda.tipoPrenda}">
                                                                    <i class="bi bi-pencil-square"></i></button>
                                                                <button class="btn btn-primary" data-toggle="modal" data-target="#deleteTP" data-cod="${tipoPrenda.codTipoPrenda}" ><i class="bi bi-trash3"></i></button>
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

                    <div class="col-lg-6">
                        <div class="row">
                            <!-- Customers Card -->
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title">Tipo Tela</h5>
                                            <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregarTT"
                                                    data-toggle="modal">Agregar Tipo Tela</button>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Tipo Tela</th>
                                                        <th scope="col">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lstTipoTela}" var="tela">
                                                        <tr>
                                                            <td id="codTT" > <c:out value="${tela.cod_tipoTela}" ></c:out> </td>
                                                            <td id="tipoTela"><c:out value="${tela.tipoTela}" >  </c:out></td>
                                                                <td>
                                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#editarTT" data-cod="${tela.cod_tipoTela}" 
                                                                        data-tipo="${tela.tipoTela}">
                                                                    <i class="bi bi-pencil-square"></i></button>
                                                                <button class="btn btn-primary" data-toggle="modal" data-target="#deleteTT" data-cod="${tela.cod_tipoTela}" ><i class="bi bi-trash3"></i></button>
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
                                            <h5 class="card-title">Prendas</h5>
                                            <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregar"
                                                    data-toggle="modal">Agregar Prenda</button>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Codigo</th>
                                                        <th scope="col">Tipo Prenda</th>
                                                        <th scope="col">Tipo Tela</th>
                                                        <th scope="col">Color</th>
                                                        <th scope="col">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lst}" var="prenda">
                                                        <tr>
                                                            <td id="cod" > <c:out value="${prenda.cod}" ></c:out> </td>
                                                            <td id="tipoPrenda"><c:out value="${prenda.tipoPrenda}" >  </c:out></td>
                                                            <td id="tipoTela" > <c:out value="${prenda.tipoTela}" ></c:out> </td>
                                                            <td id="color" > <c:out value="${prenda.color}" ></c:out> </td>
                                                                <td>
                                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#editar"
                                                                            data-cod="${prenda.cod}"                                                     
                                                                    data-color="${prenda.color}"
                                                                    >
                                                                    <i class="bi bi-pencil-square"></i></button>
                                                                <button class="btn btn-primary" data-toggle="modal" data-target="#delete" data-cod="${prenda.cod}" ><i class="bi bi-trash3"></i></button>
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

        <!-- MODALES -->
        <!-- Agregar Prenda -->
        <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="agregar" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregar">Agregar Prendas</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="new"/>
                            <input type="hidden" name="tipo" value="prenda"/>
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-4 col-form-label">Tipo Prenda</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="tipoPrenda" aria-label="Tipo Prenda" >
                                        <c:forEach items="${lstTipoPrenda}" var="tipoPrenda">
                                            <option value="${tipoPrenda.codTipoPrenda}" > 
                                                <c:out value="${tipoPrenda.tipoPrenda}"></c:out> 
                                                </option>
                                        </c:forEach>
                                    </select>
                                </div>                                
                            </div>
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-3 col-form-label">Tipo Tela</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="tipoTela" aria-label="Tipo Tela" >
                                        <c:forEach items="${lstTipoTela}" var="tipoTela">
                                            <option value="${tipoTela.cod_tipoTela}" > 
                                                <c:out value="${tipoTela.tipoTela}"></c:out> 
                                                </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Color</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="color" required/>
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

        <!-- Editar Prenda -->
        <div class="modal fade" id="editar" tabindex="-1" aria-labelledby="editar" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editar">Editar Prenda</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="edit"/>
                            <input type="hidden" name="tipo" value="prenda"/>

                            <div class="mb-3 row" style="display: none">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
                                </div>
                            </div>

                            <div class="mb-3 row">
                                Tipo Prenda
                                <div class="col-sm-10">
                                    <select class="form-select" name="tipoPrenda" aria-label="Tipo Prenda" >
                                        <c:forEach items="${lstTipoPrenda}" var="tipoPrenda">
                                            <option value="${tipoPrenda.codTipoPrenda}" > 
                                                <c:out value="${tipoPrenda.tipoPrenda}"></c:out> 
                                                </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                Tipo Tela
                                <div class="col-sm-10">
                                    <select class="form-select" name="tipoTela" aria-label="Tipo Tela" >
                                        <c:forEach items="${lstTipoTela}" var="tipoTela">
                                            <option value="${tipoTela.cod_tipoTela}" > 
                                                <c:out value="${tipoTela.tipoTela}"></c:out> 
                                                </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Color</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="color" required/>
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

        <!-- Borrar Prenda -->
        <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="delete" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete">Borrar Prenda</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="delete"/>
                            <input type="hidden" name="tipo" value="prenda"/>

                            <div class="mb-3 row" style="display: none">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
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

        <!-- Agregar Tipo Prenda -->
        <div class="modal fade" id="agregarTP" tabindex="-1" aria-labelledby="agregarTP" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarTP">Agregar Tipo Prenda</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="new"/>
                            <input type="hidden" name="tipo" value="tipoPrenda"/>                            
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Tipo Prenda</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="TP" required/>
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

        <!-- Editar Tipo Prenda -->
        <div class="modal fade" id="editarTP" tabindex="-1" aria-labelledby="editarTP" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarTP">Editar Tipo Prenda</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="edit"/>
                            <input type="hidden" name="tipo" value="tipoPrenda"/>                            

                            <div class="mb-3 row" style="display: none" >
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Tipo Prenda</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="TP" required/>
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

        <!-- Borrar Tipo Prenda -->
        <div class="modal fade" id="deleteTP" tabindex="-1" aria-labelledby="deleteTP" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteTP">Borrar Tipo Prenda</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="delete"/>
                            <input type="hidden" name="tipo" value="tipoPrenda"/>                            

                            <div class="mb-3 row" style="display: none" >
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
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

        <!-- Agregar Tipo Tela -->
        <div class="modal fade" id="agregarTT" tabindex="-1" aria-labelledby="agregarTT" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarTT">Agregar Tipo Tela</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="new"/>
                            <input type="hidden" name="tipo" value="tipoTela"/>                            
                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Tipo Tela</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="TT" required/>
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

        <!-- Editar Tipo Tela -->
        <div class="modal fade" id="editarTT" tabindex="-1" aria-labelledby="editarTT" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarTT">Editar Tipo Tela</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="edit"/>
                            <input type="hidden" name="tipo" value="tipoTela"/>                            

                            <div class="mb-3 row" style="display: none">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label for="text" class="col-sm-2 col-form-label">Tipo Tela</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="TT" required/>
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

        <!-- Borrar Tipo Tela -->
        <div class="modal fade" id="deleteTT" tabindex="-1" aria-labelledby="deleteTT" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteTT">Borrar Tipo Tela</h5>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="<%=request.getContextPath()%>/ServletPrendas" >
                            <input type="hidden" name="instruccion" value="delete"/>
                            <input type="hidden" name="tipo" value="tipoTela"/>                            

                            <div class="mb-3 row" style="display: none">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cod" />
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

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>
            <%@include file="../../Common/imports.html" %>       
        <script src="http://localhost:8080/lavanderia/js/gestionPrendas.js"></script>        
    </body>
</html>