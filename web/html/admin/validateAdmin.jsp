<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import ="java.sql.*" %>
<%
    
    try{
        String username = request.getParameter("user");   
        String password = request.getParameter("pass");
        String typeUser = request.getParameter("type");
        out.println(username);
        out.println(password);
        out.println(typeUser);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pois?" + "user=root&password=1234");    
        PreparedStatement pst = conn.prepareStatement("select * from users where userName=? and userPass=? and userType=?");
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3,typeUser);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){           
        response.sendRedirect("portal.jsp?user="+username); 

        }        
        else{
        response.sendRedirect("../../index.jsp");
        }
       
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>

