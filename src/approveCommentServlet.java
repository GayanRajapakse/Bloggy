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
import java.util.Enumeration;

/**
 * Created by mora on 11/05/2015.
 */
@WebServlet(name = "approveCommentServlet")
public class approveCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path= "/home/thilanka/IdeaProjects/blog/posts/";

        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        JSONParser parser = new JSONParser();

        Enumeration<String> paramList = request.getParameterNames();

        while(paramList.hasMoreElements()){

            String param = paramList.nextElement();
            String isApproved = request.getParameter(param);
//            System.out.println("param is : " + param);
            //System.out.println("param value is : "+isApproved);

            //if(isApproved.equals("false")) continue;

            String names[] = param.split("@");
            if(names.length < 2) continue;

            //System.out.println("names[0] is : " + names[0]);
            //System.out.println("names[1] is : " + names[1]);
            Object obj = null;
            try {
                obj = parser.parse(new FileReader(path+names[0]+".json"));
                JSONObject jsonObject = (JSONObject) obj;

                ArrayList<JSONObject> allComments = (ArrayList<JSONObject>) jsonObject.get("comment");

                int index = Integer.parseInt(names[1]);

                JSONObject jObj = allComments.get(index);

                jObj.replace("approved","true");


                FileWriter file = new FileWriter(path+names[0]+".json");
                file.write(jsonObject.toJSONString());

                //comments.

                file.flush();
                file.close();

            } catch (ParseException e) {
                e.printStackTrace();
            }catch (IOException e) {
                e.printStackTrace();
            }

        }

        RequestDispatcher rd=getServletContext().getRequestDispatcher("/comment.jsp");
        rd.forward(request,response);
    }
}