<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%


User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
	response.sendRedirect("login.jsp");
}

%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
	<title>Checkout</title>
	
	<link rel="stylesheet" type="text/css" href="css/index/style.css">
	<link rel="stylesheet" type="text/css" href="css/checkout/css/style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />

</head>
<body>
<%@include file="/includes/nv.jsp"%>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

  <h3 align="center" style="margin-top:20px"></h3>

<div class="container" >
  <div class="title">
      <h2 align="center">Address & Payment For Your Item</h2>
  </div>
<div class="d-flex">

  <form action="ordernow" method="post">
    <label>
      <span class="fname">Full Name <span class="required">*</span></span>
      <input type="text" name="name"  required>
    </label>

  
    <label>
      <span>Country <span class="required">*</span></span>
     <input type="text" name="country">
    </label>
    <label>
      <span>Street Address <span class="required">*</span></span>
      <input type="text" name="address"  required>
    </label>
    <label>
      <span> City <span class="required">*</span></span>
      <input type="text" name="city" required> 
    </label>
    <label>
      <span>State  <span class="required">*</span></span>
      <input type="text" name="state" required> 
    </label>
    <label>
      <span>Pincode / ZIP <span class="required">*</span></span>
      <input type="text" name="pincode" required> 
    </label>
    <label>
      <span>Phone <span class="required">*</span></span>
      <input type="tel" name="phone" required> 
    </label>
    <label>
      <span>Email Address <span class="required">*</span></span>
      <input type="email" name="email" required> 
    </label>
    <br>
    <h2>Payment Method</h2>
    <label>Accept Payment card<br> <br><img src="https://www.logolynx.com/images/logolynx/c3/c36093ca9fb6c250f74d319550acac4d.jpeg" alt="" width="200px"></label>
     <label>
       <input type="radio" name="dbt" value="dbt"checked required> Direct Bank Transfer
    </label>
        <p>
        Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.
    </p>
    <label>
       <input type="radio" name="dbt" value="cd"> Cash on Delivery
    </label>
    <label>
     <input type="radio" name="dbt" value="paytm"> Paytm
    </label>
   
    <input type="hidden" name="status" value="processing">
    <%
         Random rand = new Random();
           int n = rand.nextInt(90000) + 10000;
              System.out.println(n);
            %>
      <input type="hidden" name="billno" value="<%=n%>">
     <button type="submit" name="submit">Place Order</button>
  </form>
  
  <div class="Yorder">
    <table>
     <thead>
				<tr>
				    <th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>	
				</tr>
	</thead>
	<tbody>
	<% 
	var pid = request.getSession().getAttribute("id");
	
	%>
				 <%
                     ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from products where id ='"+pid+"'");
                     while (rs.next()) {
                   %>
				
				<tr>
					<td><img class="card-img-top" src="product-image/<%=rs.getString("image") %>" width="60px" height="70px"></td>
					<td><%=rs.getString("name")%></td>
				  <td>1</td>
					<td><%=rs.getString("price")%></td>
				</tr>

				
				
				 
			</tbody>	
    </table>

          <h4 style="margin-left:120px">Total Price: $ <%=rs.getString("price")%> </h4>
          <%
				}%>
    <hr>

  </div><!-- Yorder -->
  
 </div>
</div>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
	<script>
	var status = document.getElementById("status").value;
	if(status=="success"){
		sweetAlert("Congrats","Account create Successfully !!","success");
	}
	else if(status=="failed"){
		sweetAlert("Password Doesn't match","Login Failed !!","warning");
	}
	</script>
</body>
</html>
