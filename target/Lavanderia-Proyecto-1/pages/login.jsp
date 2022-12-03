<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Login</title>
        <%@ include file="../Common/estilos.html" %>
    </head>

    <body>
        <%@ include file="../Common/body.html" %>
        <div class="page secca">
            <section class="section section-md bg-xs-overlay secca">
                <div class="container" id="contaCard">
                    <div class="row row-30 justify-content-center">
                        <div class="col-xl-3 col-md-6 col-12 wow fadeInDown" data-wow-delay=".3s">
                            <div class="pricing-box bg-gray-dark">
                                <div class="pricing-box-tittle">Usuarios</div>
                                <hr />
                                <div class="pricing-box-inner">
                                    <img src="../images/user.png" alt="Login Usuario" />
                                </div>
                                <a class="button button-190 button-circle btn-primary-rounded" data-toggle="modal"
                                   data-target="#exampleModal" style="color: white">Login
                                </a>
                                <a href="register.html">¿No tiene una cuenta? <span class="text-primary">Cree una ahora</span></a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-12 wow fadeInUp" data-wow-delay=".4s">
                            <div class="pricing-box bg-gray-primary">
                                <div class="pricing-box-tittle">Personal de Lavanderia</div>
                                <hr />
                                <div class="pricing-box-inner">
                                    <img src="../images/lavanderia-login.png" alt="Login Lavanderia" />
                                </div>
                                <a class="button button-190 button-circle btn-rounded-outline" data-toggle="modal"
                                   data-target="#modalLavanderia">Login</a>                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Modal User-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Login User</h5>
                        </div>
                        <div class="modal-body">
                            <form action="<%=request.getContextPath()%>/loginUsuario"  method="post">
                                <div class="mb-3 row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="user" />
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="pass" />
                                    </div>
                                </div>                                

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Iniciar Sesion
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal Empleado -->
            <div class="modal fade" id="modalLavanderia" tabindex="-1" aria-labelledby="modalLavanderia" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalLavanderia">Login Lavanderia</h5>
                        </div>
                        <div class="modal-body">
                            <form action="<%=request.getContextPath()%>/loginEmpleado"  method="post">
                                <div class="mb-3 row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="user" />
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="pass" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Iniciar Sesion
                                    </button>
                                </div>
                            </form>
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