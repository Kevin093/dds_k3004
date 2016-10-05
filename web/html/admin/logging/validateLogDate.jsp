<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*" %>

<% java.util.Date dt = new java.util.Date();

java.text.SimpleDateFormat sdf = 
     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String currentTime = sdf.format(dt);
%>
<% String usern = request.getParameter("user");%>
<% String fechaDesde = request.getParameter("fechaDesde");%>
<% String fechaHasta = request.getParameter("fechaHasta");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="../../../css/styles.css" rel="stylesheet" type="text/css"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda de POIs</title>
    </head>
    
   <img src="../../../others/poiImage.jpg" width="644" height="287" alt="poiImage"/>

    <body>
        <h1>Logs de busquedas</h1>
    <table border="0">
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Fecha</th>
                <th></th>
              
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" id="usuario" name="usuario" placeholder="Usuario" max="25"></td>
                <td><input type="text" id="fechaDesde" name="fechaDesde"placeholder="Desde" max="25"></td>
                <td><input type="text" id="fechaHasta" name="fechaHasta" placeholder="Hasta" max="25"></td>
                <td><input type="button" id="find" value="Buscar" name="find" onclick="window.location='paginaLogs.jsp?user=<%= usern%>'" /></td>
                <td><input type="button" name="back" value="Volver" onclick="window.location='../portal.jsp?user=<%= usern%>'"></td>
                <td><input type="button" name="logs" value="Salir" onclick="window.location='../../../index.jsp'"></td>
            </tr>
        </tbody>
    </table>

<sql:query var="logDate" dataSource="jdbc/poisDBMySQL">
select Fecha, Usuario, Campo1, Campo2, tipopoi.TipoPOI, CantidadPOIs from (logs,tipopoi) where logs.TipoPOI = tipopoi.idtipopoi AND DATE(Fecha) BETWEEN '<%=fechaDesde %>' AND '<%=fechaHasta %>'; 
</sql:query>
    
<table border="0">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${logDate.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${logDate.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>

  
    </body>
</html>  
  