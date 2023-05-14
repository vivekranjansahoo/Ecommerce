

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import user.model.*;
import com.connection.*;
import java.text.SimpleDateFormat;


@WebServlet("OrderNowServlet")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		HttpSession se=request.getSession();
;		
		 
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");

            RequestDispatcher dispatcher=null;
            
            
                String productId = request.getParameter("id");
               
                session.setAttribute("id", productId);
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                se.setAttribute("quantity", productQuantity);
               // response.sendRedirect("checkout1.jsp");
                dispatcher=request.getRequestDispatcher("checkout1.jsp");
            
            dispatcher.forward(request,response);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
	

}
}

