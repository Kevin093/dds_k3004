<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
   	<link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Sistema de POIs</title
    </head>
    <% String errorM = request.getParameter("estado");
    if (errorM.equals("Error")) {%>

    <script>
        window.alert("Error de Login, usuario o contraseña incorrectos");
    </script>
    <% }%>
    <script>
      function checkUser(){ 
          var adminCheck = document.getElementById("checkAdmin").checked;
          var adminCheckValue = document.getElementById("checkAdmin").value;
          var userName = document.getElementById("user").value;
          var passUser = document.getElementById("pass").value;
      if (userName == "" || passUser == "" || userName == "" &&  passUser == "" ){
             window.alert("Debe completar los campos");}
        else{
     if(adminCheck == true){
            window.location.replace("html/admin/validateAdmin.jsp?user="+userName+"&pass="+passUser+"&type=1");
            
        }
       else
    {
      window.location.replace("html/terminal/validateTerminal.jsp?user="+userName+"&pass="+passUser+"&type=2");
    }
}}
    </script>
        <img src="others/poiImage.jpg" width="644" height="287" alt="poiImage"/>
  <body>

 <h1>Sistema de POIs 2.0</h1>
        <h2>Login</h2><div>
           
            <p>Usuario:    <input type="text" id="user" name="user" size="20" /></p>
            <p>Contraseña: <input id="pass" type="password" class="hidden" name="password" size="20"  /></p>         	
          	 <div>
            <p>Administrador:  <input id="checkAdmin" type="checkbox" name="Administrador" value="administrador" /> </p>
                 </div>
          
    <div>
      <table border="0">
     <tbody>
        <tr>
    <td>    
       
         <input type="button" id="continue" value="Continuar" autofocus="true" onclick="checkUser()" >
        
    </td>
    <td>     
        <br>

 </td>
        </tr>
    </tbody>
</table>
    </div>
  </div>
   </body>
</html>

