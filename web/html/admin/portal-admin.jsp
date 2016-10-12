<!DOCTYPE html>
<html>
  <head>
   <title>Busqueda de POIs</title>
   <link href="../../style.css" rel="stylesheet" type="text/css"/>
  </head>
 <% String usern = request.getParameter("user");%>
    <script>
  function validateUser() {
   var name = "<%= usern%>"
   var nombre = document.getElementById("nombreAU").value;
   var contrasenia = document.getElementById("contraseniaAU").value;
   var radioAdminCheck = document.getElementById("administradorAU").checked;
   var radioTerminalCheck = document.getElementById("terminalAU").checked;
   if(nombre == ""|| contrasenia == "")
    {
        window.alert("Completar todos los campos");
    }
   else{
       if(radioAdminCheck == true){
	window.location.replace("adminuser/validateCreateUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=1");
        }
        else{
            if(radioTerminalCheck == true){
	window.location.replace("adminuser/validateCreateUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=2");
        }
    }
   }
   }

   

  </script>
  <script>
  function validateModify() {
   var name = "<%= usern%>"
   var nombre = document.getElementById("nombreMU").value;
   var contrasenia = document.getElementById("contraseniaMU").value;
   var radioAdminCheck = document.getElementById("administradorMU").checked;
   var radioTerminalCheck = document.getElementById("terminalMU").checked;
   if(nombre == ""|| contrasenia == "")
    {
        window.alert("Completar todos los campos");
    }
   else{
       if(radioAdminCheck == true){
	window.location.replace("adminuser/validateModifyUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=1");
        }
        else{
            if(radioTerminalCheck == true){
	window.location.replace("adminuser/validateModifyUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=2");
        }
    }
   }
   }

   

  </script>
  <script>
  function validateDelete() {
   var name = "<%= usern%>"
   var nombre = document.getElementById("nombreDU").value;
   var radioAdminCheck = document.getElementById("administradorDU").checked;
   var radioTerminalCheck = document.getElementById("terminalDU").checked;
   if(nombre == "")
    {
        window.alert("Completar todos los campos");
    }
   else{
       if(radioAdminCheck == true){
	window.location.replace("adminuser/validateDeleteUser.jsp?user="+name+"&usuario="+nombre+"&tipo=1");
        }
        else{
            if(radioTerminalCheck == true){
	window.location.replace("adminuser/validateDeleteUser.jsp?user="+name+"&usuario="+nombre+"&tipo=2");
        }
    }
   }
   }

   

  </script>  
<body>
  <h1>Usuarios</h1>
  <h2>Bienvenido: <%= usern%></h2>

  </body>
</html>

<table border="0">
    <thead>
        <tr>
            <th>Agregar Usuario</th>
            <th>Modificar Password</th>
            <th>Eliminar Usuario</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>    
                <div>
                    Nombre<br>
                    <input type="text" id="nombreAU" placeholder="Nombre" max="25" >
                </div>
            </td>
            <td>
                <div>
                    Nombre<br>
                    <input type="text" id="nombreMU" placeholder="Nombre" max="25" >
                </div>
            </td>
            
            <td>
                <div>
                    Nombre<br>
                    <input type="text" id="nombreDU" placeholder="Nombre" max="25" >
                </div>                
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    Contraseña<br>
                    <input id="contraseniaAU" type="password" class="hidden" placeholder="Contraseña" max="25" >
                </div>
            </td>
            <td>
                <div>
                    Contraseña<br>
                    <input id="contraseniaMU" type="password" class="hidden" placeholder="Contraseña" max="25" >
                </div>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                <p>Administrador: <input id="administradorAU" type="radio" name="userAddAdminAU" value="administrador" /> </p>
                <p>Terminal <input id="terminalAU" type="radio" name="userAddTerminalAU" value="terminal" /> </p>
            </td>
            <td>
                <p>Administrador: <input id="administradorMU" type="radio" name="userAddAdminMU" value="administrador" /> </p>
                <p>Terminal <input id="terminalMU" type="radio" name="userAddTerminalMU" value="terminal" /> </p>
            </td>
            <td>
                <p>Administrador: <input id="administradorDU" type="radio" name="userAddAdminDU" value="administrador" /> </p>
                <p>Terminal <input id="terminalDU" type="radio" name="userAddTerminalDU" value="terminal" /> </p>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <input type="button" id="agregar" value="Agregar" autofocus="true" onclick="validateUser()" >
                </div>
            </td>
            <td>
                <div>
                    <input type="button" id="modificar" value="Modificar" autofocus="true" onclick="validateModify()" >
                </div>                
            </td>
            <td>
                <div>
                    <input type="button" id="eliminar" value="Eliminar" autofocus="true" onclick="validateDelete()" >
                </div>                
            </td>
        </tr>
        <tr>
            <td>
     <div>
        <form id="back" name="back"> 
        <input type="button" name="user" value="Volver" onclick="window.location='../admin/portal.jsp?user=<%= usern%>'">
        </form>
    </div>
              
            </td>
            <td>
    <div>
    <form id="logout" name="logout" action="..\..\index.jsp?nombre=${nombre1}" >
        <input type="submit" name="salir" value="Salir">
    </form>
    </div>                  
            </td>
        </tr>        
    </tbody>
</table>



