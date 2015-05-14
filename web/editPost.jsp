<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/11/15
  Time: 4:58 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <%

    String username =request.getRemoteUser();
    String userRole="Guest";

    if(request.isUserInRole("admin")) userRole="Administrator";
    else if(request.isUserInRole("user")) userRole="User";

    if(username!=null){
      out.println("Logged in as "+username+" ("+ userRole +")");
    }
    else{
      out.println(userRole+" User");
    }

    if(request.isUserInRole("admin")|| request.isUserInRole("admin")){
  %>

  <form method=POST action="logout">
    <input type="submit" name="function" value="Logout">
    <input type="submit"  name="function" value="Home">
  </form>

  <%
    }


  %>

  <title>edit Post</title>
</head>

<h3>Edit Post Content</h3>

<%
  String postTitle = (String) request.getAttribute("title");
  String postContent = (String) request.getAttribute("content");

  String postId="updatePost?id="+request.getParameter("id").toString()+"&actionType=update";
%>
<body>


<form method="POST" action="updatePost">

  Title   : <input type="text" name="title" value=" <%=postTitle%>" size="35" /><br><br>
  Content :   <br><textarea name="content" rows="25" cols="50"> <%=postContent%> </textarea>><br><br>

  <input type="hidden" name="id" value="<%= request.getParameter("id").toString()%>">
  <input type="hidden" name="actionType" value="update">
  <input type="submit" value="Update Post">

</form>

</body>
</html>
