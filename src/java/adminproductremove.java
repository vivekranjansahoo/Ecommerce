

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user.model.OrderDao;

import java.io.IOException;
import java.io.PrintWriter;

import com.connection.DatabaseConnection;

@WebServlet("/adminproductremove")
public class adminproductremove extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 RequestDispatcher dispatcher=null;
   


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		try {
			dispatcher=request.getRequestDispatcher("adminallproducts.jsp");
			String id = request.getParameter("id");
			if(id != null) {
				OrderDao orderDao = new OrderDao(DatabaseConnection.getConnection());
				orderDao.removeproduct(Integer.parseInt(id));
				request.setAttribute("status","success");
			}
		//	response.sendRedirect("adminallproducts.jsp");
			
			 dispatcher.forward(request, response);
		}  catch (Exception e) {
            e.printStackTrace();
        }
        
        */
		var id = Integer.parseInt(request.getParameter("id"));
		 try {
	        	dispatcher=request.getRequestDispatcher("adminallproducts.jsp");
	        	
	        		
	            int remove = DatabaseConnection.insertUpdateFromSqlQuery("delete from products where id='"+id+"'");

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
