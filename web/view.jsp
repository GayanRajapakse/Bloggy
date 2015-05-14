<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/11/15
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.File" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="org.json.simple.parser.ParseException,java.io.FileWriter" %>
    <%@ page import="java.io.File" %>


<html>
<head>
    <title>post:<% out.println(request.getAttribute("id").toString());%></title>

</head>


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

        if(request.isUserInRole("admin")|| request.isUserInRole("admin") || request.isUserInRole("admin")|| request.isUserInRole("user")){
    %>

    <form method=POST action="logout">
        <input type="submit" name="function" value="Logout">
        <input type="submit"  name="function" value="Home">
    </form>


    <%
            out.println("------------------------------------------------------");
        }
%>

    <%
    String title = request.getAttribute("title").toString();
    String content = request.getAttribute("content").toString();
        //String allContent = request.getAttribute("allContent").toString();
        JSONParser parser = new JSONParser();
        String path= request.getServletContext().getRealPath("/")+"posts/"+request.getParameter("id")+".json";
        Object obj = null;
        try {
            obj = parser.parse(new FileReader(path));
        } catch (ParseException e) {
            e.printStackTrace();
        }


        JSONObject jsonObject = (JSONObject) obj;

        ArrayList<JSONObject> comments=null;
        int hits=0;

//        hits=(int)jsonObject.get("hits");

        if(jsonObject.containsKey("comment")){
            comments = (ArrayList<JSONObject>) jsonObject.get("comment");
        }

        if(request.getAttribute("views") != null){
            System.out.println("Views "+request.getAttribute("views").toString());
            Long views=Long.parseLong(request.getAttribute("views").toString());
            views++;

            jsonObject.replace("views",views);  // this is new for replace count
            try {

                FileWriter file = new FileWriter(path);

                file.write(jsonObject.toJSONString());

                file.flush();
                file.close();


            } catch (java.io.IOException e) {
                e.printStackTrace();
            }
        }


        out.println( "<br><h2><u>"+title+"</u></h2></br>" );


        out.println("<p>"+content+"</p>");
        //out.println(request.getAttribute("actionType"));
        String postId="editPost?id="+request.getAttribute("id").toString()+"&actionType=edit";
    %>

<input type="button" onclick="location.href = '<%=postId%>' " value="Edit This">

    <%
        out.println("<h4>Comments:<h4>");
        if(comments!=null) {
            for (int i = 0; i < comments.size(); i++) {
                JSONObject jsObj = comments.get(i);
                if (jsObj.get("approved").equals("true"))
                    out.println("<br>" + jsObj.get("comment") + "<br>");
            }
        }
    %>

<body>

<%
    out.println("<p>");
    //out.println(request.getAttribute("content").toString());
    out.println("</p>");

%>
<br>

<%


%>


<h4>Add your Comment:</h4>

<form method="get" action="commentPost">
    <textarea name="comment" rows="10" cols="30"></textarea><br>
    <input type="submit" value="OK">
    <input type="hidden" name="id" value=<%=request.getAttribute("id").toString()%> >
</form>

<br>

<br><input type="button" onclick="location.href = 'home.jsp' " value="Back to HOME">
<br>

</body>
</html>
