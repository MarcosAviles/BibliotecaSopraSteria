/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EditorialDAO;
import dao.LibroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Editorial;
import model.Libro;

/**
 *
 * @author Arranque 4
 */
public class LibroController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LibroController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LibroController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String isbn=request.getParameter("isbn");
        String titulo=request.getParameter("titulo");
        String descripcion=request.getParameter("descripcion");
        String nombre_autor=request.getParameter("nombre_autor");
        String publicacion=request.getParameter("publicacion");
        int codigo_categoria=Integer.parseInt(request.getParameter("codigo_categoria"));
        String nit_editorial=request.getParameter("nit_editorial");
        
        Libro lib= new Libro(isbn, titulo, descripcion, nombre_autor, publicacion,"", codigo_categoria, nit_editorial);
        
        if(request.getParameter("Registrar")!=null){
            if(LibroDAO.registrar(lib)){
                request.setAttribute("mensaje", "El libro se ha registrado correctamente");
            }
            else{
                request.setAttribute("mensaje", "El libro NO se ha registrado");
            }
        }
        else if(request.getParameter("Eliminar")!=null){
            if(LibroDAO.eliminar(lib)){
                request.setAttribute("mensaje", "El libro se ha eliminado correctamente");
            }
            else{
                request.setAttribute("mensaje", "El libro NO se ha eliminado");
            }
        }
        else if(request.getParameter("Actualizar")!=null){
            if(LibroDAO.actualizar(lib)){
                request.setAttribute("mensaje", "El libro se ha actualizado correctamente");
            }
            else{
                request.setAttribute("mensaje", "El libro NO se ha actualizado");
            }
        }
        else{
            request.setAttribute("mensaje", "Accion desconocida");
        }
        request.getRequestDispatcher("registroLibro.jsp").forward(request, response);
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
