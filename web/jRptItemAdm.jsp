<%-- 
    Document   : jAdminEst
    Created on : 6/12/2021, 10:52:14 PM
    Author     : checo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>

<%   
    ResultSet tablaItem;
    String tabla = "";
    
    if(request.getSession().getAttribute("rptItem") != null){
       tablaItem = (ResultSet)request.getSession().getAttribute("rptItem");
       tabla += "<table border='1' width='100%'>";
       tabla += "<tr>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Item</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Nombre</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Descripción</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Ubicación</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Hora de Entrega</font></td>";            
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Estado</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Dueño</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Contacto</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Carrera</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Semestre</font></td>";
       tabla += "<td bgcolor='navy' align='middle'><font face='arial' color='white'>Imagen</font></td>";
       tabla += "</tr>";
       
       
       while(tablaItem.next()){
           tabla += "<tr>";
           tabla += "<td align='middle'><font face='arial' color='navy' size='2'><b>" + tablaItem.getString(1) + "</b></font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(2) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(3) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(4) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(5) + "</font></td>"; 
           if(tablaItem.getString(6).equals("1"))
               tabla += "<td><font face='arial' color='navy' size='2'>Prestado</font></td>";
           if(tablaItem.getString(6).equals("0"))
               tabla += "<td><font face='arial' color='navy' size='2'>Disponible</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(7) + "</font></td>"; 
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(8) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(9) + "</font></td>";
           tabla += "<td><font face='arial' color='navy' size='2'>" + tablaItem.getString(10) + "</font></td>";
           tabla += "<td align='middle'><a href='" + tablaItem.getString(11) + "' target='_blank'><img src='" + tablaItem.getString(11) + "' height='80' width='100'></a></td>";
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
        <header class="header">
            <div class="contenedor">
                <div class="barra">
                    <a href="jPrincipalEst.jsp" class="logo">
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
                <h2 class="no-margin">Items Registrados</h2>
                <p></p>
            </div>
        </header>
    </body>
    <form id="frmPrincipal" method="POST" action="srvRptItemAdm">  
            <div class="contenedor centrar-texto">
                <br>
                <%=tabla%>
                <br>
            </div>
    </form>
    <footer class="footer">
        <div class="contenedor">
            <div class="barra">
                <a href="jPrincipalEst.jsp" class="logo">
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
