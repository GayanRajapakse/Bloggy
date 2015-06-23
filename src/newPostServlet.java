import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.http.HttpSession;

/**
 * Created by thilanka on 5/8/15.
 */
@WebServlet(name = "newPostServlet")
public class newPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //String userName=request.getUserPrincipal().getName();
        String userName=request.getParameter("username");


        request.setAttribute("username",userName);
        RequestDispatcher rd= getServletContext().getRequestDispatcher("/newpost.jsp");
        rd.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            doPost(request,response);
    }


}
