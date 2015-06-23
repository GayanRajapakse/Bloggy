import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

/**
 * Created by thilanka on 5/13/15.
 */
@WebServlet(name = "adminServlet")
public class adminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String actionType=request.getParameter("actionType");

        RequestDispatcher rd;
        if(actionType.equals("comments")) rd=getServletContext().getRequestDispatcher("/comment.jsp");
        else rd=getServletContext().getRequestDispatcher("/home.jsp");

        rd.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
