<%-- 
    Document   : header
    Created on : 4 nov 2023, 23:24:25
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-10" style="margin-left: 30%">
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Ordenar libros
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Autor</a></li>
                                <li><a class="dropdown-item" href="#">Fecha publicacion</a></li>
                                <li><a class="dropdown-item">Nombre libro</a></li>
                                <li><a class="dropdown-item" href="#">ID</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                    <form class="d-flex" action="SvBuscar" method="POST" role="search">
                        <input class="form-control me-2" type="search" placeholder="Buscar por Titulo" aria-label="search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>
    </body>
</html>
