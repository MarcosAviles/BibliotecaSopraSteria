<%-- 
    Document   : registroEditorial
    Created on : 28-nov-2018, 11:12:43
    Author     : Arranque 4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resgistro de Editoriales</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <div class="form-control">
            <div class="table-header">
                Desde aqui puede añadir o eliminar una editorial
            </div>
            <div>
                <form action="EditorialController" method="post" class="form-horizontal">
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Nit:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="nit" value="" placeholder="Nit de la Editorial"/>
                        </div> 
                    </div>
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
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Telefono:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="telefono" value="" placeholder="Telefono"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Direccion:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="direccion" value="" placeholder="Direccion de la editorial"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Email:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="email" value="" placeholder="Correo electronico"/>
                        </div> 
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            Sitio Web:
                        </label>
                        <div class="col-sm-3">
                            <input type="text" name="sitioweb" value="" placeholder="Sitio Web"/>
                        </div> 
                    </div>
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
