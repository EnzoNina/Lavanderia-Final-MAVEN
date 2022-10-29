<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="wide wow-animation" lang="en">

    <head>
        <title>Contactanos</title>
        <%@ include file="../Common/estilos.html" %>
    </head>

    <body>
        <%@ include file="../Common/body.html" %>
        <div class="page">
            <header class="section page-header">
                <!--RD Navbar-->
                <div class="rd-navbar-wrap">
                    <nav class="rd-navbar rd-navbar-classic" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed"
                         data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static"
                         data-lg-device-layout="rd-navbar-static" data-xl-layout="rd-navbar-static"
                         data-xl-device-layout="rd-navbar-static" data-lg-stick-up-offset="46px" data-xl-stick-up-offset="46px"
                         data-xxl-stick-up-offset="46px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
                        <div class="rd-navbar-collapse-toggle rd-navbar-fixed-element-1" data-rd-navbar-toggle=".rd-navbar-collapse">
                            <span></span>
                        </div>
                        <div class="rd-navbar-aside-outer rd-navbar-collapse bg-gray-dark">
                            <div class="rd-navbar-aside">
                                <ul class="list-inline navbar-contact-list">
                                    <li>
                                        <div class="unit unit-spacing-xs align-items-center">
                                            <div class="unit-left">
                                                <span class="icon text-middle fa-phone"></span>
                                            </div>
                                            <div class="unit-body">
                                                <a href="tel:#">+51 901 541 321</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="unit unit-spacing-xs align-items-center">
                                            <div class="unit-left">
                                                <span class="icon text-middle fa-envelope"></span>
                                            </div>
                                            <div class="unit-body">
                                                <a href="mailto:#">lavaUTP@gmail.com</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="unit unit-spacing-xs align-items-center">
                                            <div class="unit-left">
                                                <span class="icon text-middle fa-map-marker"></span>
                                            </div>
                                            <div class="unit-body">
                                                <a href="#">Av. Tupac Amaru 160</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="rd-navbar-main-outer">
                            <div class="rd-navbar-main">
                                <!--RD Navbar Panel-->
                                <div class="rd-navbar-panel">
                                    <!--RD Navbar Toggle-->
                                    <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap">
                                        <span></span>
                                    </button>
                                    <!--RD Navbar Brand-->
                                    <div class="rd-navbar-brand">
                                        <!--Brand--><a class="brand" href="../aea.html"><img class="brand-logo-dark"
                                                                                             src="../images/lavanderia.png" alt="Lavanderia UTP" width="100" height="17" /><img
                                                                                             class="brand-logo-light" src="../images/lavanderia.png" alt="" width="100" height="17" /></a>
                                    </div>
                                </div>
                                <div class="rd-navbar-main-element">
                                    <div class="rd-navbar-nav-wrap">
                                        <ul class="rd-navbar-nav">
                                            <li class="rd-nav-item active">
                                                <a class="rd-nav-link" href="../aea.html">Home</a>
                                            </li>
                                            <li class="rd-nav-item">
                                                <a class="rd-nav-link" href="about.html">Acerca</a>
                                            </li>
                                            <li class="rd-nav-item">
                                                <a class="rd-nav-link" href="contacts.html">Contactanos</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <section class="section section-intro context-dark">
                <div class="intro-bg" style="
                     background: url(../images/fondo.jpg) no-repeat;
                     background-size: cover;
                     background-position: top center;
                     "></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 text-center">
                            <h1 class="font-weight-bold wow fadeInLeft">Contactanos</h1>
                            <p class="intro-description wow fadeInRight">
                                Contactanos para recibir las nuevas actualizaciones.
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!--Mailform-->
            <section class="section section-md">
                <div class="container">
                    <!--RD Mailform-->
                    <div class="row justify-content-center">
                        <div class="col-xl-6 col-md-8 col-12">
                            <form class="rd-mailform text-left" data-form-output="form-output-global" data-form-type="contact"
                                  method="post" action="bat/rd-mailform.php">
                                <div class="form-wrap">
                                    <label class="form-label" for="contact-name">Nombre<span class="req-symbol">*</span></label>
                                    <input class="form-input" id="contact-name" type="text" name="name" data-constraints="@Required" />
                                </div>
                                <div class="form-wrap">
                                    <label class="form-label" for="contact-phone">Numero<span class="req-symbol">*</span></label>
                                    <input class="form-input" id="contact-phone" type="text" name="phone"
                                           data-constraints="@Required @PhoneNumber" />
                                </div>
                                <div class="form-wrap">
                                    <label class="form-label" for="contact-email">E-Mail<span class="req-symbol">*</span></label>
                                    <input class="form-input" id="contact-email" type="email" name="email"
                                           data-constraints="@Required @Email" />
                                </div>
                                <div class="form-wrap">
                                    <label class="form-label label-textarea" for="contact-message">Mensaje<span
                                            class="req-symbol">*</span></label>
                                    <textarea class="form-input" id="contact-message" name="message"
                                              data-constraints="@Required"></textarea>
                                </div>
                                <div class="form-button group-sm text-center text-lg-left">
                                    <button class="button button-primary" type="submit">
                                        Enviar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <footer class="section footer-classic section-sm">
                <div class="container">
                    <div class="row row-30">
                        <div class="col-lg-3 wow fadeInLeft">
                            <!--Brand--><a class="brand" href="index.html"><img class="brand-logo-dark" src="../images/lavanderia.png"
                                                                                alt="" width="100" height="17" /><img class="brand-logo-light" src="../images/lavanderia.png" alt=""
                                                                                width="100" height="17" /></a>
                            <p class="footer-classic-description offset-top-0 offset-right-25">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Culpa
                                repellendus omnis obcaecati vel ipsam ad eius quo id commodi
                                enim!
                            </p>
                        </div>
                        <div class="col-lg-3 col-sm-8 wow fadeInUp">
                            <p class="footer-classic-title">Información de contacto</p>
                            <div class="d-block offset-top-0">
                                Av. Tacna y Arica 160<span class="d-lg-block">Arequipa, Perú</span>
                            </div>
                            <a class="d-inline-block accent-link" href="mailto:#">lavaUTP@gmail.com</a><a class="d-inline-block"
                                                                                                          href="tel:#">+51 901 541 321</a>
                            <ul>
                                <li>
                                    Lun-Vie:<span class="d-inline-block offset-left-10 text-white">9:30 AM - 9:00 PM</span>
                                </li>
                                <li>
                                    Sabado:<span class="d-inline-block offset-left-10 text-white">10:00 AM - 9:00 PM</span>
                                </li>
                                <li>
                                    Domingo:<span class="d-inline-block offset-left-10 text-white">10:00 AM - 3:00 PM</span>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-sm-4 wow fadeInUp" data-wow-delay=".3s">
                            <p class="footer-classic-title">Enlaces Rapidos</p>
                            <ul class="footer-classic-nav-list">
                                <li><a href="../aea.html">Home</a></li>
                                <li><a href="../pages/about.html">Acerca</a></li>
                                <li><a href="../pages/contacts.html">Contacts</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-4 wow fadeInLeft" data-wow-delay=".2s">
                            <p class="footer-classic-title">Boletin Informativo</p>
                            <form class="rd-mailform text-left footer-classic-subscribe-form" data-form-output="form-output-global"
                                  data-form-type="contact" method="post" action="bat/rd-mailform.php">
                                <div class="form-wrap">
                                    <label class="form-label" for="subscribe-email">Tu correo electronico</label>
                                    <input class="form-input" id="subscribe-email" type="email" name="email"
                                           data-constraints="@Email @Required" />
                                </div>
                                <div class="form-button group-sm text-center text-lg-left">
                                    <button class="button button-primary button-circle" type="submit">
                                        Enviar
                                    </button>
                                </div>
                            </form>
                            <p>Se el primero en recibir nuestras mejores ofertas.</p>
                        </div>
                    </div>
                </div>
                <div class="container wow fadeInUp" data-wow-delay=".4s">
                    <div class="footer-classic-aside">
                        <p class="rights">
                            <span>&copy;&nbsp;</span><span class="copyright-year"></span> Todos los derechos
                            reservador. Diseñado por Alumnos de la UTP
                        </p>
                    </div>
                </div>
            </footer>
        </div>
        <div class="snackbars" id="form-output-global"></div>
        <script src="../js/core.min.js"></script>
        <script src="../js/script.js"></script>
    </body>

</html> F

