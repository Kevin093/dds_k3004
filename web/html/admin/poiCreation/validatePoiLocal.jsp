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
        String horarios = request.getParameter("horarios");
        String posicion = request.getParameter("posicion");
        String direccion = request.getParameter("direccion");
        String rubro = request.getParameter("rubro");        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pois?" + "user=root&password=1234");    
        PreparedStatement pst = conn.prepareStatement("insert into poilocal (Direccion, Nombre, Coordenada, Rubro, Horarios, tipoPOI) value (?, ?, ?, ?, ?,'2')");
        pst.setString(1, direccion);
        pst.setString(2, nombre);
        pst.setString(3, posicion);
        pst.setString(4, rubro);
        pst.setString(5, horarios);
        PreparedStatement pst2 = conn.prepareStatement("insert into logscreacionpoi (fecha, usuario, nombrepoi, tipoPOI) value (?, ?, ?,'2')");
        pst2.setString(1, currentTime);
        pst2.setString(2, user);
        pst2.setString(3, nombre);
       
        int rs = pst.executeUpdate();

        if(rs == 1){           
        pst2.executeUpdate();  %> 
    <script>
        var usuario = "<%= user%>"
        var nombre = "<%= nombre%>"
        if(window.confirm("El POI Local "+nombre+" se creó correctamente")){
            window.location.replace("poiLocal.jsp?user="+usuario);            
        }
    </script>
        <%         
        }        
        else{            %>
    <script>
        var usuario = "<%= user%>"
        if(window.confirm("El POI Local no se creó correctamente")){
            window.location.replace("poiLocal.jsp?user="+usuario);            
        }
    </script>
<% }}
       
     catch(Exception e){       
       out.println("Something went wrong !! Please try again");   
         out.println("\n Message: " + e.getMessage());
  
   }      
%>

