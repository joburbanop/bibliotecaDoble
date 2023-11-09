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
import java.util.List;
import javax.servlet.ServletContext;

/**
 *
 * @author jonathan
 */
public class Biblioteca {
    
    
     public static Libros cabeza;

    /*-------------------------------------------------------
    * Metodos
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

    public static void eliminarArchivo(ServletContext context, String nombreUsuario) {
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);

        try (BufferedWriter escribir = new BufferedWriter(new FileWriter(archivoCargar))) {
            System.out.println("aqui");
            escribir.write("");
            escribir.close();
        } catch (IOException e) {

            e.printStackTrace();
        }

    }

    public static void eliminarLibro(Libros libroAEliminar, ServletContext context, String nombreUsuario) {

        if (cabeza == null) {
            return; // La lista está vacía, no hay nada que eliminar.
        }

        if (cabeza == libroAEliminar) {
            cabeza = cabeza.getSiguiente();
            guardarLibrosEnArchivo(context, nombreUsuario);
            return;
        }

        Libros actual = cabeza;
        while (actual.getSiguiente() != null) {
            if (actual.getSiguiente() == libroAEliminar) {
                actual.setSiguiente(libroAEliminar.getSiguiente());
                guardarLibrosEnArchivo(context, nombreUsuario);
                return;
            }
            actual = actual.getSiguiente();
        }
    }

    public static void limpiarLibros() {
        cabeza = null;
    }

    /**
     * Metodo para guardar informacion en un arvhibo de texto
     *
     * @param nombreArchivo
     */
    public static void guardarLibrosEnArchivo(ServletContext context, String nombreUsuario) {
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
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
                escritor.write("-----------------------");
                escritor.newLine();

                actual = actual.getSiguiente(); // Avanzamos al siguiente nodo en la lista
            }

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
    public static void cargarLibrosDesdeArchivo(ServletContext context, String nombreUsuario) {

        limpiarLibros();
        String relativePath = "/data/libros_" + nombreUsuario + ".txt";
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

                        // Crea una nueva tarea y agrégala a la lista de tareas del usuario
                        Libros nuevaTarea = new Libros(id, titulo, autor, anio, foto);
                        System.out.println("se creo nuevo libro: " + nuevaTarea.getAnio());
                        agregarLibros(nuevaTarea);

                        // Restablece las variables para la siguiente tarea
                        id = null;
                        titulo = null;
                        autor = null;
                        anio = null;
                        foto = null;
                    }
                }
            } catch (Exception e) {
                e.getMessage();
            }
        }

    }

    public static List<Libros> obtenerTodosLosLibros() {
        List<Libros> listaTodosLosLibros = new ArrayList<>();
        
        Libros actual = cabeza; // Comenzamos desde la cabeza de la lista enlazada

        while (actual != null) {
            listaTodosLosLibros.add(actual);
            System.out.println("libros a del usuarios "+ actual.getAutor());
            actual = actual.getSiguiente(); // Avanzamos al siguiente nodo en la lista
        }

        return listaTodosLosLibros;
    }

    public static void editarLibro(Libros libro, String nuevoTitulo, String nuevoAutor, String nuevoAnio, String nuevaFoto, ServletContext context, String nombreUsuario) {

        if (libro == null) {
            return;
        }

        libro.setTitulo(nuevoTitulo);
        libro.setAutor(nuevoAutor);
        libro.setAnio(nuevoAnio);
        libro.setFoto(nuevaFoto);

        guardarLibrosEnArchivo(context, nombreUsuario);
    }

    public static Libros buscarLibroPorId(String id) {
        Libros actual = cabeza;
        System.out.println("desde buscar por id: " + id);
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

}
