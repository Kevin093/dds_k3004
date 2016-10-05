<!DOCTYPE html>
<html>
  <head>
   <title>Busqueda de POIs</title>
   <link href="../../css/styles.css" rel="stylesheet" type="text/css"/>
  </head>
    <script>
  function check() {
   var valor = document.getElementById("direccion").value;

     if(valor == ""){
		window.alert("Error");
		}
	else{
	if(valor !== ""){
	window.alert("Se Agrego");}
	else{}
	
   }
   }

  </script>
<body>
  <h1>POIS</h1>

  <div>
    Crear POI
    <div>
      Nombre<br>
      <input type="text" id="nombre1" placeholder="Nombre" max="25" >
    </div>
    <div>
      Tipo<br>
      <input type="text" id="tipo" placeholder="tipo" max="25" >
    </div>
	    <div>
      Posicion<br>
      <input type="text" id="posicion" placeholder="posicion" max="25" >
    </div>
    <div>
     ID<br>
      <input type="text" id="id" placeholder="id" max="25" >
    </div>
    <div>
	   <div>
      Direcion<br>
      <input type="text" id="direccion" placeholder="direccion" max="25" >
    </div>
    <div>
      <input type="button" id="agregar" value="Agregar" autofocus="true" onclick="check()" >
	  </div>
	  <div>
    <form id="logout" name="logout" action="..\..\index.jsp" >
        <input type="submit" name="logout" value="Salir" >
    </form>
    </div>
  </div>
  <div>
    <table>
      <tr>
        <th></th>
        <th></th>
      </tr>
      <tr>
   <td>
   
   </td>
      </tr>
      <tr>

      </tr>
      <tr>
 
      </tr>
    </table>
  </body>
</html>
