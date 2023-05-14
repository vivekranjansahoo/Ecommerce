<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

var auth = request.getSession().getAttribute("admin");
if (auth != "admin") {
	response.sendRedirect("adminlogin.jsp");
}
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);


ProductDao pd = new ProductDao(DatabaseConnection.getConnection());
List<Product> products = pd.getAllProducts();

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>admin</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h4 style="margin-top:15px; margin-left:60px">All Products </h4>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black; font-size:18px" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black ;font-size:18px" href="adminorder.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black; font-size:18px" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>

	<div class="container my-3" >
	<h3 align="center" style="margin-top:90px"></h3>
		<br>
		<table class="table table-light" border="2px">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
				<tr>
					<td><img src="product-image/<%=p.getImage()%>" width="100px" height="100px"></td>
					<td><%=p.getName()%></td>
					<td><%=p.getCategory()%></td>
					<td><%= dcf.format(p.getPrice())%></td>
					
					<td><a href="adminproductremove?id=<%=p.getId() %>" class="btn  btn-danger mr-3">Remove</a>
					<a href="admineditproduct.jsp?id=<%=p.getId() %>" class="btn  btn-primary">Edit</a>
					</td>
				</tr>

				<%
				}}%>
				
			</tbody>	
		</table>
	</div>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
<script>

	var status = document.getElementById("status").value;
	if(status=="success"){
		sweetAlert("Congrats","Item remove Successfully !!","success");
	}
	
	</script>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>