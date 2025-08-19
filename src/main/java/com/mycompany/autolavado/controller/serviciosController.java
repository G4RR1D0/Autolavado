/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.autolavado.controller;

import com.mycompany.autolavado.conexion.conexionDB;
import com.mycompany.autolavado.model.serviciosModel;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author PC-18
 */
public class serviciosController {

    public static boolean insertarServicios(serviciosModel servicio) {
        String sql = "INSERT INTO tbc_servicios(nombre,descripcion,precio,estatus)VALUES(?,?,?,?)";

        try (Connection con = conexionDB.obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, serviciosModel.getNombre());
            ps.setString (2,serviciosModel.getDescripcion());
             ps.setString(4,serviciosModel.getPrecio());
             ps.setString(3,serviciosModel.getEstatus());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }

    }

    public static List<serviciosModel> obtenerTodos() {
        var lista = new ArrayList<serviciosModel>();
        String sql = "SELECT*FROM tbc_servicios";
        try (Connection con = conexionDB.obtenerConexion(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                lista.add(new serviciosModel(rs.getInt("idServicio"), rs.getString("nombre"), rs.getString("descripcion"),
                        rs.getString("precio"), rs.getString("estatus")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
