<!DOCTYPE html>
<html>
  <head>
   <title>Busqueda de POIs</title>
   <link href="../../../css/styles.css" rel="stylesheet" type="text/css"/>
  </head>
 <% String usern = request.getParameter("user");%>
    <script>
  function validatePoi() {
   var name = "<%= usern%>"
   var nombre = document.getElementById("nombre").value;
   var numeroLinea = document.getElementById("numeroLinea").value;
   var posicion = document.getElementById("posicion").value;
   var direccion = document.getElementById("direccion").value;
   if(nombre == ""|| numeroLinea == "" || posicion == "" || direccion == "" )
    {
        window.alert("Completar todos los campos");
    }
   else
    {
    if (isNaN(numeroLinea)){
         window.alert("El numero de linea debe ser un numero clave");       
            }
            else
            {
        window.location.replace("validatePoiParada.jsp?user="+name+"&nombre="+nombre+"&numLin="+numeroLinea+"&posicion="+posicion+"&direccion="+direccion);

            }
    }
	
   }
   

  </script>
<body>
  <h1>POIS</h1>
  <h2>Crear POIS</h2>
  <div>
    Crear Parada de Colectivo
    <div>
      Nombre<br>
      <input type="text" id="nombre" placeholder="Nombre" max="25" >
    </div>
    <div>
      Numero de linea<br>
      <input type="text" id="numeroLinea" placeholder="Numero de linea" max="25" >
    </div>
	    <div>
      Coordenada<br>
      <input type="text" id="posicion" placeholder="Coordenada" max="25" >
    </div>
      <div>
      Direcion<br>
      <input type="text" id="direccion" placeholder="Direccion" max="25" >
    </div>
    <div>
      <input type="button" id="agregar" value="Agregar" autofocus="true" onclick="validatePoi()" >
	  </div>
	  <div>
        <form id="back" name="back"> 
        <input type="button" name="user" value="Volver" onclick="window.location='../crearPoi.jsp?user=<%= usern%>'">
        </form>
    </div>
  
 <div>

    <form id="login" name="login" action="..\..\..\index.jsp" >
      <input type="submit" name="continue" value="Salir" >
    </form>
 </div>
    </div>
  </body>
</html>
