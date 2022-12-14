<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Menu - Cliente</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <%@include file="../../Common/header.jsp" %>
        </header><!-- End Header -->  

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">
            <%@include file="../../Common/asideUser.jsp" %>
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
                                            <h5 class="card-title">Visitas Domiciliarias<span></h5>                                            
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
                                                    <c:forEach items="${lst}" var="lst">
                                                        <tr>
                                                            <td id="cod"> <c:out value="${lst.cod_visitaDomiciliaria}"></c:out> </td>
                                                            <td id="prendas"> <c:out value="${lst.arrPrendaString}"></c:out> </td>
                                                            <td id="cantidad"> <c:out value="${lst.arrCantString}"></c:out> </td>
                                                            <td id="servicios"> <c:out value="${lst.arrCodString}"></c:out ></td>                                                            
                                                            <td id="fecha"> <c:out value="${lst.fecha_recojo}"></c:out ></td>
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
