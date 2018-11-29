<%-- 
    Document   : newjsp
    Created on : 27-nov-2018, 13:25:36
    Author     : Arranque 4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Registro de Categorias</title>
        
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <div class="form-control">
            <div class="table-header">
                Desde aqui puede añadir o eliminar una categoria
            </div>
            <div>
                <form action="CategoriaController" method="post" class="form-horizontal">
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Nombre:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="nombre" value="" placeholder="Nombre de la Categoria"/>
                        </div> 
                    </div>
                    <br>
                    <div class="col-sm-3">
                        <button name="Registrar" class="btn btn-success" type="submit" value="Registrar"
                            <i class="fa fa-save"></i>   
                            Registrar
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
