<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.lavanderia.proc.mantenimientos.BOGestionClientes"%>
<%@page import="pe.edu.lavanderia.entidades.jdbc.Clientes"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Clientes - Lavanderia</title>
        <%@ include file="../Common/estilos.html" %>
    </head>
    <body class="m-0 vh-100 row justify-content-center align-items-center"
          style="background-image: url('http://localhost:8080/lavanderia/images/fondo2.jpg');">
        <%@ include file="../Common/body.html" %>
        <div class="page">
            <a class="btn btn-primary" href="http://localhost:8080/lavanderia/pages/Lavanderia/menu.jsp">Volver al Menu</a>
            <div style="background: white; color: black;">
                <a class="btn btn-primary" data-target="#nuevoEmpleado" data-toggle="modal" >Agregar Empleado</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellido Paterno</th>
                            <th scope="col">Apellido Materno</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Contraseña</th>                            
                            <th scope="col">Tipo</th>
                            <th scope="col">Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lst}" var="empleado">
                            <tr>
                                <td id="codigo"><c:out value="${empleado.cod}"></c:out></td>
                                <td id="nombre"><c:out value="${empleado.nombre}"></c:out></td>
                                <td id="apePaterno"><c:out
                                        value="${empleado.apellidoPaterno}"></c:out></td>
                                <td id="apeMaterno"><c:out
                                        value="${empleado.apellidoMaterno}"></c:out></td>
                                <td id="dni"><c:out value="${empleado.dni}"></c:out></td>
                                <td id="celular"><c:out value="${empleado.celular}"></c:out></td>
                                <td id="usuario"><c:out value="${empleado.usuario}"></c:out></td>
                                <td id="contraseña"><c:out value="${empleado.contraseña}"></c:out></td>
                                <td id="tipo"><c:out value="${empleado.tipo}"></c:out></td>
                                    <td>
                                        <button class="btn btn-primary" data-target="#editEmpleado"
                                                data-codi="${empleado.cod}" data-nombres="${empleado.nombre}"
                                        data-pa="${empleado.apellidoPaterno}"
                                        data-ma="${empleado.apellidoMaterno}" data-dni="${empleado.dni}"
                                        data-celular="${empleado.celular}"
                                        data-usuario="${empleado.usuario}"
                                        data-contra="${empleado.contraseña}"
                                        data-toggle="modal">Editar</button>

                                    <button class="btn btn-primary editar"
                                            data-target="#deleteEmpleado" data-toggle="modal"
                                            data-codi="${empleado.cod}">Eliminar</button>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>

                <!-- Modal Agregar-->
                <div class="modal fade" id="nuevoEmpleado" tabindex="-1"
                     aria-labelledby="nuevoEmpleado" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="nuevoEmpleado">Agregar Empleado</h5>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/ServletEmpleados"
                                      method="get">
                                    <input type="hidden" name="instruccion" value="new" />

                                    <select class="form-select" name="empleado"
                                            aria-label="Tipo Empleado">
                                        <option value="empleado">empleado</option>
                                        <option value="administrador">administrador</option>
                                    </select> 

                                    <div class="mb-3 row" style="display: none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="codigo" value="" />
                                        </div>
                                    </div>
                                    <div class="mb-3 row" style="margin-top: auto">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Nombres</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nombres"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Paterno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="pa" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Materno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="ma" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">DNI</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="dni" value=""
                                                   maxlength=8
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Celular</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="celular"
                                                   value="" maxlength=9
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="usuario"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="contra" value="" required/>
                                        </div>
                                    </div>
                                    <input type="submit" value="Agregar"
                                           class="btn btn-dark botonRegistrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Modal Editar-->
                <div class="modal fade" id="editEmpleado" tabindex="-1"
                     aria-labelledby="editEmpleado" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editEmpleado">Editar Empleado</h5>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/ServletEmpleados"
                                      method="get">
                                    <input type="hidden" name="instruccion" value="edit" />

                                    <select class="form-select" name="empleado"
                                            aria-label="Tipo Empleado">
                                        <option value="empleado">empleado</option>
                                        <option value="administrador">administrador</option>
                                    </select> 

                                    <div class="mb-3 row" style="display: none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="codi" value="" />
                                        </div>
                                    </div>
                                    <div class="mb-3 row" style="margin-top: auto">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Nombres</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="nombres"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Paterno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="pa" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Apellido
                                            Materno</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="ma" value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">DNI</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="dni" value=""
                                                   maxlength=8
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Celular</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="celular"
                                                   value="" maxlength=9
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="usuario"
                                                   value="" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="contra" value="" required/>
                                        </div>
                                    </div>
                                    <input type="submit" value="Editar"
                                           class="btn btn-dark botonRegistrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Borrar-->
                <div class="modal fade" id="deleteEmpleado" tabindex="-1"
                     aria-labelledby="deleteEmpleado" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteEmpleado">Eliminar Cliente</h5>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/ServletEmpleados" method="get" >
                                    <input type="hidden" name="instruccion" value="delete" />                                    
                                    <div class="mb-3 row" style="display: none;">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Codigo</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="codi" value="" />
                                        </div>
                                    </div>
                                    <h4 style="text-align: center" >El cliente sera borrado permanentemente</h4>
                                    <h5 style="text-align: center" >¿Esta seguro?</h5>
                                    <input type="submit" value="Borrar" class="btn btn-primary">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Cancelar</button>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="http://localhost:8080/lavanderia/js/core.min.js"></script>
        <script src="http://localhost:8080/lavanderia/js/script.js"></script>
        <script src="http://localhost:8080/lavanderia/js/gestionEmpleado.js"></script>
    </body>
</html>