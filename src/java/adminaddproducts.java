import user.model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.*;
import java.sql.ResultSet;
import java.util.*;

import com.connection.DatabaseConnection;


@WebServlet("/adminaddproducts")
@MultipartConfig
public class adminaddproducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String name = request.getParameter("name");
	     String category = request.getParameter("category");
	     String price=request.getParameter("price");
	     
	     Part p=request.getPart("image");
	     
	     String fileName=p.getSubmittedFileName();
	     System.out.println(fileName);
	     RequestDispatcher dispatcher=null;
	  
	     try {
	    	 dispatcher=request.getRequestDispatcher("adminaddproduct.jsp");
	    	 
	            int addproduct = DatabaseConnection.insertUpdateFromSqlQuery("insert into products(name,category,price,image)values('" + name + "','" + category + "','" + price + "','"+fileName+"')");
	            
	            if(addproduct > 0) {
	            	
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
