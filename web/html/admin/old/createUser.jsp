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
   var nombre = document.getElementById("nombre").value;
   var contrasenia = document.getElementById("contrasenia").value;
   var radioAdminCheck = document.getElementById("administrador").checked;
   var radioTerminalCheck = document.getElementById("terminal").checked;
   if(nombre == ""|| contrasenia == "")
    {
        window.alert("Completar todos los campos");
    }
   else{
       if(radioAdminCheck == true){
	window.location.replace("createUser/validateCreateUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=1");
        }
        else{
            if(radioTerminalCheck == true){
	window.location.replace("createUser/validateCreateUser.jsp?user="+name+"&usuario="+nombre+"&contraseña="+contrasenia+"&tipo=2");
        }
    }
   }
   }

   

  </script>
<body>
  <h1>Usuarios</h1>
  <h2>Crear Usuario</h2>
  <div>
    <div>
      Nombre<br>
      <input type="text" id="nombre" placeholder="Nombre" max="25" >
    </div>
    <div>
      Contraseña<br>
      <input id="contrasenia" type="password" class="hidden" placeholder="Contraseña" max="25" >
    </div>
    <p>
        Administrador: <input id="administrador" type="radio" name="userAddAdmin" value="administrador" /> </p>
    <p>
        Terminal <input id="terminal" type="radio" name="userAddTerminal" value="terminal" /> </p>

    <div>
      <input type="button" id="agregar" value="Agregar" autofocus="true" onclick="validateUser()" >
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
