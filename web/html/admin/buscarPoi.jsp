<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*" %>
<% java.util.Date dt = new java.util.Date();

java.text.SimpleDateFormat sdf = 
     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String currentTime = sdf.format(dt);
%>
<html>
  <head>
  
      <link href="../../css/styles.css" rel="stylesheet" type="text/css"/>
      <title>Busqueda de POIs</title>
  
  </head>
  <% int tipoPoi = Integer.parseInt(request.getParameter("type")); 
  String usern = request.getParameter("user");
  String id = request.getParameter("id");
  String id2 = request.getParameter("id2");
  String type = request.getParameter("type");
  int test;
  %>
<h1>POIS</h1>
<% switch(tipoPoi) { 
    case 1:%>
    <img src="../../others/colectivo.png" width="511" height="236" alt="colectivo"/>
    <h2>Paradas de colectivos</h2>
<%-- Bsuca por linea de colectivo --%> 
<sql:query var="poi" dataSource="jdbc/poisDBMySQL">
    SELECT Direccion,Nombre,Coordenada,Linea FROM poiparadacolectivo,lineascolectivos where numeroLinea = idlineasColectivos AND ((Linea LIKE '%<%= request.getParameter("id")%>%' AND Nombre LIKE '%<%= request.getParameter("id2")%>%')OR (Linea LIKE '%<%= request.getParameter("id2")%>%' AND Nombre LIKE '%<%= request.getParameter("id")%>%') OR (Linea LIKE '%<%= request.getParameter("id2")%>%' AND Direccion LIKE '%<%= request.getParameter("id")%>%') OR (Linea LIKE '%<%= request.getParameter("id")%>%' AND Direccion LIKE '%<%= request.getParameter("id2")%>%')OR (Nombre LIKE '%<%= request.getParameter("id2")%>%' AND Direccion LIKE '%<%= request.getParameter("id")%>%') OR (Nombre LIKE '%<%= request.getParameter("id")%>%' AND Direccion LIKE '%<%= request.getParameter("id2")%>%') ) 
</sql:query>
<c:set var="count" value="0" scope="page" />
<table border="0">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${poi.columnNames}">
            <th><c:out value="${columnName}"/></th>
        </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${poi.rowsByIndex}">
        <c:set var="count" value="${count + 1}" scope="page"/>
        <tr>
            <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach> 
</table>
<%-- Agrega busqueda en el Log --%>    
<sql:update var="log" dataSource="jdbc/poisDBMySQL">
    INSERT INTO logs (Fecha, Usuario, Campo1, Campo2, TipoPOI, CantidadPOIs)
    VALUES ('<%=currentTime%>','<%= usern%>','<%= id%>','<%= id2%>','<%= type%>','${count}')
</sql:update>
<%break;
case 2: %>
<img src="../../others/local.png" width="360" height="240" alt="local"/>

    <h2>Locales comerciales</h2>
<sql:query var="poi" dataSource="jdbc/poisDBMySQL">
    SELECT Direccion, Nombre, Coordenada,Rubro, Horarios FROM poilocal where (Nombre LIKE '%<%= request.getParameter("id")%>%' AND Rubro = '<%= request.getParameter("id2")%>') OR (Nombre LIKE '%<%= request.getParameter("id2")%>%' AND Rubro = '<%= request.getParameter("id")%>') 
</sql:query>
<c:set var="count" value="0" scope="page" />
<table border="0">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${poi.columnNames}">
            <th><c:out value="${columnName}"/></th>
            </c:forEach>
            
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${poi.rowsByIndex}">
       <c:set var="count" value="${count + 1}" scope="page"/>        
        <tr>
            <c:forEach var="column" items="${row}">
                
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach> 
</table>
<%-- Agrega busqueda en el Log --%>    
<sql:update var="log" dataSource="jdbc/poisDBMySQL">
    INSERT INTO logs (Fecha, Usuario, Campo1, Campo2, TipoPOI, CantidadPOIs)
    VALUES ('<%=currentTime%>','<%= usern%>','<%= id%>','<%= id2%>','<%= type%>','${count}')
</sql:update>
<%break;
case 3: %>
<img src="../../others/banco.jpg" width="458" height="240" alt="banco"/>

    <h2>Bancos</h2>
<sql:query var="poi" dataSource="jdbc/poisDBMySQL">
select Nombre,Sucursal,Direccion,Coordenada,Servicios from poibanco where (Nombre LIKE '%<%= request.getParameter("id")%>%' AND Sucursal LIKE '%<%= request.getParameter("id2")%>%') OR (Nombre LIKE '%<%= request.getParameter("id2")%>%' AND Sucursal LIKE '%<%= request.getParameter("id")%>%')
</sql:query>
<c:set var="count" value="0" scope="page" />
<table border="0">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${poi.columnNames}">
            <th><c:out value="${columnName}"/></th>
            </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${poi.rowsByIndex}">
       <c:set var="count" value="${count + 1}" scope="page"/>
        <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach> 
</table>
<%-- Agrega busqueda en el Log --%>    
<sql:update var="log" dataSource="jdbc/poisDBMySQL">
    INSERT INTO logs (Fecha, Usuario, Campo1, Campo2, TipoPOI, CantidadPOIs)
    VALUES ('<%=currentTime%>','<%= usern%>','<%= id%>','<%= id2%>','<%= type%>','${count}')
</sql:update>
<%break;
    default:%>
    <img src="../../others/CGP.jpg" width="500" height="240" alt="CGP"/>

    <h2>CGPs</h2>
<sql:query var="poi" dataSource="jdbc/poisDBMySQL">
select Nombre,Comuna,Direccion,Coordenada from poicgp where (Nombre LIKE '%<%= request.getParameter("id")%>%' AND Comuna LIKE '%<%= request.getParameter("id2")%>%') OR (Nombre LIKE '%<%= request.getParameter("id2")%>%' AND Comuna LIKE '%<%= request.getParameter("id")%>%')
</sql:query>
<c:set var="count" value="0" scope="page" />
<table border="0">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${poi.columnNames}">
            <th><c:out value="${columnName}"/></th>
            </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${poi.rowsByIndex}">
       <c:set var="count" value="${count + 1}" scope="page"/>
        <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach> 
</table>
<%-- Agrega busqueda en el Log --%>    
<sql:update var="log" dataSource="jdbc/poisDBMySQL">
    INSERT INTO logs (Fecha, Usuario, Campo1, Campo2, TipoPOI, CantidadPOIs)
    VALUES ('<%=currentTime%>','<%= usern%>','<%= id%>','<%= id2%>','<%= type%>','${count}')
</sql:update>
<%} %>
<table border="0">
       <tbody>
        <tr>
        <td><div>
            <form id="back" name="back"> 
                <input type="button" name="user" value="Volver" onclick="window.location='../admin/portal.jsp?user=<%= usern%>'">
           </form>
	</div></td>
        <td><div>
            <form id="logOut" name="login" action="..\..\index.jsp" >
                <input type="submit" name="continue" value="Salir">
            </form>
        </div></td>
        </tr>
    </tbody>
</table>	
    
      
</html>


