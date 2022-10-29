<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="es">
    <head>
        <title>Programar Visita</title>
        <%@ include file="../../Common/estilos.html" %>
    </head>

    <body style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../../Common/body.html" %>
        <div class="page">                        
            
            <div class=" container col-auto bg-danger p-5 text-center">
                <form class="formulario"  method="get" action="<%=request.getContextPath()%>/ServletPedidos" name="formulario" style="width:100%; ">
                    <div class="row row-cols-1 row-cols-md-2 g-4">               
                        <div class="col-lg-6 col-sm-12">                        
                            <input type="hidden" id="instruccion" name="instruccion" value="buscar" />
                            <input type="hidden" id="instruccion" name="tipo" value="confirmacion" />
                            <input type="hidden" class="form-control" name="cod" required value="<%=request.getAttribute("cod")%>">
                            <h6>Datos del Cliente</h6>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="DNI" required value="<%=request.getAttribute("DNI")%>">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" readonly name="dire" required
                                           value="<%=request.getAttribute("direccion")%>" >
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="disableInput" name="nombre" required
                                           readonly value="<%=request.getAttribute("nombres")%>" >
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="disableInput" name="apellido" required
                                           readonly value="<%=request.getAttribute("apellidos")%>" >
                                </div>
                                <input type="submit" value="Buscar Cliente" class="btn btn-primary botonRegistrar">
                            </div>                            
                            <h6>Datos del pedido</h6>
                            <div class="row g-3">
                                <div class="col-md-6">                                    
                                    <label>Prenda:</label>
                                    <select class="form-select" aria-label="Prenda" name="prenda" >
                                        <option selected>Seleccione una prenda</option>
                                        <c:forEach items="${lstPrendas}" var="prenda" >                                        
                                            <option value="${prenda.cod}"> <c:out value="${prenda.cod}-${prenda.tipoPrenda}-${prenda.tipoTela}-${prenda.color}" ></c:out> </option>
                                        </c:forEach>
                                    </select>
                                </div> 
                                <div class="col-md-6">
                                    <input type="number" class="form-control" name="cantidad"  placeholder="Cantidad">
                                </div>

                            </div>
                            <h6>Servicio</h6>
                            <div class="row g-3">
                                <select class="form-select" aria-label="Servicios" name="servicio" >
                                    <option selected>Seleccione un servicio...</option>
                                    <c:forEach items="${list}" var="servicio" >                                        
                                        <option value="${servicio.cod}-${servicio.nombre}-${servicio.precio}"> <c:out value="${servicio.cod}-${servicio.nombre}-${servicio.precio}" ></c:out> </option>
                                    </c:forEach>
                                </select>
                            </div>                            
                            <input  id="agregarPrenda" value="Agregar Prenda" class="btn btn-primary botonRegistrar" onclick=cambiarValor() style="margin-top: 20px;" >
                        </div>
                        <!-- Lista de prendas agregadas -->
                        <div class="col-lg-6 col-sm-12">

                            <div class="formulario">
                                <h6>Datos de Entrada y Salida</h6>
                                <div class="mb-3 row">
                                    <input type="text" class="form-control" name="observacion"  placeholder="Observacion">
                                </div>
                                <div class="mb-3 row imput-group">
                                    <span class="input-group-text">Fecha de Entrega</span>
                                    <input type="date" name="fecha_entrega" required="" >
                                </div>                                
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item active" aria-current="true">Ropa Agregada</li>
                                    <c:forEach items="${lstRopaTotal}"  var="ropa">
                                    <li class="list-group-item"> <c:out value="${ropa}" ></c:out> </li>
                                    </c:forEach>                                                                                                                                                                                               
                            </ul>
                        </div>
                        <p> Monto total: <strong> <%=request.getAttribute("monto")%> </strong> </p>
                    </div>
                    <input class="btn btn-primary"  type="submit" value="Registrar pedido" onclick=completarPedido()>
                </form>
            </div>
        </div>
        <div class="snackbars" id="form-output-global"></div>


        <script src="http://localhost:8080/lavanderia/js/pedido.js" ></script>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>

</html>
