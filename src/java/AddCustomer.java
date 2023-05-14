
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.connection.DatabaseConnection;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String pass=request.getParameter("password1");
        
        
        RequestDispatcher dispatcher=null;


        //Inserting all values inside the database
        try {
        	dispatcher=request.getRequestDispatcher("signup.jsp");
        	if(!password.equals(pass)) {
        		request.setAttribute("status","failed");
        	}
        	else {
        		
            //Connecting database connection and querying in the database
            int addCustomer = DatabaseConnection.insertUpdateFromSqlQuery("insert into users(email,name,password)values('" + email + "','" + name + "','" + password + "')");
            
            String subject="Registration Successfull !!!";
    		String message = "Hello "+name+",<br>";
    		message +="Your account is created with the following credentials<br>";
    		message += "<b>Name: </b>"+name+"<br>";
    		message += "<b>Email: </b>"+email+"<br>";
    		message += "<b>Password: </b>"+password+"<br>";
            
    		Mailer mailer = new Mailer();
    		boolean result = mailer.sendMail(email, subject, message);
    		
    		if(result) {
    			System.out.println("successfully");
    		} else {
    			System.out.println("error");
    		}
            if (addCustomer > 0) {
           request.setAttribute("status","success");
               
            } else {
            	 request.setAttribute("status","failed");
            }
            
        	}
            
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
