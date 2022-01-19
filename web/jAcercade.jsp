<%-- 
    Document   : jAcercade
    Created on : 7/12/2021, 07:26:10 PM
    Author     : checo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width= , initial-scale=1.0">
    <title>Transportes Burgos</title>
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
    </header>

    <div class="contenedor contenido-principal">
        <main class="blog">

            <h3>Integrantes</h3>

            <article class="entrada">
                
                <div class="entrada__contenido">
                    <h4 class="no-margin">Fernando Bautista Bautista</h4><a><img src="imagenes/Fer.jpg" style="width:100px !important; height:100px alt="Fer"></a>
                    <h4 class="no-margin">Víctor Abraham Bonilla Trigueros</h4><a><img src="imagenes/Victor.jpg" alt="Víctor"></a>
                    <h4 class="no-margin">Jorge Guadalupe Guerrero Marin</h4><a><img src="imagenes/Jorge.jpg" style="width:100px !important; height:100px alt="Jorge"></a>
                    <h4 class="no-margin">Joel Enrique Peralta Cruz</h4><a><img src="imagenes/Joel.jpg" style="width:100px !important; height:100px alt="Joel"></a>
                    <h4 class="no-margin">Martinez Guerrero Sergio</h4><a><img src="imagenes/Sergio.jpg" style="width:100px !important; height:100px alt="Sergio"></a>
                 
                </div>
            </article>

        </main>
  
    </div>
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