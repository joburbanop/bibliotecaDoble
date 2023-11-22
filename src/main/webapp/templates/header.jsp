<%-- 
    Document   : header
    Created on : 4 nov 2023, 23:24:25
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .navbar {
            background: linear-gradient(to left, #143d7a, #2b5fa3)!important;
            padding: 10px; /* Espaciado interno */
            color: white; /* Color de texto */
        }
    </style>
    <body>

        <nav class="navbar navbar-expand-lg bg-primary">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        
                    </ul>

                    <div class="navbar-text text-center me-auto ms-auto">
                        <h2 class="fw-semibold" style="color: white;">"Leer te lleva a lugares inimaginables".</h2>
                    </div>

                    <form class="d-flex" role="search" onsubmit="return openModal()">
                        <input class="form-control me-2" type="search" name="titulo_libro" placeholder="Buscar por Título" aria-label="search">
                        <button class="text-bg-light p-3" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- ventana Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles del libro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="perro-details">
                           
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function openModal() {
                // Obtén el valor del campo de búsqueda
                var tituloLibro = $('input[name="titulo_libro"]').val();

                console.log("desde modal" + tituloLibro);
                // Realiza una solicitud AJAX al servlet SvBuscar
                $.ajax({
                    url: 'SvBuscar?titulo_libro=' + tituloLibro, 
                    method: 'POST',
                    success: function (data) {
                        
                        $('#perro-details').html(data);
                        // Abre el modal
                        $('#myModal').modal('show');
                    },
                    error: function () {
                        // Maneja errores aquí si es necesario
                        console.log('Error al cargar los detalles del perro.');
                    }
                });

                // Devuelve false para evitar que el formulario se envíe normalmente
                return false;
            }
        </script>

    </body>
</html>
