<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% java.util.Date dt = new java.util.Date();

java.text.SimpleDateFormat sdf = 
     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String currentTime = sdf.format(dt);
%>
<%@ page import ="java.sql.*" %>
<%
    
    try{
        String user = request.getParameter("user");
        String nombre = request.getParameter("nombre");   
        String numLin = request.getParameter("numLin");
        String posicion = request.getParameter("posicion");
        String direccion = request.getParameter("direccion");
        out.println(nombre);
        out.println(numLin);
        out.println(posicion);
        out.println(direccion);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pois?" + "user=root&password=1234");    
        PreparedStatement pst = conn.prepareStatement("insert into poiparadacolectivo (direccion, nombre, coordenada, numeroLinea, tipoPOI) value (?, ?, ?, ?, '1')");
        pst.setString(1, direccion);
        pst.setString(2, nombre);
        pst.setString(3, posicion);
        pst.setString(4, numLin);
        PreparedStatement pst2 = conn.prepareStatement("insert into logscreacionpoi (fecha, usuario, nombrepoi, tipoPOI) value (?, ?, ?,'1')");
        pst2.setString(1, currentTime);
        pst2.setString(2, user);
        pst2.setString(3, nombre);
       
        int rs = pst.executeUpdate();
        int rs2 = pst2.executeUpdate();
        if(rs == 1 && rs2 == 1){           
        out.println("OK");
        response.sendRedirect("poiParada.jsp?user="+user); 

        }        
        else{
            out.println("BAD");
        response.sendRedirect("../../index.jsp");
        }
       
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");   
         out.println("\n Message: " + e.getMessage());
  
   }      
%>

