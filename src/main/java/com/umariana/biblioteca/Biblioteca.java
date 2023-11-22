/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.biblioteca;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;

/**
 *
 * @author jonathan
 */
public class Biblioteca {

    /*----------------------------------------------------
     *Atributos 
    *---------------------------------------- */
    public static Libros cabeza;
 
    
    
    /*-------------------------------------------------------
    * Metodos CONTROLAR LIBROS EN LISTAS
    *---------------------------------------------*/
    public Biblioteca() {
        cabeza = null;
       
    }

    public static void agregarLibros(Libros nuevoLibro) {
        if (cabeza == null) {
            cabeza = nuevoLibro;
        } else {
            Libros actual = cabeza;
            while (actual.getSiguiente() != null) {
                actual = actual.getSiguiente();
            }
            actual.setSiguiente(nuevoLibro);
        }
    }
    
    
 
    

    public static Libros buscarLibroPorTitulo(String titulo) {

        Libros actual = cabeza;
        while (actual != null) {
            if (actual.getTitulo().equals(titulo)) {
                return actual;
            }
            actual = actual.getSiguiente();
        }
        return null;
    }

    public static void eliminarLibro(Libros libroAEliminar, ServletContext context) {

        if (cabeza == null) {
            return;
        }

        if (cabeza == libroAEliminar) {
            cabeza = cabeza.getSiguiente();
            guardarLibrosEnArchivo(context);
            return;
        }

        Libros actual = cabeza;
        while (actual.getSiguiente() != null) {
            if (actual.getSiguiente() == libroAEliminar) {
                actual.setSiguiente(libroAEliminar.getSiguiente());
                guardarLibrosEnArchivo(context);
                return;
            }
            actual = actual.getSiguiente();
        }

        guardarLibrosEnArchivo(context);
    }

    

    public static void eliminarLibroPedido(Libros libroAEliminar, ServletContext context, String nombreUsuario) {
     
        List<Libros> librosPedidos = cargarDesdeArchivoPedido(context, nombreUsuario);
        
        
        eliminarArchivo(context, nombreUsuario);
        
        
        for (Libros libroActual : librosPedidos) {
            if (!libroActual.getId().equals(libroAEliminar.getId()) ) {
                System.out.println("DESDE ELIMINAR HABER SI FUNCIONA "+libroActual.getId()+" eliminar "+libroAEliminar.getId());
                agregarLibroEnArchivoPedido(context, nombreUsuario, libroActual);
            }
        }
       
        
        
    }
    
    
    
    public static List<Libros> obtenerTodosLosLibros() {
        List<Libros> listaTodosLosLibros = new ArrayList<>();

        Libros actual = cabeza; // Comenzamos desde la cabeza de la lista enlazada

        while (actual != null) {
            listaTodosLosLibros.add(actual);
            //System.out.println("libros a del usuarios " + actual.getAutor());
            actual = actual.getSiguiente(); // Avanzamos al siguiente nodo en la lista
        }

        return listaTodosLosLibros;
    }
    
    

    public static void limpiarLibros() {
        cabeza = null;
    }

    public static void editarLibro(Libros libro, String nuevoTitulo, String nuevoAutor, String nuevoAnio, String nuevaFoto, ServletContext context, String nombreUsuario) {

        if (libro == null) {
            return;
        }

        libro.setTitulo(nuevoTitulo);
        libro.setAutor(nuevoAutor);
        libro.setAnio(nuevoAnio);
        libro.setFoto(nuevaFoto);

        guardarLibrosEnArchivo(context);
    }

    public static Libros buscarLibroPorId(String id) {
        Libros actual = cabeza;
        //System.out.println("desde buscar por id: " + id);
        while (actual != null) {

            if (actual.getId().equals(id)) {
                return actual;
            }
            actual = actual.getSiguiente();
        }

        return null;
    }

    
    
 
    public static boolean existeLibroConId(String id) {
        Libros actual = cabeza;

        while (actual != null) {

            if (actual.getId().equals(id)) {
                return true;
            }
            actual = actual.getSiguiente();
        }

        return false; // No se encontró ninguna tarea con ese ID
    }

