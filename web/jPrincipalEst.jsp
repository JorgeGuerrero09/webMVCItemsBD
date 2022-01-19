<%-- 
    Document   : jPrincipalEst
    Created on : 6/12/2021, 08:35:06 PM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>

<%
    String mensaje = "";
    
    //errorCode--------------------------------------------------------------------
    String vistaError = "";
    if(request.getSession().getAttribute("errorCode") != null){
        vistaError = (String)request.getSession().getAttribute("errorCode");
        mensaje = "";
        
        if(vistaError.equals("1")){
            mensaje = "<script languaje='javascript'>alert('El usuario/contraseña son incorrectos, verificar');</script>";
        }
        if(vistaError.equals("2")){
            mensaje = "<script languaje='javascript'>alert('El contraseña no pueden quedar vacios, verificar');</script>";
        }
        if(vistaError.equals("3")){
            mensaje = "<script languaje='javascript'>alert('El usuario no pueden quedar vacios, verificar');</script>";
        }
        mensaje += "<script languaje='javascript'>document.location.href='jAccesoEst.jsp';</script>";
    }
    //errorCode--------------------------------------------------------------------  
    
    ResultSet vistaUsuario;
    
    if(request.getSession().getAttribute("insItem") != null){
        vistaUsuario = (ResultSet)request.getSession().getAttribute("insItem");

        if(vistaUsuario.getString(1).equals("1")){
            mensaje += "<script language='javascript'>"
                    + "alert('Ya tienes un registro de este Item, por favor registra uno diferente');"
                    + "</script>";
        }
        if(vistaUsuario.getString(1).equals("0")){
            mensaje += "<script language='javascript'>"
                    + "alert('El Item fue registrado exitosamente');"
                    + "</script>";
        }
        request.getSession().setAttribute("insItem", null);
    }

%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width= , initial-scale=1.0">
        <title>itemsITP</title>
        <link rel="preload" href="css/normalize.css" as="style">
        <link rel="stylesheet" href="css/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
        <link rel=preload href="css/style.css" as="style">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <header class="header">
            <div class="contenedor">
                <div class="barra">
                    <a href="srvRptItem" class="logo">
                        <h1 class="logo__nombre no-margin centrar-texto">Items<span class="logo__bold">ITP</span></h1>
                    </a>

                    <nav class="navegacion">
                        <a href="srvRptItem" class="navegacion__enlace">Consulta de<br>Items</a>
                        &nbsp;
                        <a href="jPrincipalEst.jsp" target="_self" class="navegacion__enlace">Registrar nuevo<br>Item</a>
                        &nbsp;
                        <a href="jAcercade2.jsp" class="navegacion__enlace">Acerca de...</a>
                    </nav>
                </div>
            </div>

            <div class="header__texto">
                <h2 class="no-margin">Registro de Item</h2>
                <p></p>
            </div>
        </header>
    </body>
    <form id="frmPrincipal" method="POST" action="srvInsItem1">  
        <%=mensaje%>
            <div class="contenedor centrar-texto">
                <table width="90%" border="0">
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Nombre de Item:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtNombre" id="txtNombre" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Descripción:
                            </font>
                        </td>
                        <td>
                          <input type="text" class="textDecoracion" value="" name="txtDescripcion" id="txtDescripcion" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Ubicación de entrega:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtUbicacion" id="txtUbicacion" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Hora de entrega:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtHora" id="txtHora" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                No. Control:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtNoControl" id="txtNoControl" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Categoria:
                            </font>
                        </td>
                        <td> 
                            <select name="txtCategoria">
                                <option value="1">Util Escolar</option>
                                <option value="2">Herramienta</option>
                                <option value="3">Asesoria</option>
                                <option value="4">Libro</option>
                                <option value="5">Software</option>
                                <option value="6">Apuntes</option>
                                <option value="7">Deportes/Instrumentos</option>
                            </select>
                        </td>
                    </tr>                     
                    <tr>
                        <td colspan="4" align="middle">
                            <br>
                                <center>
                                    <input type="button" onclick="validarIns();"  value="Registrar" class="botonDecoracion">
                                </center>
                        </td>
                    </tr>
                </table>  
            </div>
    </form>
    <footer class="footer">
        <div class="contenedor">
            <div class="barra">
                <a href="srvRptItem" class="logo">
                    <h1 class="logo__nombre no-margin centrar-texto">Items<span class="logo__bold">ITP</span></h1>
                </a>

                    <nav class="navegacion">
                        <a href="srvRptItem" class="navegacion__enlace">Consulta de<br>Items</a>
                        &nbsp;
                        <a href="jPrincipalEst.jsp" target="_self" class="navegacion__enlace">Registrar nuevo<br>Item</a>
                        &nbsp;
                        <a href="jAcercade2.jsp" class="navegacion__enlace">Acerca de...</a>
                    </nav>
            </div>
        </div>
    </footer>
</html>

<script language="javascript">
    function validarIns(){
        var nombre = document.getElementById("txtNombre");
        var descripcion = document.getElementById("txtDescripcion");
        var ubicacion = document.getElementById("txtUbicacion");
        var hora = document.getElementById("txtHora");
        var no_control = document.getElementById("txtNoControl");
        var categoria = document.getElementById("txtCategoria");

        // SECCION DE VALIDACIONES DE DATOS CAPTURADOS
        if(nombre.value === "" )
            alert("El nombre del item no puede quedar vacio");
        else {
            if(descripcion.value === "")
                alert("La descripción no puede quedar vacia");
            else {
                if(ubicacion.value === "")
                    alert("Debe capturar una ubicación de entrega");
                else {
                    if(hora.value === "")
                        alert("Debe colocar una hora de entrega");
                    else {
                        if(no_control.value === "" || isNaN(no_control.value))
                            alert("El número de control no puede quedar vacio");
                        else {      
                            // VALIDACIONES CORRECTAS, SE HARA UN SUBMIT
                            if(confirm("¿Estas seguro de continuar?")){
                                document.forms[0].action = "srvInsItem1";
                                document.forms[0].submit();
                            }
                        }
                    }
                }
            }
        }
    }
    
</script>