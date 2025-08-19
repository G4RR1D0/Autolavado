/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.autolavado.model;

/**
 *
 * @author PC-18
 */
public class serviciosModel {

    
    public static int getIdServicio() {
        return idServicio;
    }

    public static void setIdServicio(int idServicio) {
        serviciosModel.idServicio = idServicio;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        serviciosModel.nombre = nombre;
    }

    public static String getDescripcion() {
        return descripcion;
    }

    public static void setDescripcion(String descripcion) {
        serviciosModel.descripcion = descripcion;
    }

    public static String getPrecio() {
        return precio;
    }

    public static void setPrecio(String precio) {
        serviciosModel.precio = precio;
    }

    public static String getEstatus() {
        return estatus;
    }

    public static void setEstatus(String estatus) {
        serviciosModel.estatus = estatus;
    }


    
    public serviciosModel(int idServicio, String nombre, String descripcion, String precio, String estatus) {
        this.idServicio = idServicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.estatus = estatus;
    }

    public serviciosModel(String nombre, String descripcion, String precio, String estatus) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.estatus = estatus;
    }

    public serviciosModel() {
    }

    private static int idServicio;
    private static String nombre;
    private static String descripcion;
    private static String precio;
    private static String estatus;
}
