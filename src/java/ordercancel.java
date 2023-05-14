

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user.model.OrderDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import com.connection.DatabaseConnection;
@WebServlet("ordercancel")

public class ordercancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				int cancel=DatabaseConnection.insertUpdateFromSqlQuery("update orders set status='cancel' where o_id='"+id+"'");
				if(cancel>0) {
		    		System.out.println("Success");
		      }
			}
			response.sendRedirect("orders.jsp");
		}  catch (Exception e) {
            e.printStackTrace();
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
