<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
        <a class="nav-link " href="">
            <i class="bi bi-grid"></i>
            <span>Inicio</span>
        </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-heading">Pages</li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletVisitaDomiciliaria">
            <i class="bi bi-person"></i>
            <span>Programar Visita Domiciliaria</span>
        </a>
    </li><!-- End Profile Page Nav -->

    <li class="nav-item">
        <a class="nav-link collapsed" href="">
            <i class="bi bi-person"></i>
            <span>Mis Pedidos</span>
        </a>
    </li><!-- End Profile Page Nav -->

</ul>
