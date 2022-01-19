<%-- 
    Document   : jAcceso
    Created on : 6/12/2021, 03:45:18 PM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCESO</title>
    </head>
    <body>
        <form id="frmLoginEst" name="frmLoginEst" method="post" action="srvAccesoEst">
            <center>
                <table width="30%" border="1">
                    <tr>
                        <td colspan="2" bgcolor="Navy" align="middle">
                            <font face="arial" color="white" size="3">
                                <b>Acceso a Estudiantes</b>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" bgcolor="Lightblue">
                            <font face="arial" color="blue" size="2">
                                No de Control:
                            </font>
                        </td>
                        <td width="75%">
                            <input type="text" id="txtNoControl" name="txtNoControl" placeholder="Captura tu no de control">
                        </td>
                    </tr
                    <tr>
                        <td width="25%" bgcolor="Lightblue">
                            <font face="arial" color="blue" size="2">
                                Contraseña:
                            </font>
                        </td>
                        <td width="75%">
                            <input type="text" id="txtContrasena" name="txtContrasena" placeholder="Captura tu contraseña">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" bgcolor="Navy" align="middle">
                            <input type="submit" id="btnAceptar" name="btnAceptar" value="Aceptar">
                        </td>
                    </tr>
                </table>
            </center>
        </form>
        <br><br><br>
        <form id="frmLoginAdm" name="frmLoginAdm" method="POST" action="srvAccesoAdm">
            <center>
                <table width="30%" border="1">
                    <tr>
                        <td colspan="2" bgcolor="Navy" align="middle">
                            <font face="arial" color="white" size="3">
                                <b>Acceso a Administradores</b>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" bgcolor="Lightblue">
                            <font face="arial" color="blue" size="2">
                                Usuario:
                            </font>
                        </td>
                        <td width="75%">
                            <input type="text" id="txtUsuario" name="txtUsuario" placeholder="Captura tu usuario">
                        </td>
                    </tr
                    <tr>
                        <td width="25%" bgcolor="Lightblue">
                            <font face="arial" color="blue" size="2">
                                Contraseña:
                            </font>
                        </td>
                        <td width="75%">
                            <input type="text" id="txtContrasena" name="txtContrasena" placeholder="Captura tu contraseña">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" bgcolor="Navy" align="middle">
                            <input type="submit" id="btnAceptar1" name="btnAceptar1" value="Aceptar">
                        </td>
                    </tr>
                </table>
            </center>
        </form>
    </body>
</html>
