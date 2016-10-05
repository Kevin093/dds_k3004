<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <link href="../../style.css" rel="stylesheet" type="text/css"/>
        <title>Busqueda de POIs</title>
    </head>
    <% String usern = request.getParameter("user");%>

    <script>
      function params(){ 
          var name = "<%= usern%>"
          var paradaCheck = document.getElementById("checkParada").checked;
          var localCheck = document.getElementById("checkLocal").checked;
          var bancoCheck = document.getElementById("checkBanco").checked;
          var cgpCheck = document.getElementById("checkCGP").checked;
          var nombreB1 = document.getElementById("nombre1").value;
          var nombreB2 = document.getElementById("nombre2").value;
        if(nombreB1 == "" && nombreB2 == "")
        {
            window.alert("Debe completar los parámetros de búsqueda");
        }
        else{
        if(paradaCheck == true && localCheck == false && bancoCheck == false && cgpCheck == false){
            window.location.replace("\portal_1.jsp?user="+name+"&id="+nombreB1+"&id2="+nombreB2+"&type="+'1');}
        else
        {
        if(localCheck == true && paradaCheck == false && bancoCheck == false && cgpCheck == false){
            window.location.replace("\portal_1.jsp?user="+name+"&id="+nombreB1+"&id2="+nombreB2+"&type="+'2');}
        else
        {
        if(bancoCheck == true && paradaCheck == false && localCheck == false && cgpCheck == false){
            window.location.replace("\portal_1.jsp?user="+name+"&id="+nombreB1+"&id2="+nombreB2+"&type="+'3');}
        else
        {
        if(cgpCheck == true && paradaCheck == false && localCheck == false && bancoCheck == false){
            window.location.replace("\portal_1.jsp?user="+name+"&id="+nombreB1+"&id2="+nombreB2+"&type="+'4');}
        else
        {
        if (paradaCheck == false && localCheck == false && bancoCheck == false && cgpCheck == false)
        {
            window.alert("Debe seleccionar algún tipo POI");
        }
        else
        {
            window.alert("Debe seleccionar un único tipo POI");
     }}}}}}
    }
    </script>
    <p>Usuario: <%=usern%> </p>
    <img src="../../others/poiImage.jpg" width="644" height="287" alt="poiImage"/>



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
             <p><img src="../../others/paradaBusIco.png" width="50" height="50" alt="paradaBusIco" align="absmiddle"/>Parada de Colectivo:  <input id="checkParada" type="checkbox" name="Parada" value="parada"/> </p>
            
         </div>
    </td>
    <td>
         <div>
             <p><img src="../../others/localComercialIco.png" width="50" height="50" alt="localComercialIco" align="absmiddle"/>Local Comercial:  <input id="checkLocal" type="checkbox" name="Local" value="local"/> </p>
            
         </div>
    </td>
    <td>
         <div>
             <p><img src="../../others/bancoIco.jpg" width="50" height="50" alt="bancoIco" align="absmiddle"/> Banco:  <input id="checkBanco" type="checkbox" name="Banco" value="banco"/> </p>
            
         </div>
    </td>
    <td>
         <div>
             <p><img src="../../others/CGPIcono.png" width="50" height="50" alt="CGPIcono" align="absmiddle"/> CGP:  <input id="checkCGP" type="checkbox" name="CGP" value="cgp"/> </p>
            
         </div>
    </td>
    
            </tr>
    </tbody>
</table>

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
        <form id="find" name="findPoi"> 
        <input type="button" id="buscar" value="Buscar" autofocus="true" onclick="params()" >
        </form>
    </div>
            </td>
          
            <td> 
    <div>
        <form id="logout" name="logout"> 
        <input type="button" name="logs" value="Salir" onclick="window.location='../../index.jsp'">
        </form> 
    </div>
            </td>
            </tr>
    </tbody>
</table>
    </div>
</body>
</html>


