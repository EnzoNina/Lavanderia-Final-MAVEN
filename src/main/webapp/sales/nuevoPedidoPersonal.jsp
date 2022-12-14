<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<head>
    <title>Nuevo Pedido</title>
    <%@include file="../Common/estilosAdmin.html" %>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">
        <%@include file="../Common/header.jsp" %>
    </header><!-- End Header -->


    <!-- Reemplazar por import -->
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <%@include file="../Common/asideEmpleado.jsp" %>
    </aside><!-- End Sidebar-->

    <main id="main" class="main">
        <form class="formulario" method="get" action="<%=request.getContextPath()%>/ServletPedidos"
              name="formulario" id="formulario" >
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
                            <input type="hidden" class="form-control" name="cod" required value="<%=request.getSession().getAttribute("cod")%>">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="DNI" required
                                           value="<%=request.getSession().getAttribute("DNI")%>">
                                </div>
                                <div class="col-md-4">
                                    <input type="submit" value="Buscar Cliente" class="btn btn-primary botonRegistrar">
                                </div>                                    
                                <div class="col-md-12">
                                    <input type="text" class="form-control" id="disableInput" name="nombre" required
                                           readonly value="<%=request.getSession().getAttribute("nombres")%>" >
                                </div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" id="disableInput" name="apellido" required
                                           readonly value="<%=request.getSession().getAttribute("apellidos")%>" >
                                </div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" readonly name="dire" required
                                           value="<%=request.getSession().getAttribute("direccion")%>" >
                                </div>
                            </div>
                        </div>

                        <!-- Borderer Prendas -->
                        <div class="tab-pane fade" id="bordered-prendas" role="tabpanel" aria-labelledby="prendas-tab">
                            <div class="row">
                                <div class="col-lg-6">
                                    <!-- Customers Card -->
                                    <div class="col-xl-12">
                                        <!-- Recent Sales -->
                                        <div class="col-12">
                                            <div class="card recent-sales overflow-auto">
                                                <div class="card-body">
                                                    <h5 class="card-title">Prendas</h5>                                                        
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
                                                            <c:forEach items="${lstPrendas}" var="prenda">                                                                    
                                                                <tr>
                                                                    <td id="cod" > <c:out value="${prenda.cod}" ></c:out> </td>
                                                                    <td id="tipoPrenda"><c:out value="${prenda.tipoPrenda}" >  </c:out></td>
                                                                    <td id="tipoTela" > <c:out value="${prenda.tipoTela}" ></c:out> </td>
                                                                    <td id="color" > <c:out value="${prenda.color}" ></c:out> </td>                                                                            
                                                                        <td>
                                                                            <a class="btn btn-primary" data-toggle="modal" data-target="#addRopa" data-cod="${prenda.cod}"
                                                                           data-tp="${prenda.tipoPrenda}" data-tt="${prenda.tipoTela}" data-color="${prenda.color}"
                                                                           >
                                                                            <i class="bi bi-plus-square"></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach> 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- End Recent Sales -->
                                    </div>
                                </div>
                                <%-- Tabla de prendas agregadas --%>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <!-- Customers Card -->
                                        <div class="col-xl-12">
                                            <!-- Recent Sales -->
                                            <div class="col-12">
                                                <div class="card recent-sales overflow-auto">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Prendas Agregadas</h5>                                            
                                                        <table class="table table-borderless datatable">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">#</th>
                                                                    <th scope="col">Cantidad</th>
                                                                    <th scope="col">Accion</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${listaRopa}" var="ropa">
                                                                    <tr>
                                                                        <td>
                                                                            <c:out value="${ropa.cod}"></c:out>
                                                                            </td>
                                                                            <td>
                                                                            <c:out value="${ropa.cantidad}"></c:out>
                                                                            </td>
                                                                            <td>                                                                                    
                                                                                <a class="btn btn-primary" data-toggle="modal" data-target="#deletePrenda" data-cod="${ropa.cod}" >Eliminar</a>
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

                            <div class="row">

                                <div class="col-lg-6">
                                    <h6>Servicio</h6>
                                    <div class="row g-3">
                                        <select class="form-select" aria-label="Servicios" name="servicio">
                                            <option selected>Seleccione un servicio...</option>
                                            <c:forEach items="${list}" var="servicio">
                                                <option value="${servicio.cod}-${servicio.nombre}-${servicio.precio}-${servicio.descripcion}">
                                                    <c:out
                                                        value="Codigo:${servicio.cod}-Servicio:${servicio.nombre}-Precio:${servicio.precio}">
                                                    </c:out>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <p> Monto total:
                                        <strong>
                                            <%=request.getSession().getAttribute("monto")%>
                                        </strong>
                                    </p>
                                    <input id="agregarServicio" value="Agregar Servicio"
                                           class="btn btn-primary botonRegistrar" onclick=cambiarValor()
                                           style="margin-top: 20px;">
                                </div>

                                <div class="col-lg-6">
                                    <!-- Customers Card -->
                                    <div class="col-xl-12">
                                        <!-- Recent Sales -->
                                        <div class="col-12">
                                            <div class="card recent-sales overflow-auto">
                                                <div class="card-body">
                                                    <h5 class="card-title">Servicios Agregados</h5>                                            
                                                    <table class="table table-borderless datatable">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">Nombre</th>
                                                                <th scope="col">Precio</th>
                                                                <th scope="col">Accion</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listaServicio}" var="servicio">
                                                                <tr>
                                                                    <td>
                                                                        <c:out value="${servicio.cod}"></c:out>
                                                                        </td>
                                                                        <td>
                                                                        <c:out value="${servicio.nombre}"></c:out>
                                                                        </td>
                                                                        <td>
                                                                        <c:out value="${servicio.precio}"></c:out>
                                                                        </td>
                                                                        <td>                                                                                    
                                                                            <a class="btn btn-primary" data-toggle="modal" data-target="#deleteSV" data-cod="${servicio.cod}" data-precio="${servicio.precio}" >Eliminar</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach> 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- End Recent Sales -->
                                    </div>                                        
                                </div>                                    
                            </div><!-- End row-->

                        </div>                                                                        
                    </div>
                </div>
                <!-- Bordered Entrega -->

                <div class="tab-pane fade" id="bordered-entrega" role="tabpanel" aria-labelledby="entrega-tab" style="margin-left:30px;">
                    <h6>Datos de Entrada y Salida</h6>
                    <div class="mb-3 row">
                        <label class="form-label">Observacion</label>
                        <input type="text" class="form-control" name="observacion" id="observacion" placeholder="Observacion">
                    </div>
                    <div class="mb-3 row imput-group">
                        <label class="form-label">Fecha de Entrega</label>
                        <input type="date" name="fecha_entrega" id="fecha_entrega">
                    </div>

                    <a class="btn btn-success" data-toggle="modal" data-target="#generarBoleta">Boleta</a>

                    <input class="btn btn-primary" type="submit" value="Registrar Ingreso de Prendas"
                           onclick=completarIngreso()>

                </div>

            </div><!-- End Bordered Tabs -->
            </div>
            </div>
        </form>
    </main><!-- End #main -->

    <!--Agregar Prenda Modal-->
    <div class="modal fade" id="addRopa" tabindex="-1" aria-labelledby="addRopa" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addRopa">Agregar Ropa</h5>
                </div>
                <div class="modal-body">
                    <form id="addRopa" class="addRopa" name="addRopa"  method="get" action="<%=request.getContextPath()%>/ServletPedidos" >
                        <input type="hidden" name="instruccion" value="addRopa"/>                            
                        <div class="mb-3 row" style="display:none;">
                            <label for="text" class="col-sm-2 col-form-label">Codigo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="codigoPrenda" value="" />
                            </div>
                        </div>

                        <div class="mb-3 row" style="display:none;">
                            <label for="text" class="col-sm-2 col-form-label">Tipo Prenda</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="tp" value="" />
                            </div>
                        </div>

                        <div class="mb-3 row" style="display:none;">
                            <label for="text" class="col-sm-2 col-form-label">Tipo Tela</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="tt" value="" />
                            </div>
                        </div>

                        <div class="mb-3 row" style="display:none;">
                            <label for="text" class="col-sm-2 col-form-label">Color</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="color" value="" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="text" class="col-sm-2 col-form-label">Cantidad</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="cantidad" value=""  required/>
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

    <%-- Borrar Prenda Modal --%>        
    <div class="modal fade" id="deletePrenda" tabindex="-1" aria-labelledby="deletePrenda" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deletePrenda">Borrar Prenda</h5>
                </div>
                <div class="modal-body">
                    <form method="get" action="<%=request.getContextPath()%>/ServletPedidos">
                        <input type="hidden" name="instruccion" value="deleteRopa"/>
                        <h4>??Esta seguro que desea borrar la prenda?</h4>
                        <div class="mb-3 row" style="display:none;" >
                            <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="codPrenda" value="" />
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

    <%-- Borrar Servicio Modal --%>        
    <div class="modal fade" id="deleteSV" tabindex="-1" aria-labelledby="deleteSV" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteSV">Borrar Servicio</h5>
                </div>
                <div class="modal-body">
                    <form method="get" action="<%=request.getContextPath()%>/ServletPedidos" >
                        <input type="hidden" name="instruccion" value="deleteServicio"/>
                        <h4>??Esta seguro que desea borrar el servicio?</h4>
                        <div class="mb-3 row" style="display:none;" >
                            <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="codServicio" value="" />
                            </div>
                        </div>
                        <div class="mb-3 row" style="display:none;">
                            <label for="staticEmail" class="col-sm-2 col-form-label">Precio</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="precio" value="" />
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

    <%-- Generar Reporte Modal --%>        
    <div class="modal fade" id="generarBoleta" tabindex="-1" aria-labelledby="generarBoleta" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteSV">GenerarReporte</h5>
                </div>
                <div class="modal-body">
                    <form target="_blank" action="<%=request.getContextPath()%>/ServletPedidos" id="frmReporte" method="get">                            
                        <h4>Haga clic en generar para imprimir la boleta de venta</h4>
                        <input type="hidden" id="instruccion" name="instruccion" value="generarBoleta" />
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                Cerrar
                            </button>
                            <button type="submit" class="btn btn-primary">Generar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <%@include file="../Common/footer.html" %>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <%@include file="../Common/imports.html" %>
    <script src="http://localhost:8080/lavanderia/js/gestionaddRopa.js"></script>        
    <script src="http://localhost:8080/lavanderia/js/ingresoPrendas.js" ></script>
</body>

</html>