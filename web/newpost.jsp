<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/9/15
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>New Post</title>
</head>
<body>



<!-- going to print the username-->
<%

  String username = request.getRemoteUser();
  String userRole=null;

  if(request.isUserInRole("admin")) userRole="Administrator";
  else if(request.isUserInRole("user")) userRole="User";
  out.println("Hello "+username+" ("+ userRole +")");

%>||
<!-- logout form-->
<form method=POST action="logout">
  <input type="submit" name="function" value="Logout">
  <input type="submit"  name="function" value="Home">
</form>



<h2>Add a new post here</h2>

<form method="POST" action="addPost">

  Title   : <input type="text" name="title" value="enter title here" size="35"><br><br>
  Content :   <br><textarea name="content" rows="25" cols="50"></textarea><br><br>

  <input type="hidden" name="actionType" value="newPost">
  <input type="submit"  value="Post">

  <%--<input type="button" onclick="location.href = 'addPost?actionType=newPost' " value="Post">--%>
</form>

</body>
</html>
