<%--
  Created by IntelliJ IDEA.
  User: thilanka
  Date: 5/14/15
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.File,
    org.json.simple.JSONArray,
    org.json.simple.JSONObject,
    java.io.FileReader,
    java.io.FileNotFoundException,
    java.io.IOException,
    java.util.Iterator,
    org.json.simple.parser.JSONParser,
    org.json.simple.parser.ParseException,
    java.io.BufferedReader,java.util.ArrayList" %>
<html>
<head>
    <title>Sit statics</title>
</head>
<body>

<h1>Site Statistics</h1>
<%

  JSONParser parser = new JSONParser();
  int count =new File("/home/thilanka/IdeaProjects/blog/posts").listFiles().length;
  int recentPost=1;

  String path= "/home/thilanka/IdeaProjects/blog/posts/"+count+".json";
  File file = new File(path);

  out.print("Title ------------->Total Hits on page<br><br>");

  while(file.exists()){
    try {

      Object obj = parser.parse(new FileReader(path));

      JSONObject jsonObject = (JSONObject) obj;

      String title = (String) jsonObject.get("title");
//      String content = (String) jsonObject.get("content");
      long viewCount = (Long) jsonObject.get("views");
      //JSONArray companyList = (JSONArray) jsonObject.get("Company List");

      //System.out.println(title);


      out.println(title);
      out.print("---->" + viewCount);
      out.print("<br>");
//                out.println(content);
//                out.print("<br>");

      count--;recentPost++;

    } catch (Exception e) {
      e.printStackTrace();
    }

    path= "/home/thilanka/IdeaProjects/blog/posts/"+count+".json";
    file = new File(path);
  }


%>
<br><br>
<input type="submit" value="Back to Home" onclick="window.location='/home.jsp';" />

</body>
</html>
