<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import ="java.sql.*" %>
<%
    
    try{
        String username = request.getParameter("user");   
        String password = request.getParameter("pass");
        String typeUser = request.getParameter("type");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pois?" + "user=root&password=1234");    
        PreparedStatement pst = conn.prepareStatement("select * from users where userName=? and userPass=? and userType=?");
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3,typeUser);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
       %> 
    <script>
        var usuario = "<%= username%>"

        if(window.confirm("Bienvenido "+usuario)){
            window.location.replace("portal.jsp?user="+usuario);            
        }
    </script>
        <%         
        }        
        else{            %>
    <script>
        if(window.confirm("Error de Login, usuario o contraseña incorrectos")){
            window.location.replace("../../index.jsp");            
        }
    </script>
<% }}
       
     catch(Exception e){       
       out.println("Something went wrong !! Please try again");   
         
   }      
%>

