<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Sistema de POIs</title>
    </head>
<body>
<h1>Bienvenido al sistema de POIs </h1>
 <form id="login" name="login" action="loginAdmin.jsp" >
 <input type="submit" name="continue" value="Administrador">
 </form>
  <form id="login" name="login" action="loginTerminal.jsp" >
 <input type="submit" name="continue" value="Terminal">
 </form>
<a href="logout.jsp" >Haz clic para salir</a>

</body>
</html>