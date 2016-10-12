<%-- 
    Document   : test
    Created on : 11/10/2016, 22:07:30
    Author     : kevin
--%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%
String fechaDMY = request.getParameter("fecha");

java.text.SimpleDateFormat dmy = new java.text.SimpleDateFormat("dd-MM-yyyy"); 
java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

Date date = null;
try {
    date = (Date) dmy.parse(fechaDMY);
} catch (ParseException e) {
    e.printStackTrace();
} 

String fecha= ymd.format(date);%>

<%= fecha%>