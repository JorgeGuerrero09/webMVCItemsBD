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

public class srvUpdAdm extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
            String control, nombre, paterno, materno, carrera, semestre, telefono, contrasena;
            // RECEPCION Y VALIDACION DE DATOS
            if(request.getParameter("txtControl") == null)
               control = "";
            else
               control = request.getParameter("txtControl");
            if(request.getParameter("txtNombre") == null)
               nombre = "";
            else
               nombre = request.getParameter("txtNombre");
            if(request.getParameter("txtPaterno") == null)
               paterno = "";
            else
               paterno = request.getParameter("txtPaterno");
            if(request.getParameter("txtMaterno") == null)
               materno = "";
            else
               materno = request.getParameter("txtMaterno");
            if(request.getParameter("txtCarrera") == null)
               carrera = "";
            else
               carrera = request.getParameter("txtCarrera");
            if(request.getParameter("txtSemestre") == null)
               semestre = "";
            else
               semestre = request.getParameter("txtSemestre");
            if(request.getParameter("txtTelefono") == null)
               telefono = "";
            else
               telefono = request.getParameter("txtTelefono");
            if(request.getParameter("txtContrasena") == null)
               contrasena = "";
            else
               contrasena = request.getParameter("txtContrasena");
           
            if(!control.equals("") && !nombre.equals("") && !paterno.equals("") && !materno.equals("") && !carrera.equals("") 
                    && !semestre.equals("") && !telefono.equals("") && !contrasena.equals("")){
               // CREACION DEL OBJETO Y EJECUCION DEL METODO INS
               clsAdministrador objAdministrador = new clsAdministrador();
               Connection cnn = objAdministrador.conexion();
               ResultSet rs;
               rs = objAdministrador.spUpdAlumno(control, nombre, paterno, materno, carrera, semestre, telefono, contrasena);
               rs.next();
               request.getSession().setAttribute("updAlumno", rs);
               request.getRequestDispatcher("jPrincipalAdm.jsp").
                       forward(request, response);
            }
            else{
               request.getRequestDispatcher("jPrincipalAdm.jsp").
                       forward(request, response);
            }
        }
        catch(SQLException ex){
           Logger.getLogger(srvUpdAdm.class.getName()).
                   log(Level.SEVERE, null, ex);
           //java.util.logging.Logger.getLogger(srvRptUsuario.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
