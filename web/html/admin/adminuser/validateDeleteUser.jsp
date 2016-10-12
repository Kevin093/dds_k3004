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
        String usuario = request.getParameter("usuario");   
        String tipo = request.getParameter("tipo");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pois?" + "user=root&password=1234");    
        PreparedStatement pst = conn.prepareStatement("delete from users where userName = ? and userType =?");
        pst.setString(1, usuario);
        pst.setString(2, tipo);
        PreparedStatement pst2 = conn.prepareStatement("insert into logsadminuser (Fecha, Usuario, NombreUsuario, TipoUsuario, TipoModificacion) value (?, ?, ?, ?,'3')");
        pst2.setString(1, currentTime);
        pst2.setString(2, user);
        pst2.setString(3, usuario);
        pst2.setString(4, tipo);       
        int rs = pst.executeUpdate();

        if(rs == 1){
        pst2.executeUpdate();  %> 
    <script>
        var usuario = "<%= user%>"
        if(window.confirm("El usuario se eleminó correctamente")){
            window.location.replace("../portal-admin.jsp?user="+usuario);            
        }
    </script>
        <%         
        }        
        else{ if(tipo.equals("1")){
               %>
    <script>
        var usuario = "<%= user%>"
        if(window.confirm("El usuario no se eleminó ya que no es Administrador")){
            window.location.replace("../portal-admin.jsp?user="+usuario);            
        }
    </script>
        <% }
        else{%>
    <script>
        var usuario = "<%= user%>"
        if(window.confirm("El usuario no se eleminó ya que no es Terminal")){
            window.location.replace("../portal-admin.jsp?user="+usuario);            
        }
    </script>             
<%}}
       
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");   
         out.println("\n Message: " + e.getMessage());
  
   }      
%>

