

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.connection.DatabaseConnection;

@WebServlet("adminmsgdelete")
public class adminmsgdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 RequestDispatcher dispatcher=null;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		var id = Integer.parseInt(request.getParameter("oid"));
		 try {
	        	dispatcher=request.getRequestDispatcher("adminmassage.jsp");
	        	
	        		
	            int remove = DatabaseConnection.insertUpdateFromSqlQuery("delete from massage where oid='"+id+"'");

	            if (remove > 0) {
	           request.setAttribute("status","success");
	               
	            } else {
	            	 request.setAttribute("status","failed");
	            }
	        	
	            
	            dispatcher.forward(request, response);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
