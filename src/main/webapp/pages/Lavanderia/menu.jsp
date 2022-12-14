<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
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

                    <!-- Tabla Pedidos Recientes -->
                    <div class="col-lg-12">
                        <div class="row">
                            <!-- Customers Card -->
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title"><span>Pedidos Recientes</span></h5>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Cod Cliente</th>
                                                        <th scope="col">Observacion</th>
                                                        <th scope="col">Fecha Entrega</th>
                                                        <th scope="col">Tipo</th>
                                                        <th scope="col">Cod Empleado</th>
                                                        <th scope="col">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>                                                                                                      
                                                    <c:forEach items="${lst}" var="pedido">
                                                        <tr>
                                                            <td id="cod"> <c:out value="${pedido.cod_pedido}"></c:out> </td>
                                                            <td id="cod_cliente"> <c:out value="${pedido.cod_cliente}"></c:out> </td>
                                                            <td id="obs"> <c:out value="${pedido.observaciones}"></c:out> </td>
                                                            <td id="fecha"> <c:out value="${pedido.fecha_entrega}"></c:out ></td>
                                                            <td id="tipo"> <c:out value="${pedido.tipo}"></c:out ></td>
                                                            <td id="cod_empleado"> <c:out value="${pedido.cod_empleado}"></c:out ></td>
                                                            <td id="total"> <c:out value="${pedido.total}"></c:out ></td>
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

                    <!-- Tabla Visitas Domiciliarias -->
                    <div class="col-lg-12">
                        <div class="row">
                            <!-- Customers Card -->
                            <div class="col-xl-12">
                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">
                                        <div class="card-body">
                                            <h5 class="card-title"><span>Visitas Domiciliarias</span></h5>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Codigo de Prendas</th>
                                                        <th scope="col">Cantidad de Prendas</th>
                                                        <th scope="col">Codigo de Servicios</th>
                                                        <th scope="col">Fecha de Recojo</th>                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>                                                                                                      
                                                    <c:forEach items="${listaVisitasDomiciliarias}" var="listaVisitasDomiciliarias">
                                                        <tr>
                                                            <td id="codVisita"> <c:out value="${listaVisitasDomiciliarias.cod_visitaDomiciliaria}"></c:out> </td>
                                                            <td id="prendasVisita"> <c:out value="${listaVisitasDomiciliarias.arrPrendaString}"></c:out> </td>
                                                            <td id="cantidadVistia"> <c:out value="${listaVisitasDomiciliarias.arrCantString}"></c:out> </td>
                                                            <td id="serviciosVisita"> <c:out value="${listaVisitasDomiciliarias.arrCodString}"></c:out ></td>                                                            
                                                            <td id="fechaVisita"> <c:out value="${listaVisitasDomiciliarias .fecha_recojo}"></c:out ></td>
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

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>
    </body>

</html>