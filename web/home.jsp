<html>
<head><title>   Welcome to Blog </title></head>

<dev>

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

    </form>

            <%
        }


    %>
    <h1>Welcome to BLOG</h1><br>
    <br>

    <%--<form method=POST action="new_post">--%>
        <!--<input type="hidden" action="login">-->
        <input type="button" onclick="location.href = 'new_post?actionType=newPost' " value="New Post"><br><br>
    <%--</form>--%>
    <!--<a href="new_post">New Post</a>-->
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

    <%
        //        BufferedReader in
//                = new BufferedReader(new FileReader("/home/thilanka/IdeaProjects/blog/posts/posts.json"));
//
//        ArrayList<JSONObject> contentsAsJsonObjects = new ArrayList<JSONObject>();
//        while(true)
//        {
//            String str = in.readLine();
//            if(str==null)break;
//            contentsAsJsonObjects.add(new JSONObject( str ));
//        }
//
//        for(int i=0; i<contentsAsJsonObjects.size(); i++)
//        {
//            JSONObject json = contentsAsJsonObjects.get(i);
//            String title = (String)json.get("title");
//            String content = (String)json.get("content");
//           out.println(title);
//            out.println(content);
//            out.println();
//        }

        JSONParser parser = new JSONParser();
        int count =1;

        String path= "/home/thilanka/IdeaProjects/blog/posts/"+count+".json";
        File file = new File(path);

//        out.print("<form method=POST action='viewPost' >");

        while(file.exists()){
            try {

                Object obj = parser.parse(new FileReader(path));

                JSONObject jsonObject = (JSONObject) obj;

                String title = (String) jsonObject.get("title");
                String content = (String) jsonObject.get("content");
                //JSONArray companyList = (JSONArray) jsonObject.get("Company List");

                //System.out.println(title);


                out.println(count+" . :"+title);
                out.print("<br>");
//                out.println(content);
//                out.print("<br>");
                String postId="viewPost?id="+count+"&actionType=view";
    %>
    <input type="button" onclick="location.href = '<%= postId%>' " value="View Post">
    <%

                out.print("<br><br>");


                count++;

            } catch (Exception e) {
                e.printStackTrace();
            }

            path= "/home/thilanka/IdeaProjects/blog/posts/"+count+".json";
            file = new File(path);
        }

//        out.print("<input type='hidden' >");
//    out.println("</form>");

    %>

</dev>
<br><br>

<dev>


</dev>


</html>
