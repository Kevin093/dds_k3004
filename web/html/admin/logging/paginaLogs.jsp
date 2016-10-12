<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="../../../css/styles.css" rel="stylesheet" type="text/css"/>
    <head>
        <title>Busqueda de POIs</title>
    </head>
    <% String usern = request.getParameter("user");%>
  <script>
  function findLogs() {
   var name = "<%= usern%>"
   var username = document.getElementById("usuario").value;
   var dateFrom = document.getElementById("fechaDesde").value;
   var dateTo = document.getElementById("fechaHasta").value;
   if(username == "" && dateFrom == "" && dateTo == "")
    {
        window.alert("Completar algun campo");
    }
   else
    {
        if(username != "" && dateFrom == "" && dateTo == "")
    {
        window.location.replace("validateLogUser.jsp?nombre="+username+"&user="+name);

    }
   else
    {
    if(username == "" && dateFrom != "" && dateTo != ""){    
    window.location.replace("validateLogDate.jsp?fechaDesde="+dateFrom+"&fechaHasta="+dateTo+"&user="+name);
    }
            }
    }}
  </script>

   <img src="../../../others/poiImage.jpg" width="644" height="287" alt="poiImage"/>

   
   
   
   
    <body>
        <h1>Logs de busquedas</h1>
   
    <table border="0">
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Fecha (dd-mm-aaaa)</th>
                <th></th>
                
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" id="usuario" name="usuario" placeholder="Usuario" max="25"></td>
                <td><input type="text" id="fechaDesde" name="fechaDesde"placeholder="Desde" max="25"></td>
                <td><input type="text" id="fechaHasta" name="fechaHasta" placeholder="Hasta" max="25"></td>
                <td><input type="button" id="find" value="Buscar" name="find" onclick="findLogs()" /></td>
                <td><input type="button" name="back" value="Volver" onclick="window.location='../portal.jsp?user=<%= usern%>'"></td>
                <td><input type="button" name="logs" value="Salir" onclick="window.location='../../../index.jsp'"></td>
            </tr>
        </tbody>
    </table>
 </body>

</html>
