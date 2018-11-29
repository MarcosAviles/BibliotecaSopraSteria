/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categoria;


/**
 *
 * @author Arranque 4
 */
public class CategoriaDAO {
    
    public static boolean registrar(Categoria c){
        try {
            String SQL = "INSERT INTO categorias(nombre) values(?)"; // Por cada ? un setString
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, c.getNombre());
            if(st.executeUpdate()>0){
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static boolean eliminar(Categoria cat){
        try {
            String SQL = "DELETE FROM categorias WHERE nombre=?"; // Por cada ? un setString
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, cat.getNombre());
            if(st.executeUpdate()>0){
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static ArrayList<Categoria> listar(){

        try {
            String SQL = "SELECT * FROM categorias";
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<Categoria> lista = new ArrayList<>();
            Categoria cat;
            while(resultado.next()){
                cat= new Categoria();
                cat.setCodigo(resultado.getInt("codigo"));
                cat.setNombre(resultado.getString("nombre"));
                lista.add(cat);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public static String getNombre(int codigo){
        try {
            String SQL = "SELECT nombre FROM categorias where codigo=?";
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setInt(1, codigo);
            ResultSet resultado = st.executeQuery();
            resultado.next();
            String nombre=resultado.getString("nombre");
            return nombre;
        } catch (SQLException ex) {
            return null;
        }
    }
}
