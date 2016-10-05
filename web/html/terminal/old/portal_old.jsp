<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <link href="../../style.css" rel="stylesheet" type="text/css"/>
        <title>Busqueda de POIs</title>
    </head>
      <script>
  function check() {
   var buscar = document.getElementById("nombre1").value;
   var buscar2 = document.getElementById("nombreComienzaCon").value;
   }
  </script>
     <script>
      function params(){ 
          var paradaCheck = document.getElementById("checkParada").checked;
     if(paradaCheck == true){
            var nombreB1 = document.getElementById("nombre1").value;
      var nombreB2 = document.getElementById("nombre2").value;
      window.location.replace("\portal_1.jsp?id="+nombreB1+"&id2="+nombreB2+"&type="+'1');}
    else
    {
        var nombreB1 = document.getElementById("nombre1").value;
      var nombreB2 = document.getElementById("nombre2").value;
      window.location.replace("\portal_1.jsp?id="+nombreB1+"&id2="+nombreB2+"&type="+'2');}
    }
    </script>
          
<body>
    <h1>Busqueda de POIs</h1>
    <div>
         Criterio de b&uacute;squeda
         
        <div>
            <br>
      Valores de b&uacute;squeda
      <br>      <br>

      <input type="text" id="nombre1" name="nombre1" placeholder="Nombre" max="25">
    </div>
    <div>
      <br>
      <input type="text" id="nombre2" placeholder="Nombre" max="25">
    </div>
         <div><br>
             <p>Parada de Colectivo:  <input id="checkParada" type="checkbox" name="Parada" value="parada"/> </p>
            
         </div>
   <table border="0">
    <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
    <div>
        
	</form>
    </div>
            </td>
            <td>
    <div>
              <!--  <form id="login" name="login" action="portal_1.jsp" >
        <input type="submit" id="buscarAmigos" value="Buscar" autofocus="true">
       <input type="button" id="buscarAmigos" value="Buscar" autofocus="true" onclick="params()"> -->
            <input type="button" id="buscar" value="Buscar" autofocus="true" onclick="params()" >
    </div>
            </td>
            <td> 
    <div>
           <br>  
        <form id="logout" name="logout" action="..\..\index.jsp?nombre=${nombre1}" >
            <input type="submit" name="salir" value="Salir">
	</form>
    </div>
            </td>
        </tr>
    </tbody>
</table>

  </div>
  </body>
</html>


