<%-- 
    Document   : index
    Created on : 24/10/2023, 6:04:08 p. m.
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css">
        <title>Bienvenido</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Arimo' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Hind:300' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

    </head>
    <body>
       
    <div id="login-button">
      <img src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
      </img>
    </div>
    <div id="container">
      <h1>Ingresar</h1>
      <span class="close-btn">
        <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
      </span>

      <form>
        <input type="text" name="usuario" placeholder="Usuario">
        <input type="password" name="contrasenia" placeholder="Contraseña">
        <a href="#">Ingresar</a>
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

      <form>
        <input type="text" name="usuario" placeholder="Usuario">
        <input type="password" name="contrasenia" placeholder="Contraseña">
        <a href="#" class="orange-btn">Registrarse</a>
    </form>
    </div>
    
        
    <script src="script/script.js"> </script>
    
    </body>
</html>