    /*----------------------------------------------------------------------
    *METODOS PARA CONTROL DE LOS LIBROS EN LOS ARCHIVOS
    *------------------------------------------------------------------*/
    /**
     * Metodo para guardar informacion en un arvhibo de texto
     *
     * @param nombreArchivo
     */
    public static void guardarLibrosEnArchivo(ServletContext context) {
        String relativePath = "/data/libros_disponibles.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoGuardar = new File(absPath);

        try {
            BufferedWriter escritor = new BufferedWriter(new FileWriter(archivoGuardar));

            Libros actual = cabeza; // Usamos la cabeza de la lista enlazada
            while (actual != null) {
                if(actual.getEstado().equals("Disponible")){
                    escritor.write("ID: " + actual.getId());
                    escritor.newLine();
                    escritor.write("Título: " + actual.getTitulo());
                    escritor.newLine();
                    escritor.write("Autor: " + actual.getAutor());
                    escritor.newLine();
                    escritor.write("Año de lanzamiento: " + actual.getAnio());
                    escritor.newLine();
                    escritor.write("Foto: " + actual.getFoto());
                    escritor.newLine();
                    escritor.write("Estado: " + actual.getEstado());
                    escritor.newLine();
                    escritor.write("-----------------------");
                    escritor.newLine();
                }
                actual = actual.getSiguiente(); // Avanzamos al siguiente nodo en la lista

                
            }

            escritor.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void agregarLibroEnArchivoPedido(ServletContext context, String nombreUsuario, Libros nuevoLibro) {
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoGuardar = new File(absPath);

        try {
            BufferedWriter escritor = new BufferedWriter(new FileWriter(archivoGuardar, true)); // El segundo parámetro true permite añadir al final del archivo

            escritor.write("ID: " + nuevoLibro.getId());
            escritor.newLine();
            escritor.write("Título: " + nuevoLibro.getTitulo());
            escritor.newLine();
            escritor.write("Autor: " + nuevoLibro.getAutor());
            escritor.newLine();
            escritor.write("Año de lanzamiento: " + nuevoLibro.getAnio());
            escritor.newLine();
            escritor.write("Foto: " + nuevoLibro.getFoto());
            escritor.newLine();
            escritor.write("Estado: " + nuevoLibro.getEstado());
            escritor.newLine();
            escritor.write("-----------------------");
            escritor.newLine();

            escritor.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Metodo para cargar
     *
     * @param nombreArchivo
     */
    public static void cargarLibrosDesdeArchivo(ServletContext context) {

        limpiarLibros();
        String relativePath = "/data/libros_disponibles.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        boolean ve = archivoCargar.length() != 0;
        System.out.println("desde cargata: " + relativePath + " vetificando si tiene contenido: " + ve);

        if (archivoCargar.length() != 0) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoCargar))) {
                String id = null;
                String titulo = null;
                String autor = null;
                String anio = null;
                String foto = null;
                String estado = null;

                String lineaPorLinea;
                while ((lineaPorLinea = leyendo.readLine()) != null) {
                    if (lineaPorLinea.startsWith("ID:")) {
                        id = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    }
                    if (lineaPorLinea.startsWith("Título:")) {
                        titulo = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    }
                    if (lineaPorLinea.startsWith("Autor:")) {
                        autor = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    }
                    if (lineaPorLinea.startsWith("Año de lanzamiento:")) {
                        anio = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    }
                    if (lineaPorLinea.startsWith("Foto:")) {
                        foto = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                        System.out.println("desde cargar verificando si se carga la foto " + foto);
                    }
                    if (lineaPorLinea.startsWith("Estado:")) {
                        estado = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();

                        // Crea una nueva tarea y agrégala a la lista de tareas del usuario
                        Libros nuevaTarea = new Libros(id, titulo, autor, anio, foto, estado);
                        System.out.println("se creo nuevo libro: " + nuevaTarea.getAnio());
                        agregarLibros(nuevaTarea);

                        // Restablece las variables para la siguiente tarea
                        id = null;
                        titulo = null;
                        autor = null;
                        anio = null;
                        foto = null;
                        estado = null;
                    }
                }
            } catch (Exception e) {
                e.getMessage();
            }
        }

    }

     
        
