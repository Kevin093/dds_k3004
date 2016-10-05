
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
  <body>
 <h1>Sistema de POIs 2.0</h1>
        <h2>Login</h2><div>

   <form id="login" name="login" action="html\terminal\portal.html" >
            
            <p>Usuario: <input type="text" id="user" name="user size="20" required/></p>
            <p>Contraseña: <input id="Passwd-hidden" type="password" class="hidden" name="password" size="20" required /></p>         	
          	
          
    <div>
      <table border="0">
     <tbody>
        <tr>
    <td>
         <input type="submit" name="continue" value="Continuar" onclick="checker(password,user);">
        </form>  
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

