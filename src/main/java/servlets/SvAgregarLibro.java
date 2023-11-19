/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.biblioteca.Biblioteca;
import com.umariana.biblioteca.Libros;
import com.umariana.biblioteca.Usuarios;
import com.umariana.biblioteca.controlUsuario;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author danie
 */
@WebServlet(name = "SvAgregarLibro", urlPatterns = {"/SvAgregarLibro"})
@MultipartConfig
public class SvAgregarLibro extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        System.out.println("ya vamos agregar Libro: "+ session);
        
        ServletContext context= getServletContext();
       
        String nombreUsuario = (String) session.getAttribute("nombre_usuario");
        String cedulaUsuario = (String) session.getAttribute("cedula_usuario");
        
        Usuarios usuarioActivo= controlUsuario.obtenerUsuarioActivo(nombreUsuario, cedulaUsuario, context);
        
        System.out.println(usuarioActivo.getNombre_usuario());
        
        // Crea una nueva tarea y asóciala al usuario
        
        String id = request.getParameter("id");
        
        String titulo = request.getParameter("titulo");
        
        String autor = request.getParameter("autor");
        
        String anio = request.getParameter("anio");
        
        String estado = request.getParameter("estado");
        
        /*--------------------------------------------
         *todo lo necesario para agregar fotos
         *-----------------------------------------*/
        Part imagenPart = request.getPart("fotos");
        System.out.println("imagenPart" + imagenPart);

        // Nombre original del archivo
        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        // Directorio donde se almacenara el archivo
        String uploadDirectory = getServletContext().getRealPath("imagenes");
        System.out.println("uploadDirectory: " + uploadDirectory);

        //Ruta completa del archivo
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        //Guardar el archivo en el sistemaa de archivos
        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }
        
        String foto =fileName;
        
        
        if(!Biblioteca.existeLibroConId(id)){
            Libros nuevoLibro = new Libros(id, titulo, autor, anio, foto,estado);
        
            usuarioActivo.agregarLibro(nuevoLibro);

            Biblioteca.agregarLibros(nuevoLibro);

            Biblioteca.guardarLibrosEnArchivo(context);
        }
        
     
        session.setAttribute("libros", Biblioteca.obtenerTodosLosLibros());
                
        
        
        response.sendRedirect("biblioteca.jsp");
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
