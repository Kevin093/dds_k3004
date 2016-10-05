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
   var sucursal = document.getElementById("sucursal").value;
   var posicion = document.getElementById("posicion").value;
   var direccion = document.getElementById("direccion").value;
   var servicios = document.getElementById("servicios").value;
   if(nombre == ""|| sucursal == "" || posicion == "" || direccion == "" || servicios == "" )
    {
        window.alert("Completar todos los campos");
    }
   else
    {
        window.location.replace("validatePoiBanco.jsp?user="+name+"&nombre="+nombre+"&sucursal="+sucursal+"&posicion="+posicion+"&direccion="+direccion+"&servicios="+servicios);

    }
    }
	

   

  </script>
<body>
  <h1>POIS</h1>
  <h2>Crear POIS</h2>
  <div>
    Crear Banco
    <div>
      Nombre<br>
      <input type="text" id="nombre" placeholder="Nombre" max="25" >
    </div>
    <div>
      Sucursal<br>
      <input type="text" id="sucursal" placeholder="Sucursal" max="25" >
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
      Servicios<br>
      <input type="text" id="servicios" placeholder="Servicios" max="25" >
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
