import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileWriter;
import  java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import  org.json.simple.parser.JSONParser;
import javax.servlet.RequestDispatcher;


/**
 * Created by thilanka on 5/11/15.
 */
@WebServlet(name = "viewPostServlet")
public class viewPostServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println("title: "+request.getParameter("title"));
        int postId=Integer.parseInt(request.getParameter("id"));
        //System.out.println("Post ID="+postId);

        JSONParser parser = new JSONParser();

        String path= "/home/thilanka/IdeaProjects/blog/posts/"+postId+".json";
        File file = new File(path);
        String title=null,content=null;
        long viewCount=0;
        String actionType= (String)request.getParameter("actionType");

        if (file.exists()){
            try {

                Object obj = parser.parse(new FileReader(path));

                JSONObject jsonObject = (JSONObject) obj;

                title = (String) jsonObject.get("title");
                content = (String) jsonObject.get("content");
                viewCount = (Long) jsonObject.get("views");

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        else{

        }
        request.setAttribute("title",title);
        request.setAttribute("content",content);
        request.setAttribute("id",postId);
        request.setAttribute("views",viewCount);
        request.setAttribute("actionType", actionType);
        RequestDispatcher rd;
        if(actionType.equals("view")){
            rd=getServletContext().getRequestDispatcher("/view.jsp");
        }else{
            rd=getServletContext().getRequestDispatcher("/editPost.jsp");
        }

        rd.forward(request,response);


    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
