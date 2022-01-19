<%-- 
    Document   : jAdminEst
    Created on : 6/12/2021, 10:52:14 PM
    Author     : checo
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
            mensaje = "<script languaje='javascript'>alert('El usuario/contraseña no pueden quedar vacios, verificar');</script>";
        }
        
        mensaje += "<script languaje='javascript'>document.location.href='jAccesoAdm.jsp';</script>";
    }
    //errorCode--------------------------------------------------------------------
    
    ResultSet vistaUsuario;
    if(request.getSession().getAttribute("insAlumno") != null){

        vistaUsuario = (ResultSet)request.getSession().getAttribute("insAlumno");

        if(vistaUsuario.getString(1).equals("2")){
            mensaje += "<script language='javascript'>"
                    + "alert('El número de control ya existe, capturar otro');"
                    + "</script>";
        }
        if(vistaUsuario.getString(1).equals("1")){
            mensaje += "<script language='javascript'>"
                    + "alert('El estudiante ya existe, capturar otro');"
                    + "</script>";
        }
        if(vistaUsuario.getString(1).equals("0")){
            mensaje += "<script language='javascript'>"
                    + "alert('El alumno fue registrado exitosamente');"
                    + "</script>";
        }
        request.getSession().setAttribute("insAlumno", null);
    }
    if(request.getSession().getAttribute("updAlumno") != null){

        vistaUsuario = (ResultSet)request.getSession().getAttribute("updAlumno");

        if(vistaUsuario.getString(1).equals("1")){
            mensaje += "<script language='javascript'>"
                    + "alert('La clave del usuario no existe');"
                    + "</script>";
        }
        if(vistaUsuario.getString(1).equals("0")){
            mensaje += "<script language='javascript'>"
                    + "alert('El estudiante fue modificado exitosamente');"
                    + "</script>";
        }
        request.getSession().setAttribute("updAlumno", null);
    }
    if(request.getSession().getAttribute("delAlumno") != null){

        vistaUsuario = (ResultSet)request.getSession().getAttribute("delAlumno");

        if(vistaUsuario.getString(1).equals("1")){
            mensaje += "<script language='javascript'>"
                    + "alert('El número de control no existe');"
                    + "</script>";
        }
        if(vistaUsuario.getString(1).equals("0")){
            mensaje += "<script language='javascript'>"
                    + "alert('El estudiante fue eliminado exitosamente');"
                    + "</script>";
        }
        request.getSession().setAttribute("delAlumno", null);
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
                    <a href="jPrincipalAdm.jsp" class="logo">
                        <h1 class="logo__nombre no-margin centrar-texto">Items<span class="logo__bold">ITP</span></h1>
                    </a>

                    <nav class="navegacion">
                        <a href="jPrincipalAdm.jsp" class="navegacion__enlace">Administración de <br>Estudiantes</a>
                        &nbsp;
                        <a href="srvRptEst" target="_self" class="navegacion__enlace">Reporte de <br>Estudiantes</a>
                        &nbsp;
                        <a href="srvRptItemAdm" target="_self" class="navegacion__enlace">Reporte de <br>Items</a>
                        &nbsp;                        
                        <a href="jAcercade.jsp" class="navegacion__enlace">Acerca de...</a>
                    </nav>
                </div>
            </div>

            <div class="header__texto">
                <h2 class="no-margin">Administración de Estudiantes</h2>
                <p></p>
            </div>
        </header>
    </body>
    <form id="frmPrincipal" method="POST" action="srvInsAdm">  
        <%=mensaje%>
            <div class="contenedor centrar-texto">
                <table width="90%" border="0">
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Número de Control:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtControl" id="txtControl" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Nombre:
                            </font>
                        </td>
                        <td>
                          <input type="text" class="textDecoracion" value="" name="txtNombre" id="txtNombre" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Apellido Paterno:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtPaterno" id="txtPaterno" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Apellido Materno:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtMaterno" id="txtMaterno" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Carrera:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtCarrera" id="txtCarrera" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Semestre:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtSemestre" id="txtSemestre" size="25">
                        </td>
                    </tr>
                     <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Telefono:
                            </font>
                        </td>
                        <td>
                            <input type="text" class="textDecoracion" value="" name="txtTelefono" id="txtTelefono" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="fontTrabajoEtiquetas">
                                Contraseña:
                            </font>
                        </td>
                        <td>
                            <input type="password" class="textDecoracion" value="" name="txtContrasena" id="txtContrasena" size="25">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="middle">
                            <br>
                            <input type="button" onclick="validarIns();"  value="Registrar" class="botonDecoracion">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" onclick="validarUpd();"  value="Modificar" class="botonDecoracion">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" onclick="validarDel();" value="Eliminar" class="botonDecoracion">

                        </td>
                    </tr>
                </table>  
            </div>
    </form>
    <footer class="footer">
        <div class="contenedor">
            <div class="barra">
                <a href="jPrincipalAdm.jsp" class="logo">
                    <h1 class="logo__nombre no-margin centrar-texto">Items<span class="logo__bold">ITP</span></h1>
                </a>

                    <nav class="navegacion">
                        <a href="jPrincipalAdm.jsp" class="navegacion__enlace">Administración de <br>Estudiantes</a>
                        &nbsp;
                        <a href="srvRptEst" target="_self" class="navegacion__enlace">Reporte de <br>Estudiantes</a>
                        &nbsp;
                        <a href="srvRptItemAdm" target="_self" class="navegacion__enlace">Reporte de <br>Items</a>
                        &nbsp;                        
                        <a href="jAcercade.jsp" class="navegacion__enlace">Acerca de...</a>
                    </nav>
            </div>
        </div>
    </footer>
</html>

<script language="javascript">
    function validarIns(){
        var control = document.getElementById("txtControl");
        var nombre = document.getElementById("txtNombre");
        var paterno = document.getElementById("txtPaterno");
        var materno = document.getElementById("txtMaterno");
        var carrera = document.getElementById("txtCarrera");
        var semestre = document.getElementById("txtSemestre");
        var telefono = document.getElementById("txtTelefono");
        var contrasena = document.getElementById("txtContrasena");

        // SECCION DE VALIDACIONES DE DATOS CAPTURADOS
        if(control.value === "" || isNaN(control.value))
            alert("El número de control no puede quedar vacio");
        else {
            if(nombre.value === "")
                alert("El nombre no puede quedar vacio");
            else {
                if(paterno.value === "")
                alert("El apellido paterno no puede quedar vacio");
                else {
                    if(materno.value === "")
                    alert("El apellido materno no puede quedar vacio");
                    else {
                        if(carrera.value === "")
                        alert("La carrera no puede quedar vacia");
                        else {
                            if(semestre.value === "")
                            alert("El semestre no puede quedar vacia");
                            else {
                                if(telefono.value === "" || isNaN(telefono.value))
                                alert("El número de telefono no puede quedar vacio");
                                else {
                                    if(contrasena.value === "")
                                    alert("La contraseña no puede qudar vacia");
                                    else {
                                    // VALIDACIONES CORRECTAS, SE HARA UN SUBMIT
                                        if(confirm("¿Estas seguro de continuar?")){
                                          document.forms[0].action = "srvInsAdm";
                                         document.forms[0].submit();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    function validarUpd(){
        var control = document.getElementById("txtControl");
        var nombre = document.getElementById("txtNombre");
        var paterno = document.getElementById("txtPaterno");
        var materno = document.getElementById("txtMaterno");
        var carrera = document.getElementById("txtCarrera");
        var semestre = document.getElementById("txtSemestre");
        var telefono = document.getElementById("txtTelefono");
        var contrasena = document.getElementById("txtContrasena");

        // SECCION DE VALIDACIONES DE DATOS CAPTURADOS
        if(control.value === "" || isNaN(control.value))
            alert("El número de control no puede quedar vacio");
        else {
            if(nombre.value === "")
                alert("El nombre no puede quedar vacio");
            else {
                if(paterno.value === "")
                alert("El apellido paterno no puede quedar vacio");
                else {
                    if(materno.value === "")
                    alert("El apellido materno no puede quedar vacio");
                    else {
                        if(carrera.value === "")
                        alert("La carrera no puede quedar vacia");
                        else {
                            if(semestre.value === "")
                            alert("El semestre no puede quedar vacia");
                            else {
                                if(telefono.value === "" || isNaN(telefono.value))
                                alert("El número de telefono no puede quedar vacio");
                                else {
                                    if(contrasena.value === "")
                                    alert("La contraseña no puede qudar vacia");
                                    else {
                                    // VALIDACIONES CORRECTAS, SE HARA UN SUBMIT
                                        if(confirm("¿Estas seguro de continuar?")){
                                          document.forms[0].action = "srvUpdAdm";
                                         document.forms[0].submit();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    function validarDel(){
        var control = document.getElementById("txtControl");
        if(control.value === "" || isNaN(control.value))
            alert("El número de control debe ser un número");
        else {
            // VALIDACIONES CORRECTAS, SE HARA UN SUBMIT
            if(confirm("¿Estas seguro de continuar?")){
                document.forms[0].action = "srvDelAdm";
                document.forms[0].submit();
            }
        }
    }

</script>