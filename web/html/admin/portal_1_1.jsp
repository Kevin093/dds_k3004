<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
  <head>
  
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
      <title>Busqueda de POIs</title>
  
  </head>
  <% String variable = request.getParameter("id"); %>
  <% String variable2 = request.getParameter("id2"); %>
   <script>
  function check() {
   var buscar = document.getElementById("nombre1").value;
   var buscar2 = document.getElementById("nombreComienzaCon").value;

  </script>
<body>
    <h1>POIS</h1>

      <% String nameF1 = request.getParameter("userId"); %>   

<p>Me han pasado <%= variable %> y <%= variable2 %></p>
    
    



<sql:query var="poi" dataSource="jdbc/poisDBMySQL">
    SELECT direccion as Direccion,Nombre nombre,coordenada,nombreLinea FROM poiparadacolectivo,lineascolectivos where numeroDeLinea = idlineasColectivos AND (nombreLinea = '<%= request.getParameter("id")%>' OR nombreLinea = '<%= request.getParameter("id2")%>') GROUP BY nombreLinea
</sql:query>
        
<table border="0">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${poi.columnNames}">
            <th><c:out value="${columnName}"/></th>
            </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${poi.rowsByIndex}">
        <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
    <table border="0">
       <tbody>
        <tr>
            <td><div>
	<form id="login" name="back" action="..\admin\portal.jsp" >
      <input type="submit" name="continue" value="Volver">
	  </form>
	  </div></td>
            <td><div>
	  		<form id="login" name="login" action="..\..\index.jsp" >
      <input type="submit" name="continue" value="Salir">
	  </form>
    </div></td>
        </tr>
    </tbody>
</table>	
    
      </body>
</html>


