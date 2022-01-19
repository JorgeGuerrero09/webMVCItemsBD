/*
   CRECION DE LA ESTRUCTURA DEL ITEM
    NOMBRE      (String)
    DESCRIPCION (String)
    UBICACION   (String)
    HORA        (String)
    ESTATUS     (String)
    NO_CONTROL  (Int)
    CATEGORIA   (Int)
 */
package Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class clsItem {
    private String nombre;
    private String descripcion;
    private String ubicacion;
    private String hora;
    private String estatus;
    private String no_control;
    private String categoria;
    
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getDescripcion(){
        return this.descripcion;
    }
    public void setDescripcion(String descripcion){
        this.nombre = descripcion;
    }
    public String getUbicacion(){
        return this.ubicacion;
    }
    public void setUbicacion(String ubicacion){
        this.ubicacion = ubicacion;
    }
    public String getHora(){
        return this.hora;
    }
    public void setHora(String hora){
        this.hora = hora;
    }
    public String getEstatus(){
        return this.estatus;
    }
    public void setEstatus(String estatus){
        this.estatus = estatus;
    }
    public String getNoControl(){
        return this.no_control;
    }
    public void setNoControl(String no_control){
        this.no_control = no_control;
    }
    public String getCategoria(){
        return this.categoria;
    }
    public void setCategoria(String categoria){
        this.categoria = categoria;
    }
    
    public clsItem(){
        // CONTRCUTOR DE BASE PARA LA CLASE clsItem
    }
    
    public clsItem(String nombre, String ubicacion, String hora, String estatus, String no_control, String categoria){
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.hora = hora;
        this.estatus = estatus;
        this.no_control = no_control;
        this.categoria = categoria;
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
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/item_academico","root","jorgeggm098");
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
    // CREACION DEL METODO PARA CONSULTA DE ITEMS (vwRptItem)
    public ResultSet vwRptItem() throws SQLException{
        consultaSQL = "SELECT * FROM vwRptItem;"; 
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
    
    public ResultSet insertarItem(  String nombre,
                                    String descripcion,
                                    String ubicacion,
                                    String hora,
                                    String no_control,
                                    String categoria) throws SQLException{
        consultaSQL = "call spInsItem('" + nombre + "', '" + descripcion + "','" +  ubicacion + "','" +  hora + "','" + no_control + "','" +  categoria + "');";
        st = (Statement)cnn.createStatement();
        rs = st.executeQuery(consultaSQL);
        return rs;
    }
   
}
