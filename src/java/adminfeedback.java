

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.connection.DatabaseConnection;

@WebServlet("adminfeedback")
public class adminfeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
	        
	        String msg = request.getParameter("msg");
	        int oid= Integer.parseInt(request.getParameter("oid"));
	        RequestDispatcher dispatcher=null;


	        //Inserting all values inside the database
	        try {
	        	dispatcher=request.getRequestDispatcher("adminfeedback.jsp");
	        	
	        		
	            //Connecting database connection and querying in the database
	            int addmsg = DatabaseConnection.insertUpdateFromSqlQuery("update orders set orders.msg='"+msg+"' where o_id='"+oid+"'");

	            if (addmsg > 0) {
	           request.setAttribute("status","success");
	               
	            } else {
	            	 request.setAttribute("status","failed");
	            }
	        	
	            
	            dispatcher.forward(request, response);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	}

}
