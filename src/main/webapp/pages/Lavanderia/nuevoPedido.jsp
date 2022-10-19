<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="es">
    <head>
        <title>Programar Visita</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="icon" href="http://localhost:8080/lavanderia/images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css"
              href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/bootstrap.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/fonts.css" />
        <link rel="stylesheet" href="http://localhost:8080/lavanderia/css/style.css" />
        <style>
            .ie-panel {
                display: none;
                background: #212121;
                padding: 10px 0;
                box-shadow: 3px 3px 5px 0 rgba(0, 0, 0, 0.3);
                clear: both;
                text-align: center;
                position: relative;
                z-index: 1;
            }

            html.ie-10 .ie-panel,
            html.lt-ie-10 .ie-panel {
                display: block;
            }
        </style>
    </head>

    <body style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <div class="ie-panel">
            <a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
                    src="../images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820"
                    alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
        </div>
        <div class="preloader">
            <div class="preloader-body">
                <div class="cssload-container">
                    <div class="cssload-speeding-wheel"></div>
                </div>
                <p>Cargando...</p>
            </div>
        </div>
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
                                    <input type="text" class="form-control" name="prendas"  placeholder="Prendas">
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
                                    <span class="input-group-text">Fecha estimada de entrega</span>
                                    <input type="date" name="fecha_estimada" value="2022-09-01T21:09">
                                </div>

                                <div class="mb-3 row imput-group">
                                    <span class="input-group-text">Fecha de entrega</span>
                                    <input type="date" name="fecha_entrega" value="2022-09-01T21:09">
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
