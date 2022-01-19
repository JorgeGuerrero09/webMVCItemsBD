
package Controlador;

import Modelo.clsAdministrador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class srvAccesoAdm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException{
        response.setContentType("text/html;charset=UTF-8");
        String usuario = request.getParameter("txtUsuario");
        String contrasena = request.getParameter("txtContrasena");
        // VALIDACION DE DATOS RECIBIDOS (O NO RECIBIDOS)
        if(!usuario.equals("") && usuario != null && !contrasena.equals("") && contrasena != null){
            // CREACION DEL OBJETO, VIA CLASE clsUusario
            clsAdministrador objAdministrador = new clsAdministrador(usuario, contrasena);
            // EJECUCION DE LA CONEXION: conexion()
            Connection ctrCnn = objAdministrador.conexion();
            ResultSet ctrRs;
            ctrRs = objAdministrador.validarAccesoAdm();
            // VALIDACION DEL RESULTADO RECIBIDO EN RESULTSET
            String bandera = "";
            while(ctrRs.next()){
                bandera = ctrRs.getString(1);
                if(bandera.equals("1")){
                    // ASIGNAR LOS DATOS DEL USUARIO AL MODELO
                    objAdministrador.setNombre(ctrRs.getString(2));
                    objAdministrador.setPaterno(ctrRs.getString(3));
                    objAdministrador.setMaterno(ctrRs.getString(4));
                    objAdministrador.setUsuario(ctrRs.getString(5));
                }
            }
            // CERRAR CONEXION
            ctrRs.close();
            if(bandera.equals("1")){
                request.getSession().setAttribute("administrador", objAdministrador);
                request.getRequestDispatcher("jPrincipalAdm.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("errorCode", "1");
                request.getRequestDispatcher("jPrincipalAdm.jsp").forward(request, response);
            }
        } else {
            request.getSession().setAttribute("errorCode", "2");
            request.getRequestDispatcher("jPrincipalAdm.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch(SQLException ex){
            Logger.getLogger(srvAccesoEst.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch(SQLException ex){
            Logger.getLogger(srvAccesoEst.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}