/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.biblioteca.Biblioteca;
import com.umariana.biblioteca.Libros;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvEliminarLibro", urlPatterns = {"/SvEliminarLibro"})
public class SvEliminarLibro extends HttpServlet {


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
         ServletContext context = getServletContext();

        //System.out.println("AQUI SI ESTAMOS");
        HttpSession session = request.getSession(false);
        String nombreUsuario = (String) session.getAttribute("nombre_usuario");

        String id = request.getParameter("id");
        
        Libros aEliminar = Biblioteca.buscarLibroPorId(id);
        
        
        System.out.println("estamos eliminando " + aEliminar.getId());
        
        Biblioteca.eliminarLibro(aEliminar, context);
        
        
        session.setAttribute("libros", Biblioteca.obtenerTodosLosLibros());
        
        request.getRequestDispatcher("biblioteca.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
