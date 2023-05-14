

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.connection.DatabaseConnection;

@WebServlet("adminedit")
@MultipartConfig
public class adminedit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String name = request.getParameter("name");
	     String category = request.getParameter("category");
	     String price=request.getParameter("price");
	     int id=Integer.parseInt(request.getParameter("id"));
	     Part p=request.getPart("image");
	     
	     String fileName=p.getSubmittedFileName();
	     System.out.println(fileName);
	     RequestDispatcher dispatcher=null;
	  
	     try {
	    	 dispatcher=request.getRequestDispatcher("admineditproduct.jsp");
	    	 
	            int updateproduct = DatabaseConnection.insertUpdateFromSqlQuery("update products set name='"+name+"',price='"+price+"',category='"+category+"',image='"+fileName+"' where id='"+id+"'");
	            
	            if(updateproduct > 0) {
	            	
	            	String path=getServletContext().getRealPath("")+"product-image";
	            	File file=new File(path);
	            	p.write(path+File.separator+fileName);
	            	System.out.println(path);
	            	
	           	System.out.println("Success");
	                request.setAttribute("status","success");
	            	
	            }
	            else {
	         	System.out.println("Error");
	            	request.setAttribute("status","failed");
	            }
	            
	            dispatcher.forward(request, response);
	     }
	     catch(Exception e) {
	    	 e.printStackTrace();
	     }
	    
	    
	}

}
