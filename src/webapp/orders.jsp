<%@page import="java.text.DecimalFormat"%>
<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DatabaseConnection.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce</title>
<style>
.container {
   max-width: 80% !important;/*Set your own width %; */
}
</style>
</head>
<body>
	<%@include file="/includes/nv.jsp"%>
	<div class="container" style="margin-top:90px">
		<div class="card-header my-3" align="center"><b>All Orders Items</b></div>
		<table class="table table-light w-auto" border="2px">
			<thead>
				<tr>
				    <th scope="col">Sl. No</th>
				    <th scope="col">Bill NO</th>
					<th scope="col">Date</th>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
					<th scope="col">Msg</th>
				</tr>
			</thead>
			<tbody>
			
				
		 <%
              ResultSet rss = DatabaseConnection.getResultFromSqlQuery("select distinct('"+auth.getId()+"'),o.billno,o.o_id,o.o_date,p.image,p.name,p.category,o.o_quantity,p.price,o.status,o.msg from orders o,users u,products p where o.p_id=p.id and o.u_id ='"+auth.getId()+"'");
		 int i=1;{
			 while (rss.next()) {
                   %>   
					<tr>
					    <td><%= i %> <% i++; %></td>
					    <td><%=rss.getString("o.billno") %></td>
						<td><%=rss.getString("o.o_date") %></td>
						<td><img class="card-img-top" src="product-image/<%=rss.getString("p.image") %>" width="100px" height="120px" ></td>
						<td><%=rss.getString("p.name") %></td>
						<td><%=rss.getString("p.category") %></td>
						<td><%=rss.getString("o.o_quantity") %></td>
						<td><%=rss.getString("p.price") %></td>
						<td><%=rss.getString("o.status") %></td>
					
					<td>
					 <%
       

            String Status = rss.getString("o.status");

            if (Status.equals("processing")) {
            	%>
             <a class="btn btn-sm btn-warning" href="ordercancel?id=<%=rss.getInt("o.o_id") %>">Cancel Order</a>
     <% 
            } else if (Status.equals("delivered")){
            	%>
                
            	<a class="btn btn-sm btn-success" href="returnorder?id=<%=rss.getInt("o.o_id") %>">Return Order</a>
            	<% 
            }  else{
           %>
            	<a class="btn btn-sm btn-warning disabled" href="ordercancel?id=<%=rss.getInt("o.o_id") %>">Cancel Order</a>
            	<% 
            } 
            %>
        
					
					<a class="btn  btn-primary" href="viewbill.jsp?billno=<%=rss.getString("o.billno") %>">bill</a><br><br>
						<a class="btn  btn-danger" href="CancelOrderServlet?id=<%=rss.getInt("o.o_id") %>">Delete </a>
						
						</td>
						
					<td>
					<a class="btn  btn-success" href="massage.jsp?oid=<%=rss.getInt("o.o_id") %>">Msg </a>
					 <%
       
					 String msgh = rss.getString("o.msg");
					
			
					if (msgh.equals("hi")) {
						 %>
						<a class="btn  btn-primary disabled" href="feedbackbyadmin.jsp?oid=<%=rss.getInt("o.o_id") %>">Msg by admin </a>
						<% 
            } else {
            	%>
            	<a class="btn  btn-primary" href="feedbackbyadmin.jsp?oid=<%=rss.getInt("o.o_id") %>">Msg by admin </a>
            	<% 
            } 
            %>
					</td>	
						
					</tr>
				 <% 
			 } }%>
			
			
			</tbody>
		</table>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>