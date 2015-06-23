import com.sun.xml.internal.bind.v2.TODO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.FileReader;
import  java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import javax.servlet.RequestDispatcher;
import java.util.ArrayList;

import org.json.simple.parser.JSONParser;



/**
 * Created by thilanka on 5/10/15.
 */
@WebServlet(name = "addPostServlet")

public class addPostServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String postTitle=request.getParameter("title");
        String postContent=request.getParameter("content");
        //String path="/home/thilanka/IdeaProjects/blog/web/home.jsp";
        String path = request.getServletContext().getRealPath("/")+"home.jsp";

//String path = request.getServletContext().getRealPath("/")+"posts\\"+count+".json";

        JSONObject obj = new JSONObject();
        JSONParser parser = new JSONParser();

        String actionType= (String)request.getParameter("actionType");


        if( actionType.equals("update")){
            path=request.getServletContext().getRealPath("/")+"posts/"+(request.getParameter("id").toString())+".json";

            try {
                obj = (JSONObject)parser.parse(new FileReader(path));
                ArrayList<JSONObject> allComments = (ArrayList<JSONObject>) obj.get("comment");

                long viewCount = (Long) obj.get("views");

                obj.put("title",postTitle);
                obj.put("content",postContent);
                obj.put("comment",allComments);
                obj.put("views",viewCount);

            }catch(Exception e){
                e.printStackTrace();
            }
        }
        else if( actionType.equals("newPost") ) {


            int postNumber = new File(request.getServletContext().getRealPath("/")+"posts/").listFiles().length;

            path=request.getServletContext().getRealPath("/")+"posts/"+(postNumber+1)+".json";


            obj.put("title",postTitle);
            obj.put("content",postContent);
            obj.put("comment",new ArrayList<JSONObject>());
            obj.put("views",0);


        }

        try {

            FileWriter file = new FileWriter(path);
            file.write(obj.toJSONString());
            file.flush();
            file.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        RequestDispatcher rd=getServletContext().getRequestDispatcher("/home.jsp");
        rd.forward(request,response);

    }

    //restrict get method of this request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("newpost success in do get");
        doPost(request,response);
    }
}
