/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.biblioteca.Biblioteca;
import com.umariana.biblioteca.Libros;
import com.umariana.biblioteca.Usuarios;
import com.umariana.biblioteca.controlUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvCambiarEstadoLibro", urlPatterns = {"/SvCambiarEstadoLibro"})
public class SvCambiarEstadoLibro extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String id = request.getParameter("id");
        System.out.println("id del libro a devolver " + id);
        Libros libroDevolver = Biblioteca.buscarLibroPorId(id);
        
        HttpSession session = request.getSession(false);
        ServletContext context = getServletContext();

        String nombreUsuario = (String) session.getAttribute("nombre_usuario");
        String cedulaUsuario = (String) session.getAttribute("cedula_usuario");
        
        System.out.print("nombre usuraio");
        Usuarios usuarioActivo= controlUsuario.obtenerUsuarioActivo(nombreUsuario, context);
        
        if (libroDevolver != null && libroDevolver.getId().equals(id)) {
            
            //System.out.println("SE AGREGO UN NUEVO LIBRO PARA DEVOLVER");
            
            libroDevolver.setEstado("Disponible");
            
            Biblioteca.eliminarLibroPedido(libroDevolver, context, nombreUsuario);

            Libros nuevoLibro = new Libros(id, libroDevolver.getTitulo(), libroDevolver.getAutor(), libroDevolver.getAnio(), libroDevolver.getFoto(),libroDevolver.getEstado());
        
            usuarioActivo.agregarLibro(nuevoLibro);
                
            Biblioteca.guardarLibrosEnArchivo(context);
 
            
            
        }
        request.getRequestDispatcher("biblioteca.jsp").forward(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
