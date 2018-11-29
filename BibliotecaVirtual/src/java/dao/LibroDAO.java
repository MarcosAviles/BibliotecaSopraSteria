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
import model.Libro;

/**
 *
 * @author Arranque 4
 */
public class LibroDAO {
    
    public static boolean registrar(Libro lib){
        try {
            String SQL = "INSERT INTO libros VALUES (?,?,?,?,?,(select now()),?,?)"; // Por cada ? un setString
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, lib.getIsbn());
            st.setString(2, lib.getTitulo());
            st.setString(3, lib.getDescripcion());
            st.setString(4, lib.getNombre_autor());
            st.setString(5, lib.getPublicacion());
            st.setInt(6, lib.getCodigo_categoria());
            st.setString(7, lib.getNit_editorial());
            return st.executeUpdate()>0;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static boolean actualizar(Libro lib){
        try {
            String SQL = "UPDATE libros " +
                "SET " +
                    "titulo=?, " +
                    "descripcion=?," +
                    "nombre_autor=?," +
                    "publicacion=?," +
                    "codigo_categoria=?," +
                    "nit_editorial=?" +
                "WHERE isbn=?"; // Por cada ? un setString
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, lib.getIsbn());
            st.setString(2, lib.getTitulo());
            st.setString(3, lib.getDescripcion());
            st.setString(4, lib.getNombre_autor());
            st.setString(5, lib.getPublicacion());
            st.setInt(6, lib.getCodigo_categoria());
            st.setString(7, lib.getNit_editorial());
            return st.executeUpdate()>0;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static boolean eliminar(Libro lib){
        try {
            String SQL = "DELETE FROM libros WHERE isbn=?"; // Por cada ? un setString
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, lib.getIsbn());
            return st.executeUpdate()>0;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static ArrayList<Libro> listar(){

        try {
            String SQL = "SELECT * FROM libros";
            Connection con= Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<Libro> lista = new ArrayList<>();
            Libro lib;
            while(resultado.next()){
                lib= new Libro();
                lib.setIsbn(resultado.getString("isbn"));
                lib.setTitulo(resultado.getString("titulo"));
                lib.setDescripcion(resultado.getString("descripcion"));
                lib.setNombre_autor(resultado.getString("nombre_autor"));
                lib.setPublicacion(resultado.getString("publicacion"));
                lib.setFecha_registro(resultado.getString("fecha_registro"));
                lib.setCodigo_categoria(resultado.getInt("codigo_categoria"));
                lib.setNit_editorial(resultado.getString("nit_editorial"));
                lista.add(lib);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
}
