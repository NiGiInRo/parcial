<%-- 
    Document   : index
    Created on : 29/11/2017, 09:27:50 PM
    Author     : nicol
--%>
<%@page import="Modelo.Reporte"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            ArrayList<Reporte> esq= (ArrayList<Reporte>) request.getAttribute("reportes");
            Integer vtotal = (Integer) request.getAttribute("total");
            int total = 0;
            if (vtotal == null) {
                total = 0;
            } else {
                total = vtotal.intValue();
            }

        %>
       <br />
       <br />
       <br />
       <br />
       
         
         <form method="POST" action='ServletTabla' name="frr">
                        <font color="white"><h2>Tabla</h2></font>
                        <br>
                       
                            <table  width="400" border="2" align="center">
                                <caption align="top">
                                </caption>
                                <tr>
                                    <th width="84" scope="col"><strong><font >id colmena hija</font></strong></th>
                                    <th width="84" scope="col"><strong><font >id colmena madre</font></strong></th>
                                    <th width="84" scope="col"><strong><font >ubicacion</font></strong></th>
                                    <th width="84" scope="col"><strong><font >id caja</font></strong></th>
                                    <th width="84" scope="col"><strong><font >id familia</font></strong></th>
                                    <th width="84" scope="col"><strong><font >suma</font></strong></th>
                                    
                                </tr>
                                <%    if (request.getAttribute("reportes") != null) {
                                        ArrayList<Reporte> esqq = (ArrayList<Reporte>) request.getAttribute("reportes");
                                        for (Reporte e : esqq) {
                                %>
                                <tr>
                                    <td><%= e.getIdcolmenahija() %></td>
                                    <td><%= e.getIdcol() %></td>
                                    <td><%= e.getUbicacion() %></td>
                                    <td><%= e.getIdcaja() %></td>
                                    <td><%= e.getIdfamiliam() %></td>
                                    <td><%= e.getSum()%></td>
                                    
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </table>
                                 
                
         </form>
        
    </body>
</html>
