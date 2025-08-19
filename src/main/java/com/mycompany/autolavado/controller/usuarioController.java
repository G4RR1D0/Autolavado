/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.autolavado.controller;

/**
 *
 * @author PC-18
 */
import com.mycompan.autolavado.Conexion.ConexionDB;
import com.mycompany.autolavado.conexion.conexionDB;
import com.mycompany.autolavado.model.usuarioModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 *
 */
public class usuarioController {

    public static boolean insertarUsuario(usuarioModel usuario) {
        String sql = "INSERT INTO tbb_usuarios(nombre,primerApellido,segundoApellido,direccion,telefono,correo,usuario,password,fechaNacimiento,idRol) values(?,?,?,?,?,?,?,?,?,?)";
        try (Connection con = conexionDB.obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getPrimerApellido());
            ps.setString(3, usuario.getSegubdoApellido());
            ps.setString(4, usuario.getDireccion());
            ps.setString(5, usuario.getTelefono());
            ps.setString(6, usuario.getCorreo());
            ps.setString(7, usuario.getUsuario());
            ps.setString(8, usuario.getPassword());
            ps.setString(9, usuario.getFechaNacimiento());
            ps.setInt(10, usuario.getIdRol());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static List<usuarioModel> obtenerTodos() {
        var lista = new ArrayList<usuarioModel>();
        String sql = "SELECT*FROM tbb_usuarios";
        try (Connection con = conexionDB.obtenerConexion(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                lista.add(new usuarioModel(rs.getInt("idUsuario"), rs.getString("nombre"), rs.getString("primerApellido"), rs.getString("segundoApellido"), rs.getString("direccion"), rs.getString("telefono"), rs.getString("correo"), rs.getString("usuario"), rs.getString("password"), rs.getString("fechaNacimiento"), rs.getInt("idRol")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;

    }
   
          public boolean eliminarUsuario(int idUsuario){
              String sql="DELETE FROM tb_usuarios WHERE idUsuario=?";
              try(Connection con=ConexionDB.obtenerConexion();
                      PreparedStatement ps=con.PreparedStatement(sql)){
                  ps.setInt(1, idUsuario);
                          ps.executeUpdate();
                          
              }return true;
                      }
                
    
    }
    


