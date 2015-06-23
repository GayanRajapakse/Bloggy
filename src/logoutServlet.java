import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


/**
 * Created by thilanka on 5/9/15.
 */
@WebServlet(name = "logoutServlet")
public class logoutServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String function=request.getParameter("function");

        String userName=null;
        if(function.equals("Logout")) {

            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath()
                    + "/home.jsp");

//            RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
//            rd.forward(request,response);
        }

        else if (function.equals("Home")) {
            userName=request.getRemoteUser();

            request.setAttribute("username",userName);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
            rd.forward(request,response);
        }

    }


}
