
<html>
    <head>
   	<link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Sistema de POIs</title
    </head>
    <script>
    function checker(String password,String user)
        {
            var userK = "Kevin";
            var passK = "1234";
          if (passK == password && userK == user>) {
                document.login.action="login.jsp" ;
                document.login.submit();
            } else {
                alert("Usuario incorrecto");
                document.login.password.focus(); 
                return false;
            }
        }

</script>
    <script>
      function params(){ 
          var adminCheck = document.getElementById("checkAdmin").checked;
          var adminCheckValue = document.getElementById("checkAdmin").value;
     if(adminCheck == true){
            var userName = document.getElementById("user").value;
      var passUser = document.getElementById("pass").value;
      window.location.replace("\portal_1.jsp?id="+userName+"&id2="+passUser+"&type="+);}
    else
    {
        var nombreB1 = document.getElementById("nombre1").value;
      var nombreB2 = document.getElementById("nombre2").value;
      window.location.replace("\portal_1.jsp?id="+nombreB1+"&id2="+nombreB2+"&type="+'local');}
    }
    </script>

  <body>
 <h1>Sistema de POIs 2.0</h1>
        <h2>Login</h2><div>

  <%-- <form id="login" name="login" action="html\admin\portal.jsp" > --%>
            
            <p>Usuario: <input type="text" id="user" name="user" size="20" required/></p>
            <p>Contraseña: <input id="pass" type="password" class="hidden" name="password" size="20" required /></p>         	
             
        <div>
             <p>Administrador:  <input id="checkAdmin" type="checkbox" name="Administrador" value="administrador" required/> </p>
            
         </div>
      
          
    <div>
      <table border="0">
     <tbody>
        <tr>
    <td>
         <input type="button" id="continue" name="continue" value="Continuar" autofocus="true" onclick="params()">
   <%--     </form> --%> 
    </td> 
    <td>     
        <br>
          <form name="cancel" action="index.jsp" method="get">
            <input type="submit" name="cancelar" value="Cancelar" >
        </form>   
 </td>
        </tr>
    </tbody>
</table>
    </div>
  </div>
   </body>
</html>

