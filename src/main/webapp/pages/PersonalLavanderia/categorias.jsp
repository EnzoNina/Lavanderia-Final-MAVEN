<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Categorias - Lavanderia - Personal</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>
    <body>
        
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <%@include file="../../Common/header.html" %>
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
                                            <h5 class="card-title">Categorias</h5>

                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Descripcion</th>                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${lst}" var="categoria">
                            <tr>
                                <td id="cod" > <c:out value="${categoria.cod_categoria}" ></c:out> </td>
                                    <td id="nombre">
                                        <a href="ServletServiciosXCategoria?cod_categoria=${categoria.cod_categoria}">
                                        <c:out value="${categoria.nombre}" ></c:out> 
                                        </a>
                                    </td>
                                    <td id="desc" > <c:out value="${categoria.descripcion}" ></c:out> </td>                                
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