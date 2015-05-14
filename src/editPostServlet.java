import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.json.simple.parser.JSONParser;
import  java.io.File;
import java.io.FileReader;
import org.json.simple.JSONObject;

/**
 * Created by thilanka on 5/11/15.
 */
@WebServlet(name = "editPostServlet")
public class editPostServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println("title: "+request.getParameter("title"));
        int postId=Integer.parseInt(request.getParameter("id"));
        //System.out.println("Post ID="+postId);

        JSONParser parser = new JSONParser();

        String path= request.getServletContext().getRealPath("/")+"posts/"+postId+".json";
        File file = new File(path);
        String title=null,content=null;

        if (file.exists()){
            try {

                Object obj = parser.parse(new FileReader(path));

                JSONObject jsonObject = (JSONObject) obj;

                title = (String) jsonObject.get("title");
                content = (String) jsonObject.get("content");


            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        else{

        }
        request.setAttribute("title",title);
        request.setAttribute("content", content);
        request.setAttribute("id",postId);

        RequestDispatcher rd=getServletContext().getRequestDispatcher("/editPost.jsp");
        rd.forward(request,response);


    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
