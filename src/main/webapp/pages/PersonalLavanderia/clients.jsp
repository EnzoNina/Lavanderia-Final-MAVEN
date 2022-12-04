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
                                            <h5 class="card-title">Clientes</h5>
                                            <a class="btn btn-primary"
                                               href="http://localhost:8080/lavanderia/pages/registrar.jsp?tipo=personal">Agregar
                                                cliente</a>
                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Nombres</th>
                                                        <th scope="col">Apellidos</th>                                                                                                                                
                                                        <th scope="col">DNI</th>
                                                        <th scope="col">Celular</th>                                                                
                                                        <th scope="col">Direccion</th>                                                                
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${clientList}" var="cliente">
                                                        <tr>
                                                            <td id="codigo"><c:out value="${cliente.cod}"></c:out></td>
                                                            <td id="nombre"><c:out value="${cliente.nombre}"></c:out></td>
                                                            <td id="apePaterno"><c:out
                                                                    value="${cliente.apellidos}"></c:out></td>                            
                                                            <td id="dni"><c:out value="${cliente.dni}"></c:out></td>
                                                            <td id="celular"><c:out value="${cliente.celular}"></c:out></td>                                
                                                            <td id="direccion"><c:out value="${cliente.direccion}"></c:out></td>                                    
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

        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>

    </body>
</html>