    public static List<Libros> cargarDesdeArchivoPedido(ServletContext context, String nombreUsuario) {

        List<Libros> listaLibros = new ArrayList<>();
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        boolean tieneContenido = archivoCargar.length() != 0;
        System.out.println("Desde carga: " + relativePath + " Verificando si tiene contenido: " + tieneContenido);

        if (tieneContenido) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoCargar))) {
                String id = null;
                String titulo = null;
                String autor = null;
                String anio = null;
                String foto = null;
                String estado = null;

                String lineaPorLinea;
                while ((lineaPorLinea = leyendo.readLine()) != null) {
                    if (lineaPorLinea.startsWith("ID:")) {
                        id = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Título:")) {
                        titulo = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Autor:")) {
                        autor = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Año de lanzamiento:")) {
                        anio = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Foto:")) {
                        foto = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Estado:")) {
                        estado = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();

                   
                        Libros nuevaTarea = new Libros(id, titulo, autor, anio, foto, estado);
                        System.out.println("se creo nuevo libro: " + nuevaTarea.getAnio());
                        listaLibros.add(nuevaTarea);
                        agregarLibros(nuevaTarea);

                        id = null;
                        titulo = null;
                        autor = null;
                        anio = null;
                        foto = null;
                        estado = null;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return listaLibros;
    }
    public static void guardarTodosLosLibros(ServletContext context) {
        
        String relativePath = "/data/libros.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoGuardar = new File(absPath);

        try {
            BufferedWriter escritor = new BufferedWriter(new FileWriter(archivoGuardar));

            Libros actual = cabeza; // Usamos la cabeza de la lista enlazada
            while (actual != null) {
                
                    escritor.write("ID: " + actual.getId());
                    escritor.newLine();
                    escritor.write("Título: " + actual.getTitulo());
                    escritor.newLine();
                    escritor.write("Autor: " + actual.getAutor());
                    escritor.newLine();
                    escritor.write("Año de lanzamiento: " + actual.getAnio());
                    escritor.newLine();
                    escritor.write("Foto: " + actual.getFoto());
                    escritor.newLine();
                    escritor.write("Estado: " + actual.getEstado());
                    escritor.newLine();
                    escritor.write("-----------------------");
                    escritor.newLine();
                
                actual = actual.getSiguiente(); // Avanzamos al siguiente nodo en la lista

                
            }

            escritor.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static List<Libros> mostrarLibros(ServletContext context) {

        List<Libros> listaLibros = new ArrayList<>();
        String relativePath = "/data/libros.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        boolean tieneContenido = archivoCargar.length() != 0;
        System.out.println("Desde carga: " + relativePath + " Verificando si tiene contenido: " + tieneContenido);

        if (tieneContenido) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoCargar))) {
                String id = null;
                String titulo = null;
                String autor = null;
                String anio = null;
                String foto = null;
                String estado = null;

                String lineaPorLinea;
                while ((lineaPorLinea = leyendo.readLine()) != null) {
                    if (lineaPorLinea.startsWith("ID:")) {
                        id = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Título:")) {
                        titulo = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Autor:")) {
                        autor = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Año de lanzamiento:")) {
                        anio = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Foto:")) {
                        foto = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Estado:")) {
                        estado = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();

                   
                        Libros nuevaTarea = new Libros(id, titulo, autor, anio, foto, estado);
                        System.out.println("se creo nuevo libro: " + nuevaTarea.getAnio());
                        listaLibros.add(nuevaTarea);
                        agregarLibros(nuevaTarea);

                        id = null;
                        titulo = null;
                        autor = null;
                        anio = null;
                        foto = null;
                        estado = null;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return listaLibros;
    }
    public static void eliminarArchivo(ServletContext context, String nombreUsuario) {
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);

        try {
            
            FileWriter fileWriter = new FileWriter(archivoCargar);

            
            fileWriter.write("");

            
            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
