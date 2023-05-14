
import java.io.IOException;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import user.model.*;

import com.connection.DatabaseConnection;

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {

 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     
        String email = request.getParameter("email");
        String password = request.getParameter("password");
      
        HttpSession session = request.getSession();
        HttpSession sessionn=request.getSession();
        RequestDispatcher dispatcher=null;
        try {
            //Creating Resultset
            ResultSet resultset = null;
            //Query to check Login Details
            resultset = DatabaseConnection.getResultFromSqlQuery("select * from users where email='" + email + "' and password='" + password + "'");
            //Checking whether the details of user are null or not
            UserDao udao = new UserDao(DatabaseConnection.getConnection());
            User user = udao.userLogin(email, password);
                if (resultset.next()) {
             //   	dispatcher=request.getRequestDispatcher("index.jsp");
            //    	sessionn.setAttribute("name",resultset.getString("name"));
                	session.setAttribute("auth", user);
              	dispatcher=request.getRequestDispatcher("home.jsp");
                } else {
                	request.setAttribute("status", "failed");
                
                	dispatcher=request.getRequestDispatcher("login.jsp");
                }
            
            
            dispatcher.forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
