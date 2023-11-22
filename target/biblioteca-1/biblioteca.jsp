<%-- 
    Document   : biblioteca
    Created on : 4 nov 2023, 16:40:57
    Author     : danie
--%>

<%@page import="com.umariana.biblioteca.Biblioteca"%>
<%@page import="java.util.List"%>
<%@page import="com.umariana.biblioteca.Libros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/e153d37948.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
        <link rel="stylesheet" href="css/bibliotecaStyle.css">
        <link rel="stylesheet" href="css/lightbox.css">
        
        <style>
        
        .custom-card {
            background:  #16386b;
            border: 1px solid rgb(52, 73, 94);
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(52, 73, 94, 0.5);
            padding: 20px;
            transition: transform 0.3s;
            margin: 0 auto;
            max-width: 600px;
        }

        .custom-card:hover {
            transform: scale(1.05);
        }

        .form-title {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #ff1900;
        }

        .btn-primary {
            background: #ff9900;
            color: #16386b;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-primary:hover {
            background: #0056b3;
        }
        .coffee-card {
            background-color: white;
            color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(52, 73, 94, 0.5);
            margin-bottom: 20px; /* Adjust the margin as needed */
        }

        .coffee-card .card-header {
            background-color:  #16386b;
            color: #FFF;
            border-bottom: 1px solid #b3833c;
        }
        /* Additional styles for event cards */
         .event-card {
            background-color: #16386b;
            margin: 10px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(52, 73, 94, 0.5);
            max-width: 500px;
            display: inline-block; /* Added this property */
            text-align: center; /* Adjusted text alignment */
           
        }

        .event-card img {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        
        .event-card h5,
        .event-card p,
        .event-card .btn {
            color: white;
            text-align: center; /* Adjusted text alignment */
        }

        .event-card .btn {
            background-color: #b3833c;
        }

        .event-card .btn:hover {
            background-color: #b3833c;
        }
        

        #sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 264px;
            background: linear-gradient(to right, #143d7a, #2b5fa3);
            box-shadow: 0 0 35px 0 rgba(52, 73, 94, 0.5);
            z-index: 1000;
            color: white;
            overflow-y: auto; /* Agregar barra de desplazamiento vertical si es necesario */
        }
     

    </style>
    </head>
    <body>
        <%
            String nombreUsuario = (String) session.getAttribute("nombre_usuario");
            ServletContext context = getServletContext();
        %>
        <%@include file="templates/header.jsp"%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <div class="wrapper"> <!-- clase contenedora -->

            <!-- barra lateral -->
            <aside id="sidebar">
                <div class="h-100">

                    <div class="sidebar-logo">
                        <a href="#" style="color:white;">
                            <i class="fa-solid fa-door-open"></i>
                            ¡Bienvenido <%= nombreUsuario%>!
                        </a>
                    </div>
                    <!-- Sidebar Navigation -->
                    <ul class="sidebar-nav">
                        <li class="sidebar-header" style="color:white;">

                            <h2>Acciones</h2>
                        </li>

                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link" id = "inicio" style="color:white;">
                                <i class="fa-solid fa-home"  style="color:white;"></i>
                                Inicio
                            </a>
                        </li>
                      

                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link" id = "mostrarTusLibros" style="color:white;">
                                <i class="fa-solid fa-eye"  style="color:white;"></i>
                                Tus libros
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link" id = "mostrarTarea" style="color:white;">
                                <i class="fa-solid fa-book-bookmark"  style="color:white;"></i>
                                Libros disponibles
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" id="mostrarFormulario"  style="color:white;">
                                <i class="fa-solid fa-plus " style="color:white;"></i>
                                Agregar libro
                            </a>
                        </li>


                        <li class="sidebar-item">
                            <a href="index.jsp" class="sidebar-link-4" id = ""  style="color:white;">
                                <i class="fa-solid fa-door-closed" style="color:white;"></i>
                                Salir
                            </a>
                        </li>

                    </ul>

                </div>

            </aside>

            <section>

            </section>

            <div class="container-fluid"> 

                <div class="row">

                    <!-- Inicio -->
                    <div class="col-lg-12 d-flex justify-content-center align-items-center"  >






                        <section id="contenidoInicio" style="margin-top: 2%; margin-right: 10%; margin-left: 15%;">

                            <section>
                     
                               
                             <h1 class="text-center">Estadisticas de lectura</h1>
                            <div class="container" style="margin-left: 10%;">
                                <div class="row">
                                <div class="col-md-6 mb-3">
                                <div class="card coffee-card">
                                 <div class="card-header">
                                    Estadísticas de Lectura Semanal
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">32,550 Artículos Leídos</h5>
                                        <canvas id="pieChart" width="200" height="100"></canvas>
                                </div>
                                </div>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <div class="card coffee-card">
                                            <div class="card-header">
                                             Tiempo Promedio de Lectura
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title">5.4 Minutos</h5>
                                            <canvas id="barChart" width="200" height="100"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </section>
                           
                            
                            <h1 class="text-center" >Libros para comenzar a leer</h1>
                            <div class="container">

                             <div id="carouselExampleDark" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="imagenes/casa_de_los_espiritus_1.jpg" class="d-block w-100" alt="...">
                                         
                                        </div>
                                        <div class="carousel-item" >
                                            <img src="imagenes/isamister_1.jpg" class="d-block w-100" alt="...">
                                          
                                        </div>
                                        <div class="carousel-item" >
                                            <img src="imagenes/cortazar.jpg" class="d-block w-100" alt="...">
                                            
                                        </div>
                                        
                                          <div class="carousel-item" >
                                            <img src="imagenes/yorobot.jpg" class="d-block w-100" alt="...">
                                       
                                        </div>
                                        
                                        <div class="carousel-item">
                                            <img src="imagenes/muerte.jpg" class="d-block w-100" alt="...">
                                         
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            
                            
                            </div>
                            
                            <div style="margin-top: 10%;" class="row">
                                <div class="col-lg-12 d-flex justify-content-center align-items-center " style='margin-top: 5%;'>
                                    <h1>Eventos</h1>
                                </div>

                                <div>

                                   
                                   <div class="row container">

                                        <!-- Presentaciones de autores -->
    
                                        <div class="col-lg-12 text-center">
                                            <div class="event-card" style="margin-center: 15%;">
                                                <img src="imagenes/autores.jpg" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                <h5 class="card-title" style="color: white;">Evento: Presentaciones de autores</h5>
                                                <p class="card-text" style="color: white;">Estás cordialmente invitado. Tendremos autores invitados en una capacitación virtual este viernes 25.</p>
                                                <a href="#" class="btn btn-primary" style="background-color: #464646;">Más información</a>
                                                 </div>
                                            </div>
                                        </div>

                                        <!-- Juegos en línea -->
    
                                        <div class="col-lg-12 text-center">
                                            <div class="event-card" style="margin-center: 15%;">
                                                <img src="imagenes/juegos_oline.jpg" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                     <h5 class="card-title" style="color: white;">Evento: Juegos en línea</h5>
                                                    <p class="card-text" style="color: white;">Organiza tu grupo para COMPETENCIA DE JUEGOS EDUCATIVOS VIRTUALES.</p>
                                                    <a href="#" class="btn btn-primary" style="background-color:#464646;">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>


                    <!-- Seccion de formulario para agregar nuevo -->
                    <div class="col-lg-12 d-flex justify-content-center align-items-center" style='margin-top: 5%;'> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->



                        <form id="formularioTarea" action="/biblioteca/SvAgregarLibro" method="post" style="display: none; margin-left: 20%" enctype="multipart/form-data">
                            <div class="custom-card" style="background-color: #f2f4f8; color: black;" >
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="form-title">Agrega Libro</h4>

                                        <div class="form-group">
                                            <label for="id">Id</label>
                                            <input type="text" name="id" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="titulo">Titulo</label>
                                            <input type="text" name="titulo" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="autor">Autor</label>
                                            <input type="text" name="autor" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="margin-top:10%">
                                        <div class="form-group">
                                            <label for="anio">Año publicación</label>
                                            <input type="text" name="anio" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="foto">Foto</label>
                                            <input type="file" name="fotos" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="estado">Estado</label>
                                            <select name="estado" class="form-control" required>
                                                <option value="Disponible" style="color:white">Disponible</option>
                                                <option value="No disponible" style="color:white">No Disponible</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary " >Agregar libro</button>
                            </div>
                        </form>




                    </div>


                    <%--seccion card para visualizar los libros  agregadas, dependiendo de su estado  --%>
                    <div class="col-lg-12 d-flex justify-content-center align-items-center">
                        <div>
                            <section id="tablaTarea" class="table table-striped" style="display: none; margin-left: 20%;">
                                <h2 style="color: rgb(21, 21, 21); text-align: center; margin-top: 5%;">Galería de Libros</h2>

                                <div class="container">
                                    <div style="background-color: #D2B48C; color: white;color: rgb(21, 21, 21); display: flex; flex-wrap: wrap; justify-content: center;">
                                        <% List<Libros> libros = Biblioteca.obtenerTodosLosLibros();
                                            for (Libros libro : libros) {
                                                if (libro.getEstado().equals("Disponible")) {

                                        %>
                                        <div class="card" style="margin: 10px; width: 250px;" >
                                            <img src="./imagenes/<%=libro.getFoto()%>" class="card-img-top" alt="Portada del Libro">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=libro.getTitulo()%></h5>
                                                <p class="card-text">Autor: <%=libro.getAutor()%></p>
                                                <p class="card-text">Año de Publicación: <%=libro.getAnio()%></p>
                                                <p class="card-text">Estado: <%=libro.getEstado()%></p>

                                                <!-- Botones de editar y eliminar -->

                                                <form action="SvPedir" method="post">
                                                    <input type="hidden" name="id" value="<%=libro.getId()%>">
                                                    <button type="submit" class="btn btn-primary">Pedir</button>
                                                </form>


                                            </div>
                                        </div>
                                        <%
                                                }

                                            }
                                        %>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <%--seccion mostrar libros pedidos --%>
                    <div class="col-lg-12 d-flex justify-content-center align-items-center" >
                        <div id="tusLibros" class="table table-striped" style="display: none; margin-left: 20%;">

                            <h2 style="color: rgb(21, 21, 21); text-align: center; margin-top: 5%;">Tus Libros</h2>

                            <div class="container">
                                <div style="background-color: #D2B48C; color: rgb(21, 21, 21); display: flex; flex-wrap: wrap; justify-content: center;">
                                    <% List<Libros> tusLibros = Biblioteca.cargarDesdeArchivoPedido(context, nombreUsuario);
                                        for (Libros libro : tusLibros) {


                                    %>
                                    <div class="card" style="margin: 10px; width: 250px;" >
                                        <img src="./imagenes/<%=libro.getFoto()%>" class="card-img-top" alt="Portada del Libro">
                                        <div class="card-body">
                                            <h5 class="card-title"><%=libro.getTitulo()%></h5>
                                            <p class="card-text">Autor: <%=libro.getAutor()%></p>
                                            <p class="card-text">Año de Publicación: <%=libro.getAnio()%></p>
                                            <p class="card-text">Estado: <%=libro.getEstado()%></p>

                                            <!-- Botones de editar y eliminar -->

                                            <form action="SvCambiarEstadoLibro" method="post">
                                                <input type="hidden" name="id" value="<%=libro.getId()%>">
                                                <button type="submit" class="btn btn-success">Devolver</button>
                                            </form>
                                        </div>
                                    </div>
                                    <%

                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>

           
                                
                                
                                
                    <%--seccion mostrar libros ordenados --%>
                    <div>

                    </div>

                </div>
            </div>


            <section>


                <!-- Modal para editar información de la libros -->
                <div class="modal fade" id="editModalConfirm" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content custom-modal">

                            <div class="modal-body">


                                <form action="/mavenproject1/SvEditar"  method="POST"  >

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel">Editar Información de la Tarea de con ID: <input type="text" class="form-control" id="id" name="id"  readonly style="border: none; background: none;" readonly> </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                    </div>

                                    <div class="mb-3">
                                        <label for="titulo" class="form-label">Título</label>
                                        <input type="text" class="form-control" id="titulo" name="titulo">
                                    </div>
                                    <div class="mb-3">
                                        <label for="descripcion" class="form-label">Descripción</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion">
                                    </div>
                                    <div class="mb-3">
                                        <label for="fecha" class="form-label">Fecha de vencimiento</label>
                                        <input type="date" class="form-control" id="fecha" name="fecha">
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-success" id="guardarCambios">Guardar Cambios</button>
                                    </div>
                                </form>


                            </div>
                            <div class="modal-footer">
                                <input  type="submit" class="btn btn-secondary" style="margin-right: 10px;" value="Guardar cambios"> 

                            </div>
                        </div>
                    </div>
                </div>

            </section>                

            <!-- Agrega Chart.js desde un CDN -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script src="script/lightbox-plus-jquery.min.js"></script>                      
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>    
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            <%--Script para mostrar formulario tarea --%>                     

            <script>


                $(document).ready(function () {
                    $(".card").click(function () {
                        var img = $(this).find("img").attr("src");
                        var titulo = $(this).find(".card-title").text();
                        var autor = $(this).find(".card-text:nth-child(2)").text();
                        var anio = $(this).find(".card-text:nth-child(3)").text();

                        $.fancybox.open({
                            src: '<div style="text-align:center; padding: 15px;">' +
                                    '<img src="' + img + '" alt="Portada del Libro" style="width: 100%;">' +
                                    '<h5 style="margin-top: 15px;">' + titulo + '</h5>' +
                                    '<p>' + autor + '</p>' +
                                    '<p>' + anio + '</p>' +
                                    '<button type="submit" class="btn btn-success">Pedir prestado</button>' +
                                    '</div>',
                            type: 'inline'
                        });
                    });
                });

                // Datos para el gráfico de barras
                var barChartData = {
                    labels: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'],
                    datasets: [{
                            label: 'Artículos Leídos',
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                            data: [4000, 5200, 6000, 4800, 6000],
                        }]
                };

                // Datos para el gráfico de pastel
                var pieChartData = {
                    labels: ['Lectura Rápida', 'Lectura Media', 'Lectura Lenta'],
                    datasets: [{
                            data: [35, 50, 15],
                            backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(75, 192, 192)'],
                        }]
                };

                // Configuración de los gráficos
                var barChartOptions = {
                    responsive: true,
                    legend: {
                        display: false,
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Días de la Semana'
                                }
                            }],
                        yAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Artículos Leídos'
                                }
                            }]
                    }
                };

                var pieChartOptions = {
                    responsive: true,
                    legend: {
                        position: 'bottom',
                    },
                };

                // Crear los gráficos
                var barChart = new Chart(document.getElementById('barChart').getContext('2d'), {
                    type: 'bar',
                    data: barChartData,
                    options: barChartOptions,
                });

                var pieChart = new Chart(document.getElementById('pieChart').getContext('2d'), {
                    type: 'pie',
                    data: pieChartData,
                    options: pieChartOptions,
                });
            </script>




            <script>
                    //funcion para eliminar libro
                     function eliminarLibro(id) {

                        var confirmar = confirm('¿Estás seguro de que deseas eliminar el libro con ID ' + id + '?');

                           if (confirmar) {
                            console.log('voy a entrar');
                            $.ajax({

                            url: '/biblioteca/SvEliminarLibro?id=' + id,
                            
                            method: 'POST',

                            success: function () {
                               console.log("Aqui estoy");
                                window.location.href = 'biblioteca.jsp';
                            },
                               error: function () {
                                console.log("paila");
                            }
                              });
                           alert('Libro eliminado con exito');

                       }
                }

                // Mostrar el contenido al cargar la página
                window.addEventListener("load", function () {
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    contenidoInicio.style.display = "block";
                });

                // Mostrar el contenido cuando se hace clic en "Inicio"
                document.getElementById("inicio").addEventListener("click", function () {

                    var formulario = document.getElementById("formularioTarea");
                    var tabla = document.getElementById("tablaTarea");
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    var tusLibros = document.getElementById("tusLibros");
                    var todosLibros = document.getElementById("todosLibros");
                    
                    contenidoInicio.style.display = "block";
                    tabla.style.display = "none";
                    formulario.style.display = "none";
                    tusLibros.style.display = "none";
                    todosLibros.style.display = "none";

                });

                document.getElementById("mostrarFormulario").addEventListener("click", function () {
                    var formulario = document.getElementById("formularioTarea");
                    var tabla = document.getElementById("tablaTarea");
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    var tusLibros = document.getElementById("tusLibros");
                    var todosLibros = document.getElementById("todosLibros");
                    
                    if (formulario.style.display === "none" || formulario.style.display === "") {
                        formulario.style.display = "block";
                        tabla.style.display = "none";
                        contenidoInicio.style.display = "none";
                        tusLibros.style.display = "none";
                        todosLibros.style.display = "none";
                        document.getElementById("formularioActual").value = "tarea"; // Agregar esta línea
                    }
                });

                document.getElementById("mostrarTarea").addEventListener("click", function () {
                    var formulario = document.getElementById("tablaTarea");
                    var tarea = document.getElementById("formularioTarea");
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    var tusLibros = document.getElementById("tusLibros");
                    var todosLibros = document.getElementById("todosLibros");
                    
                    if (formulario.style.display === "none" || formulario.style.display === "") {
                        formulario.style.display = "block";
                        tarea.style.display = "none";
                        contenidoInicio.style.display = "none";
                        tusLibros.style.display = "none";
                        todosLibros.style.display = "none";
                        document.getElementById("formularioActual").value = "tabla"; // Agregar esta línea
                    }
                });



                document.getElementById("mostrarTusLibros").addEventListener("click", function () {
                    var formulario = document.getElementById("tablaTarea");
                    var tarea = document.getElementById("formularioTarea");
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    var tusLibros = document.getElementById("tusLibros");
                    var todosLibros = document.getElementById("todosLibros");

                    if (tusLibros.style.display === "none" || formulario.style.display === "") {
                        tusLibros.style.display = "block";
                        formulario.style.display = "none";
                        tarea.style.display = "none";
                        contenidoInicio.style.display = "none";
                        todosLibros.style.display = "none";
                        document.getElementById("formularioActual").value = "tabla"; // Agregar esta línea
                    }
                });
                
                document.getElementById("mostrarTodosLibros").addEventListener("click", function () {
                    var formulario = document.getElementById("tablaTarea");
                    var tarea = document.getElementById("formularioTarea");
                    var contenidoInicio = document.getElementById("contenidoInicio");
                    var tusLibros = document.getElementById("tusLibros");
                    var todosLibros = document.getElementById("todosLibros");
                    
                    if (todosLibros.style.display === "none" || formulario.style.display === "") {
                        todosLibros.style.display = "block";
                        tusLibros.style.display = "none";
                        formulario.style.display = "none";
                        tarea.style.display = "none";
                        contenidoInicio.style.display = "none";

                        document.getElementById("formularioActual").value = "tabla"; // Agregar esta línea
                    }
                });



            </script>


            <script>
                function editarTarea(id, titulo, descripcion, fechaVencimiento) {


                    // Accede a los datos de la tarea
                    console.log("ID de la tarea: " + id);
                    console.log("Título de la tarea: " + titulo);
                    console.log("Descripción de la tarea: " + fechaVencimiento);
                    // ... otros métodos y propiedades de la tarea

                    // Luego, puedes usar estos datos para llenar el modal
                    document.getElementById('id').value = id;
                    document.getElementById('titulo').value = titulo;
                    document.getElementById('descripcion').value = descripcion;
                    document.getElementById('fecha').value = fechaVencimiento;
                    // ... otros campos del modal
                }




            </script>


    </body>
</html>
