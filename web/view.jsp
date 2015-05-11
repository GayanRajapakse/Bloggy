<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/11/15
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.File" %>


<html>
<head>
    <title>post:<% out.println(request.getAttribute("id").toString());%></title>

</head>


<h2><%

    String title = request.getAttribute("title").toString();
    String content = request.getAttribute("content").toString();
    out.println( "<br>"+title+"</br>" );
    out.println("<p>"+content+"</p>");
//    out.println(request.getAttribute("actionType"));
%>
</h2>
<body>

<%
    out.println("<p>");
    //out.println(request.getAttribute("content").toString());
    out.println("</p>");

%>
<br>

<%

    String postId="editPost?id="+request.getAttribute("id").toString()+"&actionType=edit";
%>
<input type="button" onclick="location.href = '<%=postId%>' " value="Edit This">

<h3>Comments:</h3>

<form method="get" action="newComment">
    <textarea name="comment" rows="10" cols="30"></textarea><br>
    <input type="submit" value="OK">
</form>

<br>

</body>
</html>
