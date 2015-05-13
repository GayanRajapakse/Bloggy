import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by mora on 11/05/2015.
 */
@WebServlet(name = "commentServlet")
public class commentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int postId=Integer.parseInt(request.getParameter("id"));

        JSONParser parser = new JSONParser();

        String path= "/home/thilanka/IdeaProjects/blog/posts/"+postId+".json";
        File file = new File(path);

        JSONObject jsonObject = null;
        String newComment = (String)request.getParameter("comment");

        if(file.exists()) {
            try {

                Object obj = parser.parse(new FileReader(path));

                jsonObject = (JSONObject) obj;


               //ArrayList<JSONObject> commentArray = (ArrayList<JSONObject>) jsonObject.get("comment");
                ArrayList<JSONObject> commentArray=null;

                if(jsonObject.containsKey("comment")){
                    commentArray = (ArrayList<JSONObject>) jsonObject.get("comment");
                }


                JSONObject j = new JSONObject();
                j.put("comment",newComment);
                j.put("approved","false");

                commentArray.add(j);

                if(commentArray!=null) {

                    jsonObject.replace("comment", commentArray);
                }
                else{
                    jsonObject.put("comment",commentArray);

                }


            }catch(ParseException e){
                e.printStackTrace();
            }
        }

        try {

            FileWriter filew = new FileWriter(path);

            filew.write(jsonObject.toJSONString());

            filew.flush();
            filew.close();


        } catch (IOException e) {
            e.printStackTrace();
        }


        String title = (String) jsonObject.get("title");
        String content = (String) jsonObject.get("content");

        request.setAttribute("title",title);
        request.setAttribute("content",content);
        request.setAttribute("id",postId);
        request.setAttribute("actionType", "view");



        RequestDispatcher rd=getServletContext().getRequestDispatcher("/view.jsp");
        rd.forward(request,response);
    }
}