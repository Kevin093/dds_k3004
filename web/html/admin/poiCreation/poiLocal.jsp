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
   var horarios = document.getElementById("horarios").value;
   var posicion = document.getElementById("posicion").value;
   var direccion = document.getElementById("direccion").value;
   var rubro = document.getElementById("rubro").value;
   if(nombre == ""|| horarios == "" || posicion == "" || direccion == "" || rubro == "")
    {
        window.alert("Completar todos los campos");
    }
   else
    {
      window.location.replace("validatePoiLocal.jsp?user="+name+"&nombre="+nombre+"&horarios="+horarios+"&posicion="+posicion+"&direccion="+direccion+"&rubro="+rubro);

            }
    }
	
  
   

  </script>
<body>
  <h1>POIS</h1>
  <h2>Crear POIS</h2>
  <div>
    Crear Local Comercial
    <div>
      Nombre<br>
      <input type="text" id="nombre" placeholder="Nombre" max="25" >
    </div>
    <div>
      Horarios<br>
      <input type="text" id="horarios" placeholder="Horarios" max="25" >
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
      Rubro<br>
      <input type="text" id="rubro" placeholder="Rubro" max="25" >
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
