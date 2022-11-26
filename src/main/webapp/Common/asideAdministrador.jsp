<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
        <a class="nav-link " href="<%=request.getContextPath()%>/ServletLoadPedidos">
            <i class="bi bi-grid"></i>
            <span>Inicio</span>
        </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-item">
        <a class="nav-link " href="<%=request.getContextPath()%>/ServletPedidos">
          <i class="bi bi-cart-plus"></i>
          <span>Nuevo Pedido</span>
        </a>
    </li><!-- End Dashboard Nav -->
    
    <li class="nav-item">
        <a class="nav-link " href="<%=request.getContextPath()%>/ServletConfirmacionVisita">
          <i class="bi bi-cart-plus"></i>
          <span>Confirmar Visita Domiciliaria</span>
        </a>
    </li><!-- End Dashboard Nav -->
    
    <li class="nav-heading">Pages</li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletListaClientes">
            <i class="bi bi-person"></i>
            <span>Mantenimiento Clientes</span>
        </a>
    </li><!-- End Profile Page Nav -->

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletEmpleados">
            <i class="bi bi-people-fill"></i>
            <span>Mantenimiento Empleados</span>
        </a>
    </li><!-- End F.A.Q Page Nav -->

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletServicios">
            <i class="bi bi-gear"></i>
            <span>Mantenimiento Servicios</span>
        </a>
    </li><!-- End Contact Page Nav -->

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletCategorias">
            <i class="bi bi-grid-1x2"></i>
            <span>Mantenimiento Categorias</span>
        </a>
    </li><!-- End Register Page Nav -->

    <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ServletPrendas">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Mantenimiento Prendas</span>
        </a>
    </li><!-- End Login Page Nav -->
</ul>
