<html>
<head><title>Admin Area </title></head>

<dev>
  <h1>Welcome to Approve comments</h1>
  <br><br>

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
  <%@ page import="java.util.Arrays" %>

  <form method=GET action="approveComment">
    <%

      String path= request.getServletContext().getRealPath("/")+"posts/";

      File folder = new File(path);
      File[] listOfFiles = folder.listFiles();
    Arrays.sort(listOfFiles);
      for(int k=0;k<listOfFiles.length;k++){
        System.out.println(listOfFiles[k]);
      }

      JSONParser parser = new JSONParser();

      for (int i = 1; i <= listOfFiles.length; i++) {
        if (listOfFiles[i-1].isFile()) {
          try {
            String fileName = listOfFiles[i-1].getName();
            //System.out.println("filename "+fileName);

            Object obj = parser.parse(new FileReader(path+fileName));
            JSONObject jsonObject = (JSONObject) obj;
            String title = (String) jsonObject.get("title");
            String content = (String) jsonObject.get("content");

            ArrayList<JSONObject> comments = (ArrayList<JSONObject>) jsonObject.get("comment");
            int count = 0;
            if(comments.size() > 0){
              out.println("<br>" + title + "<br>");
              out.println("<br>" + content + "<br>");

              for(JSONObject com : comments) {
                //System.out.println("working");
                Object app = com.get("approved");
                if(app != null)
                  if (((String)app).equals("false")) {
                    //System.out.println("approved--");
                    out.println("<br>" + com.get("comment") + "<br>");

    %>
    <input type="checkbox" name=<%=i+"@"+count%> value="true">Approve<BR>
    <%

                  }
                count++;
              }
            }
          }catch (Exception e) {
            e.printStackTrace();
          }
        }
      }

    %>
    <br>
    <input type="submit" value="Proceed"/>
    <br>

  </form>
  <br><input type="button" onclick="location.href = 'home.jsp' " value="HOME"><br>
</html>