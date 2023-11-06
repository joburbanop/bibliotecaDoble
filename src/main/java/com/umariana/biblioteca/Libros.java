/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.biblioteca;

/**
 *
 * @author jonathan
 */
public class Libros {
    private String id;
    private String titulo;
    private String autor;
    private String anio;
    private String foto;
    private Libros siguiente;

    public Libros() {
    }

    public Libros(String id, String titulo, String autor, String anio, String foto) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.anio = anio;
        this.foto = foto;
        this.siguiente = null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    

    public Libros getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Libros siguiente) {
        this.siguiente = siguiente;
    }
    
    

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
    
    
    
    
}
