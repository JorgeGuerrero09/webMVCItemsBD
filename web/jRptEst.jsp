<%-- 
    Document   : jRptEst
    Created on : 7/12/2021, 07:37:03 PM
    Author     : checo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%
    ResultSet tablaEstudiante;
    String tabla = "";
    
    if(request.getSession().getAttribute("rptEstudiante") != null){
       tablaEstudiante = (ResultSet)request.getSession().getAttribute("rptEstudiante");
       tabla += "<table border='1' width='80%'>";
       tabla += "<tr>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Control</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Nombre</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Apellido Paterno</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Apellido Materno</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Carrera</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Semestre</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Telefono</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Contraseña</font></td>";
       tabla += "</tr>";
       
       
       while(tablaEstudiante.next()){
           tabla += "<tr>";
           tabla += "<td align='middle'><font face='arial' color='navy' size='2'><b>" + tablaEstudiante.getString(1) + "</b></font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(2) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(3) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(4) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(5) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(6) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(7) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaEstudiante.getString(8) + "</font></td>";
           tabla += "</tr>";
       }
       tabla += "</table>";
    }
    else{
        tabla = "No hay registros para consultar ...";
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width= , initial-scale=1.0">
    <title>Reporte de estudiantes</title>
    <link rel="preload" href="css/normalize.css" as="style">
    <link rel="stylesheet" href="css/normalize.css">

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap"
        rel="stylesheet">

    <link rel=preload href="css/style.css" as="style">
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
    <form id="frmPrincipal" method="POST" action="srvRptEst">  
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
            <h2 class="no-margin">Reporte de Estudiantes</h2>
            <p></p>
        </div>
    </header>

    <div class="contenedor contenido-principal">
        <main class="blog">
            <div class="contenedor centrar-texto">
            <input type="text" id="txtFiltro" name="txtFiltro" placeholder="captura un filtro ...">
            &nbsp;&nbsp;
            <input type="submit" id="btnFiltro" name="btnFiltro" value="filtrar ...">
            <br><br>
            <%=tabla%>
            </div>
        </main>
  
    </div>
</form>         
</body>
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
