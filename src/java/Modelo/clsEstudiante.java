/*
    CREACION DE LA ESTRUCTURA DEL ESTUDIANTE
    NO_CONTROL          (Int)
    NOMBRE              (String)
    APELLIDO PATERNO    (String)
    APELLIDO MATERNO    (String)
    CARRERA             (String)
    SEMESTRE            (Int)
    TELEFONO            (Int)
    CONTRASEÑA          (String)
 */
package Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class clsEstudiante {
    private int    no_control;
    private String nombre;
    private String paterno;
    private String materno;
    private String carrera;
    private int    semestre;
    private String telefono;
    private String contrasena;
    
    public int getNoControl(){
        return this.no_control;
    }
    public void setNoControl(int no_control){
        this.no_control = no_control;
    }
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
    public String getCarrera(){
        return this.carrera;
    }
    public void setCarrera(String carrera){
        this.carrera = carrera;
    }
    public int getSemnestre(){
        return this.semestre;
    }
    public void setSemestre(int semestre){
        this.semestre = semestre;
    }
    public String getTelefono(){
        return this.telefono;
    }
    public void setTelefono(String telefono){
        this.telefono = telefono;
    }
    public String getContrasena(){
        return this.contrasena;
    }
    public void setContrasena(String contrasena){
        this.contrasena = contrasena;
    }
    
    public clsEstudiante(){
        // CONTRUCTOR DE BASE PARA LA CLASE clsEstudiante
    }
    
    public clsEstudiante(int no_control, String contrasena){
        this.no_control = no_control;
        this.contrasena = contrasena;
    }
    
    public clsEstudiante(int no_control){
        this.no_control = no_control;
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
    public ResultSet validarAccesoEst() throws SQLException{
        consultaSQL = "call spAccesoEst(" + this.no_control + ", '" + this.contrasena + "');";
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
    
    public ResultSet itemEstudiante(int no_control) throws SQLException{
        consultaSQL = "call spItemsAlumno(" + no_control + ");";
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
}
