/*
    CREACION DE LA ESTRUCTURA DEL ADMINISNTRADOR
    NOMBRE              (String)
    APELLIDO PATERNO    (String)
    APELLIDO MATERNO    (String)
    USUARIO             (String)
    CONTRASEÑA          (String)
 */
package Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class clsAdministrador {
    private String nombre;
    private String paterno;
    private String materno;
    private String usuario;
    private String contrasena;
    
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getPaterno(){
        return this.paterno;
    }
    public void setPaterno(String paterno){
        this.paterno = paterno;
    }
    public String getMaterno(){
        return this.materno;
    }
    public void setMaterno(String materno){
        this.materno = materno;
    }
    public String getUsuario(){
        return this.usuario;
    }
    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    public String getContrasena(){
        return this.contrasena;
    }
    public void setContrasena(String contrasena){
        this.contrasena = contrasena;
    }
    
    public clsAdministrador(){
        // CONSTRUCTOR DE BASE PARA LA CLASE clsAdministrador
    }
    public clsAdministrador(String usuario, String contrasena){
        this.usuario = usuario;
        this.contrasena = contrasena;
    }
    // DEFINICION DE LOS ATRIBUTOS Y METODOS PARA LA CONEXION A BD
    // CONEXION A BD
    Connection cnn;
     // CONTENEDOR DE DATOS
    ResultSet rs;
    // VARIABLE PARA CONSTRUIR LAS SENTENCIAS SQL
    String consultaSQL = "";
    // CLASE PARA MANEJO DE SENTENCIAS SQL
    Statement st;
    // METODO PARA CREACION DE CONEXION
    public java.sql.Connection conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/item_academico","","");
            System.out.println("Conexion a BD exitosa");
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println("Error: " + ex.getMessage());
        }
        return cnn;
    }
    // CREAR EL METODO PARA MONITOREO DEL STATEMENT
    Statement createStatement(){
        throw new UnsupportedOperationException("No se soporte una conexion a BD");
    }
    // CREACION DE METODOS PARA MANIPULACION DE PROCEDIMIENTOS, VISTAS, SQL
    public ResultSet validarAccesoAdm() throws SQLException{
        consultaSQL = "call spAccesoAdm('" + this.usuario + "','" + this.contrasena + "');";
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
    public ResultSet vwRptEstudiante(String filtro) throws SQLException{
        consultaSQL = "SELECT * FROM vwRptEstudiante";
        if(filtro.equals(""))
            consultaSQL += ";";
        else
//            consultaSQL += " WHERE nombre LIKE '%" + filtro + "%';";
            consultaSQL += " WHERE nombre LIKE '%" + filtro + "%' OR usuario like '%" + filtro + "' OR rol LIKE '%" + filtro + "%';";
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
    public ResultSet spInsAlumno(String control,
                                 String nombre, 
                                 String paterno,
                                 String materno,
                                 String carrera,
                                 String semestre,
                                 String telefono,
                                 String pwd                      
                                 )throws SQLException{
        
        consultaSQL = "call spInsAlumno(" + control + ", '" + nombre + "','" +  paterno + "','" +  materno + "','" +  carrera + "'," +  semestre + ",'" +  telefono + "'," +  pwd + ");";
        System.out.println(consultaSQL);
        // ESTABLECER LA EJECUCION DEL COMANDO
        st = (Statement)cnn.createStatement();
        // EJECUTAR COMANDO
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
    public ResultSet spUpdAlumno(String control,
                                 String nombre, 
                                 String paterno,
                                 String materno,
                                 String carrera,
                                 String semestre,
                                 String telefono,
                                 String pwd                      
                                 )throws SQLException{
    consultaSQL = "call spUpdEstudiante(" + control + ", '" + nombre + "','" +  paterno + "','" +  materno + "','" +  carrera + "'," +  semestre + ",'" +  telefono + "'," +  pwd + ");";
        //System.out.println(consultaSQL);
        // ESTABLECER LA EJECUCION DEL COMANDO
        st = (Statement)cnn.createStatement();
        // EJECUTAR COMANDO
        rs = st.executeQuery(consultaSQL);
        return rs;
        } 
     public ResultSet spDelAlumno(String control)throws SQLException{
        
        consultaSQL = "call spDelEstudiante(" + control + ");";
        //System.out.println(consultaSQL);
        // ESTABLECER LA EJECUCION DEL COMANDO
        st = (Statement)cnn.createStatement();
        // EJECUTAR COMANDO
        rs = st.executeQuery(consultaSQL);
        return rs;
        }
}
