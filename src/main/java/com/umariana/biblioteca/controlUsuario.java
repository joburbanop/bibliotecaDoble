/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.biblioteca;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author jonathan
 */
public class controlUsuario {
    /*---------------------------------------------------------
     * Metodos
    *----------------------------------------------------- */
    private  static ArrayList<Usuarios> usuriosNuevo= new ArrayList<>();
  



    public static void guardarUsuarios( ArrayList<Usuarios> UsuarioIngresar, ServletContext context) throws IOException{
        // Obtener la ubicación del archivo "usuarios.txt" en el directorio de recursos
        String relativePath = "/data/usuarios.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoGuardar = new File(absPath);
        
 
        PrintWriter escribir = new PrintWriter(new FileWriter(archivoGuardar, true));

        //verficamos si existe contenido dentro del arichvo p
        if (archivoGuardar.exists() && archivoGuardar.length()<=0) {
            escribir.println("====usuarios registrados========");
        } else {
            for (Usuarios usurios : UsuarioIngresar) {
                escribir.println("nombre: " + usurios.getNombre_usuario());
                escribir.println("cedula: " +usurios.getCedula());
                escribir.println("contraseña: "+ usurios.getContrasenia());
            }
        }
        escribir.close();
    }

    public static void cargarArchivo(ServletContext context ){
       
        String relativePath = "/data/usuarios.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        

        if (archivoCargar.length()!=0) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoCargar)) ) {
                String nomreUsurio= null;
                String cedula=null;
                String contrasenia=null;
                 
                String lineaPorlinea;
                while ((lineaPorlinea = leyendo.readLine()) != null) {
                    if (lineaPorlinea.startsWith("nombre:")) {
                        nomreUsurio = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();
                    } else if (lineaPorlinea.startsWith("cedula:")) {
                        cedula = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();
                    } else if (lineaPorlinea.startsWith("contraseña:")) {
                        contrasenia = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();

                        // Crea un nuevo usuario y agrégalo a la lista de usuarios
                        Usuarios nuevoUsuario = new Usuarios(cedula, nomreUsurio, contrasenia);
                        usuriosNuevo.add(nuevoUsuario);
                        System.out.println("estamos desde cargar se cago nuevo usuairio"+ nuevoUsuario.getNombre_usuario());
                        // Restablece las variables para el siguiente usuario
                        nomreUsurio = null;
                        cedula = null;
                        contrasenia = null;
                    }
                
            }
         } catch (Exception e) {

                e.getMessage();
            }
        }
    }


    public static String verificarUsuarioCreado(String nombre, String cedula,  ServletContext context) throws IOException {
       
        cargarArchivo(context);
        //System.out.println("desde verificar nombre: "+nombre);
        //System.out.println("desde verificar nombre: "+contrasenia);
        
       for (Usuarios IUsuarios : usuriosNuevo) {
            if (IUsuarios.getNombre_usuario().equals(nombre) && IUsuarios.getCedula().equals(cedula)) {
                //System.out.println("Se verifico aqui" + IUsuarios.getNombre_usuario());
                return IUsuarios.getNombre_usuario();
            }
       }
       return null;
}
    
      
    /**
     * Retorna un objeto ce tipo usuario
     * @param nombre
     * @param cedula
     * @param context
     * @return 
     */
    public static Usuarios obtenerUsuarioActivo(String nombre, String cedula,ServletContext context) {
        cargarArchivo(context); 

        for (Usuarios usuario : usuriosNuevo) {
            if (usuario.getNombre_usuario().equals(nombre) && usuario.getContrasenia().equals(cedula)) {
                return usuario;
            }
        }

        return null; 
    }

}
