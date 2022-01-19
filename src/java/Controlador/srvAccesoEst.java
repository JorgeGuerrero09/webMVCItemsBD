
package Controlador;

import Modelo.clsEstudiante;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class srvAccesoEst extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String usuario = request.getParameter("txtNoControl");
        String contrasena = request.getParameter("txtContrasena");
        // VALIDACION DE DATOS RECIBIDOS (O NO RECIBIDOS)
        if(!usuario.equals("") && usuario != null && !contrasena.equals("") && contrasena != null){          
            // CREACION DEL OBJETO, VIA CLASE clsUusario
            int no_control = Integer.parseInt(usuario);
            clsEstudiante objEstudiante = new clsEstudiante(no_control, contrasena);
            // EJECUCION DE LA CONEXION: conexion()
            Connection ctrCnn = objEstudiante.conexion();
            ResultSet ctrRs;
            ctrRs = objEstudiante.validarAccesoEst();
            // VALIDACION DEL RESULTADO RECIBIDO EN RESULTSET
            String bandera = "";
            while(ctrRs.next()){
                bandera = ctrRs.getString(1);
                if(bandera.equals("1")){
                    // ASIGNAR LOS DATOS DEL USUARIO AL MODELO
                    objEstudiante.setNoControl(ctrRs.getInt(2));
                    objEstudiante.setNombre(ctrRs.getString(3));
                    objEstudiante.setCarrera(ctrRs.getString(4));
                }
            }
            // CERRAR CONEXION
            ctrRs.close();
            if(bandera.equals("1")){                                        
                request.getSession().setAttribute("alumno", objEstudiante);
                request.getRequestDispatcher("jPrincipalEst.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("errorCode", "1");
                request.getRequestDispatcher("jPrincipalEst.jsp").forward(request, response);
            }                   
        } else {
            request.getSession().setAttribute("errorCode", "3");
            request.getRequestDispatcher("jPrincipalEst.jsp").forward(request, response);
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