    <!-- Realiza el query de búsqueda en los logs de administración de usuario por usuario  -->
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
<% String nombre = request.getParameter("nombre");%>
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
        <h1>Logs de administracion de usuarios</h1>
   
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
                <td><input type="button" id="find" value="Buscar" name="find" onclick="window.location='paginaLogsUserAdmin.jsp?user=<%= usern%>'" /></td>
                <td><input type="button" name="back" value="Volver" onclick="window.location='../portal.jsp?user=<%= usern%>'"></td>
                <td><input type="button" name="logs" value="Salir" onclick="window.location='../../../index.jsp'"></td>
            </tr>
        </tbody>
    </table>

<sql:query var="logUser" dataSource="jdbc/poisDBMySQL">
    select Fecha, Usuario, NombreUsuario, tipouser.tipoUser, tipoAdministracion from logsadminuser, tipouser, tipoadminuser where TipoUsuario = tipouser.idtipouser and idtipoadminuser = TipoModificacion and Usuario = '<%=nombre %>' order by Fecha desc


</sql:query>
    
<table border="0">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${logUser.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${logUser.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>

    
   </body>

</html>