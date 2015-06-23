<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/9/15
  Time: 11:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h3>Please login with your Credentials</h3><br>

<form method=POST action="j_security_check">

  User Name: <input type="text" name="j_username"><br>
  Password : <input type="password" name="j_password"><br>
  <input type="submit" value="Login">
  <input type="reset" value="Reset">

</form>

</body>
</html>
