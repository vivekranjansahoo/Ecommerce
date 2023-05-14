<%@page import="java.text.DecimalFormat"%>
<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 

var auth = request.getSession().getAttribute("admin");
if (auth != "admin") {
	response.sendRedirect("adminlogin.jsp");
}

 OrderDao orderDao  = new OrderDao(DatabaseConnection.getConnection());
Order o=new Order();


%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce</title>
<link rel="stylesheet" href="css/index/style.css">
</head>
<body>
	
<header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h2 style="margin-top:15px; margin-left:40px">All Order Item  </h2>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black; font-size:18px" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black ;font-size:18px" href="orders.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black; font-size:18px" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>
      <div class="content-wrapper">
                <div class="container-fluid">
                    <div class="row pad-botm">
                        <div class="col-md-12" >
                            <h4 class="header-line" align="center" style="margin-top:50px ">All Orders Recived </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-11 col-xs-12">
                            <div class="panel panel-success">
                                <div class="panel-heading"></div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-light" border="2px">
                                            <thead>
                                                <tr>
                                                    <th>Order No</th>
                                              		<th>Date</th>
                                                    <th>Image</th>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                    <th>Customer Details</th>
                                                    <th>Address</th>
                                                    <th>City</th>
                                             		<th>State</th>
                                             		<th>Country</th>
                                                    <th>Pin code</th>
                                                    <th>Phone Number</th>
                                                    <th>Bill Number</th>
                                                    <th>Payment Method</th>
                                
                                                    <th>Action</th>
                                                    
                                                </tr>
                                            </thead>
                                             <% 
	var oid = Integer.parseInt(request.getParameter("oid"));
	
	%>
                                        <%
                                            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from users u,orders o,products p,massage m where o.o_id='"+oid+"' and o.p_id=p.id and o.u_id=u.id and o.msg='hi' group by o.o_id");
                                            while (rs.next()) {
                                        %>
                                        <tbody>
                                         <tr>
                                                <td><%=oid %></td>
                                         		<td><%=rs.getString("o_date") %></td>
                                                 <td><img class="card-img-top" src="product-image/<%=rs.getString("image") %>" width="40px" height="80px"></td>
                                                <td><%=rs.getString("p.name") %></td>
                                                 <td><%=rs.getString("o_quantity") %></td>
                                                  <td><%=rs.getString("p.price") %></td>
                                                <td><%=rs.getString("u.name") %></td>
                                                 
                                                 <td><%=rs.getString("u.address") %></td>
                                                 <td><%=rs.getString("u.city") %></td>
                                                 <td><%=rs.getString("u.state") %></td>
                                                  <td><%=rs.getString("u.country") %></td>
                                                 <td><%=rs.getString("u.pincode") %></td>
                                                  <td><%=rs.getString("u.phone") %></td>
                                                  <td><%=rs.getString("o.billno") %></td>
                                                 <td><%=rs.getString("payment_method") %></td>
                                                 <td><a class="btn  btn-primary text-white mr-4" href="adminfeedback.jsp?oid=<%=rs.getInt("o.o_id") %>">Msg</a>
                                                
                                                 </td>
                                           </tr>
                                        </tbody>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>