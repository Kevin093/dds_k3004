<!DOCTYPE html>
<html>
  <head>
   <title>Busqueda de POIs</title>
   <link href="../../css/styles.css" rel="stylesheet" type="text/css"/>
  </head>
  <% String usern = request.getParameter("user");%>
    <script>
  function check() {
    var name = "<%= usern%>"
    var radioParadaCheck = document.getElementById("paradaRadio").checked;
    var radiolocalCheck = document.getElementById("localRadio").checked;
    var radiobancoCheck = document.getElementById("bancoRadio").checked;
    var radiocgpCheck = document.getElementById("cgpRadio").checked;  
     if(radioParadaCheck == true){
	window.location.replace("poiCreation/poiParada.jsp?user="+name);
        }
    else{
       if(radiolocalCheck == true){
	window.location.replace("poiCreation/poiLocal.jsp?user="+name);
        }
        else{
            if(radiobancoCheck == true){
	window.location.replace("poiCreation/poiBanco.jsp?user="+name);
        }
        else {
        
	window.location.replace("poiCreation/poiCGP.jsp?user="+name);
        
        }
        }
   }
   }

  </script>
<body>
    <h1>POIS</h1>
    <div>
    Crear POI
    </div>
    <div>
        <p><img src="../../others/paradaBusIco.png" width="50" height="50" alt="paradaBusIco"/>
          Parada de Colectivo:<input id="paradaRadio" type="radio" name="poisAdd" value="paradaRadio" checked="checked" /> </p>
      <p>
          <img src="../../others/localComercialIco.png" width="50" height="50" alt="localComercialIco"/>
          Local Comercial: <input id="localRadio" type="radio" name="poisAdd" value="localRadio" /> </p>
      <p>
          <img src="../../others/bancoIco.jpg" width="50" height="50" alt="bancoIco"/>
          Banco: <input id="bancoRadio" type="radio" name="poisAdd" value="bancoRadio" /> </p>
      <p>
          <img src="../../others/CGPIcono.png" width="50" height="50" alt="CGPIcono"/>
          CGP: <input id="cgpRadio" type="radio" name="poisAdd" value="cgpRadio" /> </p>
    </div> 
    <div>
      <input type="button" id="agregar" value="Agregar" autofocus="true" onclick="check()" >
    </div>
    <div>
        <form id="back" name="back"> 
        <input type="button" name="user" value="Volver" onclick="window.location='../admin/portal.jsp?user=<%= usern%>'">
        </form>
    </div>
    <div>
    <form id="logout" name="logout" action="..\..\index.jsp?nombre=${nombre1}" >
        <input type="submit" name="salir" value="Salir">
    </form>
    </div>
</body>
</html>
