<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="wide wow-animation" lang="es">

    <head>
        <title>Nuevo Pedido</title>
        <%@include file="../../Common/estilosAdmin.html" %>
    </head>
    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <%@include file="../../Common/header.html" %>
        </header><!-- End Header -->


        <!-- Reemplazar por import -->
        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">
            <%@include file="../../Common/asideAdministrador.jsp" %>
        </aside><!-- End Sidebar-->

        <main id="main" class="main">
            <form class="formulario" method="get" action="<%=request.getContextPath()%>/ServletPedidos"
                  name="formulario">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Nuevo Pedido</h5>



                        <!-- Bordered Tabs -->
                        <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="cliente-tab" data-bs-toggle="tab"
                                        data-bs-target="#bordered-cliente" type="button" role="tab" aria-controls="cliente"
                                        aria-selected="true">Cliente</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="prendas-tab" data-bs-toggle="tab"
                                        data-bs-target="#bordered-prendas" type="button" role="tab" aria-controls="prendas"
                                        aria-selected="false">Datos de Prenda</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="entrega-tab" data-bs-toggle="tab"
                                        data-bs-target="#bordered-entrega" type="button" role="tab" aria-controls="entrega"
                                        aria-selected="false">Datos de Entrega</button>
                            </li>
                        </ul>

                        <div class="tab-content pt-2" id="borderedTabContent">
                            <!-- Bordered Cliente -->
                            <div class="tab-pane fade show active" id="bordered-cliente" role="tabpanel"
                                 aria-labelledby="cliente-tab">

                                <input type="hidden" id="instruccion" name="instruccion" value="buscar" />
                                <input type="hidden" id="instruccion" name="tipo" value="confirmacion" />
                                <input type="hidden" class="form-control" name="cod" required value="<%=request.getSession().getAttribute("cod") %>">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="DNI" required
                                               value="<%=request.getSession().getAttribute("DNI")%>">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" readonly name="dire" required
                                               value="<%=request.getSession().getAttribute("direccion")%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="disableInput" name="nombre" required
                                               readonly value="<%=request.getSession().getAttribute("nombres")%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="disableInput" name="apellido" required
                                               readonly value="<%=request.getSession().getAttribute("apellidos")%>" >
                                    </div>
                                    <input type="submit" value="Buscar Cliente" class="btn btn-primary botonRegistrar">
                                </div>
                            </div>

                            <!-- Borderer Prendas -->
                            <div class="tab-pane fade" id="bordered-prendas" role="tabpanel" aria-labelledby="prendas-tab">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div>
                                            <label>Prenda:</label>
                                            <select class="form-select" aria-label="Prenda" name="prenda">
                                                <option selected>Seleccione una prenda</option>
                                                <c:forEach items="${lstPrendas}" var="prenda">
                                                    <option value="${prenda.cod}">
                                                        <c:out
                                                            value="${prenda.cod}-${prenda.tipoPrenda}-${prenda.tipoTela}-${prenda.color}">
                                                        </c:out>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <input type="number" class="form-control" name="cantidad"
                                                   placeholder="Cantidad">
                                        </div>
                                        <h6>Servicio</h6>
                                        <div class="row g-3">
                                            <select class="form-select" aria-label="Servicios" name="servicio">
                                                <option selected>Seleccione un servicio...</option>
                                                <c:forEach items="${list}" var="servicio">
                                                    <option value="${servicio.cod}-${servicio.nombre}-${servicio.precio}">
                                                        <c:out
                                                            value="${servicio.cod}-${servicio.nombre}-${servicio.precio}">
                                                        </c:out>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <p> Monto total:
                                            <strong>
                                                <%=request.getAttribute("monto")%>
                                            </strong>
                                        </p>
                                        <input id="agregarPrenda" value="Agregar Prenda"
                                               class="btn btn-primary botonRegistrar" onclick=cambiarValor()
                                               style="margin-top: 20px;">
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-group">
                                            <li class="list-group-item active" aria-current="true">Ropa Agregada</li>
                                                <c:forEach items="${lstRopaTotal}" var="ropa">
                                                <li class="list-group-item">
                                                    <c:out value="${ropa}"></c:out>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Bordered Entrega -->

                            <div class="tab-pane fade" id="bordered-entrega" role="tabpanel" aria-labelledby="entrega-tab">
                                <h6>Datos de Entrada y Salida</h6>
                                <div class="mb-3 row">
                                    <input type="text" class="form-control" name="observacion" placeholder="Observacion">
                                </div>
                                <div class="mb-3 row imput-group">
                                    <span class="input-group-text">Fecha de Entrega</span>
                                    <input type="date" name="fecha_entrega">
                                </div>

                                <input class="btn btn-primary" type="submit" value="Registrar pedido"
                                       onclick=completarPedido()>

                            </div>

                        </div><!-- End Bordered Tabs -->
            </form>
                    </div>
                </div>
        </main><!-- End #main -->


        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <%@include file="../../Common/footer.html" %>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <%@include file="../../Common/imports.html" %>
        <script src="http://localhost:8080/lavanderia/js/pedido.js" ></script>
    </body>

</html>