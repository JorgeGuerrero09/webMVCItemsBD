
package Controlador;

import Modelo.clsItem;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "srvInsItem1", urlPatterns = {"/srvInsItem1"})
public class srvInsItem1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String nombre, descripcion, ubicacion, hora, control, categoria;
            
            // RECEPCION Y VALIDACION DE DATOS            
            if(request.getParameter("txtNombre") == null)
               nombre = "";
            else
               nombre = request.getParameter("txtNombre");
            if(request.getParameter("txtDescripcion") == null)
               descripcion = "";
            else
               descripcion = request.getParameter("txtDescripcion");
            if(request.getParameter("txtUbicacion") == null)
               ubicacion = "";
            else
               ubicacion = request.getParameter("txtUbicacion");
            if(request.getParameter("txtHora") == null)
               hora = "";
            else
               hora = request.getParameter("txtHora");
            if(request.getParameter("txtNoControl") == null)
               control = "";
            else
               control = request.getParameter("txtNoControl");
            if(request.getParameter("txtCategoria") == null)
               categoria = "";
            else
               categoria = request.getParameter("txtCategoria");
            
            if(!nombre.equals("") && !descripcion.equals("") && !ubicacion.equals("") && !hora.equals("") 
                    && !control.equals("") && !categoria.equals("")){
               // CREACION DEL OBJETO Y EJECUCION DEL METODO INS
               clsItem objItem = new clsItem();
               Connection cnn = objItem.conexion();
               ResultSet rs;
               
               rs = objItem.insertarItem(nombre, descripcion, ubicacion, hora, control, categoria);
               rs.next();
               
               request.getSession().setAttribute("insItem", rs);
               request.getRequestDispatcher("jPrincipalEst.jsp").forward(request, response);
            }
            else{
               request.getRequestDispatcher("jPrincipalEst.jsp").forward(request, response);
            }
        }
        catch(SQLException ex){
           Logger.getLogger(srvInsItem1.class.getName()).log(Level.SEVERE, null, ex);
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
