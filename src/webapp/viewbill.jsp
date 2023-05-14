<%@page import="java.text.DecimalFormat"%>
<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
var bill = request.getParameter("billno");
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DatabaseConnection.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tech Shop Invoice</title>
	<link rel="stylesheet" type="text/css" href="css/bill/css/style.css">
	<style>
	@media print {
  #printPageButton {
    display: none;
  }
}
button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
	</style>
</head>
<body>
	<div class="invoice_container">
		<div class="invoice_header">
			<div class="logo_container">
				<img src="img/techshop.png" width="150px" height="100px">
			</div>
			<h1 style="margin-top:40px">Visit Again !!!</h1>
			<div class="company_address">
				<h2>Tech Shop Pvt Ltd.</h2>
				<p>
					Silicon Institute Of Technology<br>
					Patia,Bhubaneswar <br>
					769004 <br>
					TechShop Team, Ph-123456789
				</p>
			</div>
		</div>
		<div class="customer_container">
			<div>
				<h2>Billing To</h2>
				<h3><%=auth.getName() %></h3>
				
				 <%
                     ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from users where id ='"+auth.getId()+"'");
                     while (rs.next()) {
                   %>
				<p>
					<%=rs.getString("address") %> <br>
				    <%=rs.getString("city")%> <br>
					<%=rs.getString("state")%>, <%=rs.getString("country")%> <br>
					<%=rs.getString("pincode")%>, <%=rs.getString("phone")%>
				</p>
				
				  <%
                     }
                   %>
			</div>
			<div class="in_details">
				<h1 class="in_head">INVOICE</h1>
				
			
				<table>
					<tr>
						<td>Invoice No</td>
						<td>:</td>
						<td><b><%= bill %></b></td>
						
					</tr>
				</table>
			</div>
		</div>
		<div class="product_container">
		<h2 align="center">Item Details</h2>
			<table class="item_table" border="1" cellspacing="0">
			<thead>
				<tr>
					<th scope="col">Sl No.</th>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
				 <%
              ResultSet rss = DatabaseConnection.getResultFromSqlQuery("select * from products p ,orders o where o.u_id='"+auth.getId()+"' and o.billno='"+bill+"' and o.p_id=p.id");
			   int i=1;{
			 while (rss.next()) {
                   %>   
				
				<tr>
				  <td><%= i %> <% i++; %></td>
					<td><img class="card-img-top" src="product-image/<%=rss.getString("p.image") %>" width="90px" height="80px"></td>
					<td><%=rss.getString("p.name") %></td>
					<td><%=rss.getString("p.category") %></td>
					<td><%=rss.getString("p.price") %></td>
					<td><%=rss.getString("o.o_quantity") %></td>
					<td><%=rss.getString("o.total") %>.0</td>
				</tr>

				<%
				}}%>
				
			</tbody>	
		</table>
		</div>
		<div class="invoice_footer">
			<div class="note">
				<h2>Thank You!</h2>
				<p>
				 We hope your experience was excellent and happy with your purchase .<br>we cannot wait to see you again soon.
				</p>
			</div>
			
			

			<div class="invoice_footer_amount">
				<table class="amount_table">
					<tr>
						<td>Tax amount</td>
						<td>: <b>0</b></td>
					</tr>
					<tr>
					
					 <%
                     ResultSet rsss = DatabaseConnection.getResultFromSqlQuery("select sum(o.total) from orders o where o.u_id ='"+auth.getId()+"'and o.billno='"+bill+"'");
			   
			 while (rsss.next()) {
                   %>  
						<td>Grand Total </td>
						<td>: <b><%=rsss.getInt(1) %>.00</b></td>
						
					</tr>
				 <%
			 }%>	
			
				</table>
			</div>
			
			
		</div>
	</div>
	<div class="centeredButton">
	<a onclick="window.print()"><button id="printPageButton" style="size:20">Print </button></a>
</div>

</body>
</html>     