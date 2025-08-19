/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.autolavado.controller;

import com.mycompany.autolavado.conexion.conexionDB;
import com.mycompany.autolavado.model.rolsModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC-18
 */
public class rolsController {

    public static boolean insertarRols(rolsModel rol) {
        String sql = "INSERT INTO tbc_rols(nombreRol)VALUES(?)";
        try (Connection con = conexionDB.obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, rol.getNombreRol());

            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;

        }

    }
    public static List<rolsModel>obtenerTodos(){
        var lista=new ArrayList<rolsModel>();
        String sql="SELECT*FROM tbc_rols";
        try(Connection con= conexionDB.obtenerConexion();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery(sql)){
            while(rs.next()){
                lista.add(new rolsModel(rs.getInt("idRol"),rs.getString("nombreRol")));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return lista;
    }

}
