<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Prendas - Lavanderia - Personal</title>
        <%@ include file="../Common/estilos.html" %>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../Common/body.html" %>

        <div class="page">            
            <div class=" container col-auto bg-danger p-5 text-center" style="background: white; color: black;" >
                <div class="row row-cols-1 row-cols-md-2 g-4">                    
                    <!-- Tabla Tipo Prenda -->
                    <div class="col-lg-6 col-sm-12">
                        <h3>Tabla Tipo Prenda</h3>
                        <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregarTP"
                                data-toggle="modal">Agregar Tipo Prenda</button>
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Cod Tipo Prenda</th>
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
                                                Editar</button>
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#deleteTP" data-cod="${tipoPrenda.codTipoPrenda}" >Eliminar</button>
                                        </td>
                                    </tr>
                                </c:forEach>                                                
                            </tbody>
                        </table>
                    </div>
                    <!-- Tabla Tipo Tela -->
                    <div class="col-lg-6 col-sm-12">
                        <h3>Tabla Tipo Tela</h3>
                        <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregarTT"
                                data-toggle="modal">Agregar Tipo Tela</button>
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Cod Tipo Tela</th>
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
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#editarTP" data-cod="${tela.cod_tipoTela}" 
                                                    data-tipo="${tela.tipoTela}">
                                                Editar</button>
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#deleteTP" data-cod="${tela.cod_tipoTela}" >Eliminar</button>
                                        </td>
                                    </tr>
                                </c:forEach>                                                
                            </tbody>
                        </table>
                    </div>

                    <!-- Tabla Prendas -->
                    <div class="col-lg-12 col-sm-12">
                        <h3>Tabla Prendas</h3>
                        <button type="button" class="btn btn-primary" style="margin: 15px;" data-target="#agregar"
                                data-toggle="modal">Agregar Prenda</button>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Cod - Tipo Prenda</th>
                                    <th scope="col">Cod - Tipo Tela</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${lst}" var="prenda">
                                    <tr>
                                        <td id="cod" > <c:out value="${prenda.cod}" ></c:out> </td>
                                        <td id="tipoPrenda"><c:out value="${prenda.cod_tipoPrenda}" >  </c:out></td>
                                        <td id="tipoTela" > <c:out value="${prenda.cod_tipoTela}" ></c:out> </td>
                                        <td id="color" > <c:out value="${prenda.color}" ></c:out> </td>
                                            <td>
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#editar"
                                                        data-cod="${prenda.cod}"                                                     
                                                data-color="${prenda.color}"
                                                >
                                                Editar</button>
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#delete" data-cod="${prenda.cod}" >Eliminar</button>
                                        </td>
                                    </tr>
                                </c:forEach>                                                
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>

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


        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionPrendas.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
    </body>
</html>