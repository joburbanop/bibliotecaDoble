<%-- 
    Document   : index
    Created on : 24/10/2023, 6:04:08 p. m.
    Author     : jonathan
--%>

<%@page import="com.umariana.biblioteca.controlUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.biblioteca.Usuarios"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Bienvenido</title>

    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Arimo' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Hind:300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Quahon&display=swap" rel="stylesheet">

</head>
<body>
 
    
    <%
        String relativePath = getServletContext().getRealPath("/data");
        String archivoA = "usuarios.txt";

        File data = new File(relativePath);
        File archivo = new File(data + "/" + archivoA);
        data.mkdir();
        archivo.createNewFile();

        // Obtener array list de la solicitud utilizando el método cargarPerros
        ServletContext context = request.getServletContext();
        controlUsuario.cargarArchivo(context);

        

    %>

    <div id="login-button">

        <img src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
        </img>
    </div>
    <div id="Titulo">
        <h1> BIBLIOTECA VIRTUAL </h1>

    </div>
    <div id="lema"
         <h4> - Un mundo nuevo por descubrir. -</h4>
    </div>
    <div id="container">
        <h1>¡Bienvenido!</h1>
        <span class="close-btn">
            <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
        </span>

        <form action="SvIngresar" method="POST">
            <input type="text" name="usuario" placeholder="Usuario" required>
            <input type="password" name="contrasenia" placeholder="Contraseña" required>
             <input type="submit" value="Ingresar">
            <div id="invitado-container">

                <span id="invitado" onclick="redirigirAotraPagina()">Inivtado</span>
            </div>
            <div id="remember-container">
                <span id="register">Registrarse</span>
            </div>
        </form>
    </div>

    <!-- Register Container -->
    <div id="register-container">
        <h1>Registro</h1>
        <span class="close-btn">
            <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
        </span>

        <form action="SvRegistrar" method="post">
            <input type="text" name="usuario" placeholder="Usuario" required>
            <input type="text" name="cedula" pattern="[0-9]+" placeholder="Cedula" required>
            <input type="password" name="contrasenia" placeholder="Contraseña" required>
            <input class="submit" type="submit" value="Registrarse">
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>  
    <script src="script/script.js"></script>

</body>
</html>
