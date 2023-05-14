<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DatabaseConnection.getConnection());
List<Product> products = pd.getAllProducts();
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
   max-width: 80% !important;
}
</style>
</head>
<body>
	<%@include file="/includes/nv.jsp"%>

	<div class="container">
		<div class="card-header " style="margin-top:90px" align="center">All Products</div>
		<div class="row" >
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3 text-center" >
				<div class="card w-100 border border-primary ">
					<img class="card-img-top mx-auto" src="product-image/<%=p.getImage() %>"alt="Card image cap">
					<div class="card-body ">
						<h5 class="card-title"><b><%=p.getName() %></b></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-warning mr-4" href="AddToCartServlet?id=<%=p.getId()%>">Add to Cart</a>
							 <a class="btn btn-success" href="OrderNowServlet?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>