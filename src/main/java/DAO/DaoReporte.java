/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelo.Reporte;
import Util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author nicol
 */
public class DaoReporte {
    private Connection connection;

    public DaoReporte()throws SQLException {
       connection = DbUtil.getConnection();
    }     
    
     public ArrayList<Reporte> getreporte() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
   
            ArrayList<Reporte> historial = new ArrayList<Reporte>();
            Statement stmt = (Statement) connection.createStatement();
            String query = "select colmenahija.*, sum(recoleccion.kilosmiel) from (recoleccion left join colmenahija using (idcolmenahija)) group by (colmenahija.idcolmenahija);";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
           Reporte reporte= new Reporte();
           
            while (rs.next()) {
                reporte = new Reporte();
                reporte.setIdcolmenahija(rs.getInt("idcolmenahija"));
                reporte.setIdcol(rs.getInt("idcol"));
                reporte.setUbicacion(rs.getString("ubicacion"));
                reporte.setIdcaja(rs.getInt("idcaja"));
                reporte.setIdfamiliam(rs.getInt("idfamilia"));
                reporte.setSum(rs.getInt("sum"));
                historial.add(reporte);
                
            }
            return historial;
   
    }
}
