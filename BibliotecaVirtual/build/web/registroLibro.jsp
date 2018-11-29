<%-- 
    Document   : registroLibro
    Created on : 28-nov-2018, 13:20:19
    Author     : Arranque 4
--%>

<%@page import="dao.EditorialDAO"%>
<%@page import="model.Editorial"%>
<%@page import="model.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Libros</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <div class="form-control">
            <div class="table-header">
                Desde aqui puede añadir o eliminar un libro
            </div>
            <div>
                <form action="LibroController" method="post" class="form-horizontal">
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            ISBN:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="isbn" value="" placeholder="ISBN del Libro"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Titulo:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="titulo" value="" placeholder="Título del Libro"/>
                        </div> 
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Descripción:
                        </label>
                        <div class="col-sm-3">
                            <textarea name="descripcion" rows="4" cols="25"></textarea>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Nombre del autor:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="nombre_autor" value="" placeholder="Autor del Libro"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Fecha de Publicación:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="publicacion" value="" placeholder="AAAA-MM-DD"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Categoria:
                        </label>
                        <div class="col-sm-3">
                            <select name="codigo_categoria">
                                <option value="">Seleccione Categoria</option> 
                                <% for(Categoria c: CategoriaDAO.listar()){ %>
                                    <option value="<%= c.getCodigo() %>"><%=c.getNombre()%></option>
                                <% }%>
                            </select>
                        </div> 
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Editorial:
                        </label>
                        <div class="col-sm-3">
                            <select name="nit_editorial">
                                <option value="0">Seleccione Editorial</option>
                                <% for(Editorial e: EditorialDAO.listar()){ %>
                                <option value="<%= e.getNit() %>"><%=e.getNombre()%></option>
                                <% }%>
                            </select>
                        </div> 
                    </div>
                    <br>
                    <div class="col-sm-3">
                        <button name="Registrar" class="btn btn-success" type="submit" value="Registrar"
                            <i class="fa fa-save"></i>   
                            Registrar
                        </button>
                        <button name="Actualizar" class="btn btn-warning" type="submit" value="Actualizar"
                            <i class="fa fa-edit"></i>   
                            Actualizar
                        </button>
                        <button name="Eliminar" class="btn btn-danger" type="submit" value="Eliminar"
                            <i class="fa fa-remove"></i>   
                            Eliminar
                        </button>
                    </div>
                </form>
                <br>
                <%=(request.getAttribute("mensaje")!=null?request.getAttribute("mensaje"):"")%>
            </div>
        </div>
    </body>
</html>
