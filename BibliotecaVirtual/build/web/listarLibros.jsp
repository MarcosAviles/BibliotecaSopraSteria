<%-- 
    Document   : listarLibros
    Created on : 29-nov-2018, 11:43:02
    Author     : Arranque 4
--%>

<%@page import="dao.EditorialDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.LibroDAO"%>
<%@page import="model.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Libros</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <div class="form-control">
            <div class="table-header">
                Desde aqui se pueden listar los libros
            </div>
            <div>
                <br>
                <%=(request.getAttribute("mensaje")!=null?request.getAttribute("mensaje"):"")%>
            </div>
        </div>
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Isbn</th>
              <th scope="col">Título</th>
              <th scope="col">Descripción</th>
              <th scope="col">Autor</th>
              <th scope="col">Publicación</th>
              <th scope="col">Fecha de Registro</th>
              <th scope="col">Categoría</th>
              <th scope="col">Editorial</th>
            </tr>
          </thead>
          <tbody>
              <% for(Libro lib: LibroDAO.listar()){ %>
                  <tr>
                    <th scope="row"><%= lib.getIsbn()%></th>
                      <td><%= lib.getTitulo()%></td>
                      <td><%= lib.getDescripcion()%></td>
                      <td><%= lib.getNombre_autor()%></td>
                      <td><%= lib.getPublicacion()%></td>
                      <td><%= lib.getFecha_registro()%></td>
                      <td><%= CategoriaDAO.getNombre(lib.getCodigo_categoria())%></td>
                      <td><%= EditorialDAO.getNombre(lib.getNit_editorial())%></td>
                 </tr>
              <% }%>
          </tbody>
        </table>
    </body>
</html>
