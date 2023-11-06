<%-- 
    Document   : biblioteca
    Created on : 4 nov 2023, 16:40:57
    Author     : danie
--%>

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
        <link rel="stylesheet" href="css/bibliotecaStyle.css">
        <link rel="stylesheet" href="css/lightbox.css">
        
    </head>
    <body>
       <% String nombreUsuario = (String) session.getAttribute("nombre_usuario"); %>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <div class="wrapper"> <!-- clase contenedora -->
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
                        <a href="#" class="sidebar-link" id = "mostrarTarea" style="color:white;">
                            <i class="fa-solid fa-eye"  style="color:white;"></i>
                            Tus libros
                        </a>
                    </li>
                    
                    <li class="sidebar-item">
                        <a class="sidebar-link" id="mostrarFormulario"  style="color:white;">
                            <i class="fa-solid fa-plus " style="color:white;"></i>
                            Agregar libro
                        </a>
                    </li>
                  
                  
                    <li class="sidebar-item1">
                        <a href="index.jsp" class="sidebar-link-2" id = ""  style="color:white;">
                            <i class="fa-solid fa-door-closed" style="color:white;"></i>
                            Salir
                        </a>
                    </li>
                    
                </ul>
                
            </div>
            
        </aside>

            <div class="container-fluid"> 
               
                <div class="row">
                    
                    <div class="col-lg-12 d-flex justify-content-center align-items-center"  >
                        
                        <section id="contenidoInicio" style="margin-top: 5%; margin-left: 10%;">
                            <div class="container">
                                <h1 class="text-center">Libros Populares</h1>
                                
                                <div id="carouselExampleDark" class="carousel carousel-dark slide">
                                    <div class="carousel-indicators">
                                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                      <div class="carousel-item active" data-bs-interval="1000">
                                        <img src="imagenes/integrating-science_1.jpg" class="d-block w-100" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>First slide label</h5>
                                          <p>Some representative placeholder content for the first slide.</p>
                                        </div>
                                      </div>
                                      <div class="carousel-item" data-bs-interval="1000">
                                        <img src="imagenes/maxcy-rosenau-last.jpg" class="d-block w-100" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>Second slide label</h5>
                                          <p>Some representative placeholder content for the second slide.</p>
                                        </div>
                                      </div>
                                      <div class="carousel-item" data-bs-interval="1000">
                                        <img src="imagenes/narrative-ethics.jpg" class="d-block w-100" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>Third slide label</h5>
                                          <p>Some representative placeholder content for the third slide.</p>
                                        </div>
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
                                    
                                <div class="col-lg-12" style='margin-left: 15%;'>
                                    <div id="cardCarousel" class="carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-inner">
                                          <div class="carousel-item active">
                                            <div class="row">
                                              <div class="col-md-5">
                                                <div class="card" style="width: 18rem;">
                                                  <img src="imagen1.jpg" class="card-img-top" alt="...">
                                                  <div class="card-body">
                                                    <h5 class="card-title">Card 1</h5>
                                                    <p class="card-text">Some quick example text for card 1.</p>
                                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                                  </div>
                                                </div>
                                              </div>
                                              <div class="col-md-5">
                                                <div class="card" style="width: 18rem;">
                                                  <img src="imagen2.jpg" class="card-img-top" alt="...">
                                                  <div class="card-body">
                                                    <h5 class="card-title">Card 2</h5>
                                                    <p class="card-text">Some quick example text for card 2.</p>
                                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                                  </div>
                                                </div>
                                              </div>
                                              
                                            </div>
                                          </div>
                                         
                                        </div>
                                        
                                      </div>
                                    
                                </div>    
                                    
                            
                                <div style="margin-top: 10%;" class="row container">

                                    <div class="col-lg-12 d-flex justify-content-center align-items-center " style='margin-top: 5%;'>
                                        <h1>Cultura</h1>
                                    </div>

                                    <div class="col-lg-12">

                                    </div>

                                </div>
                                      

                                </div>
                                
                                   
                            </div>
                            
                        </section>
                        
                        
                    
                    </div>
                    

                    <div class="col-lg-12 d-flex justify-content-center align-items-center" style='margin-top: 5%;'> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                        
                          

                            <%-- formulario para agregar tareas --%>
                            <form id="formularioTarea" action="/biblioteca/SvAgregarLibro" method="post" style="display: none;">
                               <div class="card card-body text-center" style="background-color: white; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                                <h4 class="text-center" style="color: black;">Agrega Libro</h4>
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="nombre">Id</label>
                                    <input type="text" name="id" class="form-control"  required>
                                </div>

                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="raza">Titulo</label>
                                    <input type="text" name="titulo" class="form-control" required>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="nombre">Autor</label>
                                    <input type="text" name="autor" class="form-control" required>
                                </div>

                                <div class ="input-group mb-3">
                                    <label class="input-group-text" for="fecha">Año publicacion</label>
                                    <input type="text" name="anio" class="form-control" required>
                                </div>
                                
                                 <div class ="input-group mb-3">
                                    <label class="input-group-text" for="foto">Foto</label>
                                    <input type="file" name="foto" class="form-control" required>
                                </div>

                                <!-- Abrir modal de opciones -->
                                <input  type="submit" value="Agregar libro"> 

                               </div>
                            </form>


                        
                    </div>


                    <%-- tabla para visualizar las tareas agregadas --%>
                    <div class="col-lg-12 d-flex justify-content-center align-items-center">
                        <div>
                            <section id="tablaTarea" class="table table-striped" style="display:none; margin-left: 20%;">
                                
                                <h2 style="color:rgb(21, 21, 21); text-align:center; margin-top: 5%;"> Galeria de Libros </h2>
                                 
                                <div class ="container">
                                    <div class="gallery" style="color:rgb(21, 21, 21)">
                                        <% List<Libros> libros = (List<Libros>) session.getAttribute("libros"); 
                                                   for (Libros libro : libros) {
                                        %>
                                        <img href="" style="color:rgb(21, 21, 21)" data-lightbox="models" data-title=""><%=libro.getFoto() %></img>
                                        <%
                                            }
                                        %>
                                     
                                        
                                    </div>
                                    
                                </div>
                                        
                                   
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        

        <section>


            <!-- Modal para editar información de la tarea -->
            <div class="modal fade" id="editModalConfirm" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content custom-modal">

                        <div class="modal-body">
                            <!-- Contenido del modal -->

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
                        
        <script src="script/lightbox-plus-jquery.min.js"> </script>                      
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <%--Script para mostrar formulario tarea --%>                     
        <script>
            // Mostrar el contenido al cargar la página
            window.addEventListener("load", function() {
                var contenidoInicio = document.getElementById("contenidoInicio");
                contenidoInicio.style.display = "block";
            });

            // Mostrar el contenido cuando se hace clic en "Inicio"
            document.getElementById("inicio").addEventListener("click", function() {

                var formulario = document.getElementById("formularioTarea");
                var tabla = document.getElementById("tablaTarea");
                var contenidoInicio = document.getElementById("contenidoInicio");

                contenidoInicio.style.display= "block";
                tabla.style.display = "none";
                formulario.style.display="none"

                
            });

            document.getElementById("mostrarFormulario").addEventListener("click", function() {
                var formulario = document.getElementById("formularioTarea");
                var tabla = document.getElementById("tablaTarea");
                var contenidoInicio = document.getElementById("contenidoInicio");
            if (formulario.style.display === "none" || formulario.style.display === "") {
                formulario.style.display = "block";
                tabla.style.display = "none";
                contenidoInicio.style.display= "none";
                document.getElementById("formularioActual").value = "tarea"; // Agregar esta línea
            } 
        });
                
                document.getElementById("mostrarTarea").addEventListener("click", function() {
                var formulario = document.getElementById("tablaTarea");
                var tarea = document.getElementById("formularioTarea");
                var contenidoInicio = document.getElementById("contenidoInicio");
            if (formulario.style.display === "none" || formulario.style.display === "") {
                formulario.style.display = "block";
                tarea.style.display = "none";
                contenidoInicio.style.display= "none";
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



                                                function eliminarTarea(titulo) {

                                                    var confirmar = confirm('¿Estás seguro de que deseas eliminar la tarea con ID ' + titulo + '?');

                                                    if (confirmar) {


                                                        $.ajax({

                                                            url: '/mavenproject1/SvEliminarTarea?titulo=' + titulo,

                                                            method: 'POST',

                                                            success: function () {
                                                                console.log("Aqui estoy");
                                                                window.location.href = '/mavenproject1/templates/listas.jsp';
                                                            },
                                                            error: function () {
                                                                console.log("paila");
                                                            }
                                                        });
                                                        alert('Tarea eliminada con exito');

                                                    }
                                                }
        </script>

        
    </body>
</html>
