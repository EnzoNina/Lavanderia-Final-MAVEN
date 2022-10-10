<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pe.edu.lavanderia.entidades.jdbc.Categorias"%>
<%@ page import="pe.edu.lavanderia.proc.mantenimientos.BOGestionCategorias"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

<head>
<title>Categorias - Lavanderia</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/tabulator.min.css">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Montserrat:300,400,700%7CPoppins:300,400,500,700,900" />
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/fonts.css" />
<link rel="stylesheet" href="../css/style.css" />
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

html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {
	display: block;
}
</style>
</head>

<body class="m-0 vh-100 row justify-content-center align-items-center"
	style="background-image: url('../images/fondo2.jpg');">
	<div class="ie-panel">
		<a href="http://windows.microsoft.com/en-US/internet-explorer/"><img
			src="../images/ie8-panel/warning_bar_0000_us.jpg" height="42"
			width="820"
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
		<div style="background: white; color: black;">
		<button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#exampleModal"
                data-toggle="modal">Agregar categoria</button>
			<%
			BOGestionCategorias bo = new BOGestionCategorias();
			List<Categorias> list = bo.getCategorias();
			%>


			<table class="table">
				<thead>
					<tr>
						<th scope="col">Codigo</th>
						<th scope="col">Nombre</th>
						<th scope="col">Descripcion</th>
						<th scope="col">Estado</th>
						<th scope="col">Accion</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Categorias categoria : list) {
					%>
					<tr>
						<td><%=categoria.getCod_categoria()%></td>
						<td><%=categoria.getNombre()%></td>
						<td><%=categoria.getDescripcion()%></td>
						<td>
							<%
							if (categoria.getEstado()) {
							%> Disponible <%
							} else {
							%> No disponible
							<%
							}
							%>
						</td>
						<td>
							<a >Editar</a>
							<a>Eliminar</a>
						</td>						
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar categoria</h5>
                    </div>
                    <div class="modal-body">
                        <form action="post">
                            <div class="mb-3 row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Categoria</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="staticEmail" />
                                </div>
                            </div>                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            Cerrar
                        </button>
                        <button type="button" class="btn btn-primary">
                            <a >Agregar</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
		</div>
	</div>
	<div class="snackbars" id="form-output-global"></div>
	<script src="../js/core.min.js"></script>
	<script src="../js/script.js"></script>	
</body>
</html>