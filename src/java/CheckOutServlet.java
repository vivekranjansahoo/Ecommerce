

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import com.connection.DatabaseConnection;

import user.model.*;
@WebServlet("CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    RequestDispatcher dispatcher=null;
/*
 * 		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			if(cart_list != null && auth!=null) {
				for(Cart c:cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderDao oDao = new OrderDao(DatabaseConnection.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
	//			request.setAttribute("status","success");
				response.sendRedirect("checkout.jsp");
			}else {
				if(auth==null) {
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("cart.jsp");
				
	//			request.setAttribute("status","failed");
			}
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String name = request.getParameter("name");
 //       String email = request.getParameter("email");
        String country=request.getParameter("country");

        String phone=request.getParameter("phone");
        String pincode=request.getParameter("pincode");
        String state=request.getParameter("state");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String payment=request.getParameter("dbt");
        String status=request.getParameter("status");
        String bill=request.getParameter("billno");
        User auth = (User) request.getSession().getAttribute("auth");
        HttpSession session = request.getSession();
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
		ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
     //   RequestDispatcher dispatcher=null;
        
        try (PrintWriter out = response.getWriter()){
	    	
	    	  
	            int addproduct = DatabaseConnection.insertUpdateFromSqlQuery("update users set phone='" + phone + "',country='" + country + "',address='" + address + "',city='" + city + "',state='" + state + "',pincode='" + pincode + "' where id='" + auth.getId() +"' ");
	            
	            if(addproduct > 0 && cart_list != null && auth!=null) {
	            	 
	            	
	            	for(Cart c:cart_list) {
						Order order = new Order();
						order.setId(c.getId());
						order.setUid(auth.getId());
						order.setQunatity(c.getQuantity());
						order.setDate(formatter.format(date));
						order.setpayment(payment);
						order.setstatus(status);
						order.setbillno(bill);
						OrderDao oDao = new OrderDao(DatabaseConnection.getConnection());
						boolean result = oDao.insertOrder(order);
						if(!result) break;
						int billno=DatabaseConnection.insertUpdateFromSqlQuery("insert into bill(u_id,billno) values('"+auth.getId()+"','"+bill+"')");
						session.setAttribute("bill", bill);
						int totalamt=DatabaseConnection.insertUpdateFromSqlQuery("update orders join products on orders.p_id=products.id set orders.total=products.price*orders.o_quantity where status='processing' and orders.u_id='"+auth.getId()+"'");
				      if(billno>0 && totalamt>0) {
				    		System.out.println("Success");
				      }
				      else {
				    	  System.out.println("Error");
				      }
	            	}
					cart_list.clear();
	            	
	           	System.out.println("Success");
	                request.setAttribute("status","success");
	                response.sendRedirect("razorpay.jsp");
	            }
	            else {
	         	System.out.println("Error");
	            	request.setAttribute("status","failed");
	            }
	            
	      //     dispatcher.forward(request, response);
	     }
	     catch(Exception e) {
	    	 e.printStackTrace();
	     }

	}

}
