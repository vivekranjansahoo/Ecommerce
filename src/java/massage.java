

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.connection.DatabaseConnection;

@WebServlet("/massage")
public class massage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public massage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   String email = request.getParameter("email");
	        String subject = request.getParameter("subject");
	        String msg = request.getParameter("msg");
	        int oid= Integer.parseInt(request.getParameter("oid"));
	        RequestDispatcher dispatcher=null;


	        //Inserting all values inside the database
	        try {
	        	dispatcher=request.getRequestDispatcher("massage.jsp");
	        	
	        		
	            //Connecting database connection and querying in the database
	            int addmsg = DatabaseConnection.insertUpdateFromSqlQuery("insert into massage(oid,email,subject,msg)values('"+ oid +"','" + email + "','" + subject + "','" + msg + "')");

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
