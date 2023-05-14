<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%
var auth = request.getSession().getAttribute("admin");
if (auth != "admin") {
	response.sendRedirect("adminlogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
   
<%@include file="/includes/head.jsp"%>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
</head>
<body>

<header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h2 style="margin-top:15px; margin-left:40px">All Massages </h2>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black; font-size:18px" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black ;font-size:18px" href="adminorder.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black; font-size:18px" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>
  <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
 <div class="content-wrapper" style="margin-left:40px ;margin-right:40px">
                <div class="container-fluid">
                    <div class="row pad-botm">
                        <div class="col-md-12" >
                            <h4 class="header-line" align="center" style="margin-top:50px">All Massage Recieved </h4>
                        </div>
                    </div>

                   <div class="row" style="margin-top:20px">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-success">
                                
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-light" border="2px">
                                            <thead>
                                                <tr>
                                                    <th>Sl. No</th>
                                                    <th>Order Id</th>
                                              		<th>Email</th>
                                                    <th>Subject</th>
                                                   <th>Massage</th>
                                                   <th>Action</th>
                                                    
                                                </tr>
                                            </thead>
                                        <%
                                       
                                            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from massage");
                                        int i=1;{
                                            while (rs.next()) {
                                        %>
                                        <tbody>
                                         <tr>
                                                <td><%= i %> <% i++; %></td>
                                                <td><%=rs.getInt("oid") %></td>
                                         		<td><%=rs.getString("email") %></td>
                                               <td><%=rs.getString("subject") %></td>
                                             <td><%=rs.getString("msg") %></td>
                                             <td><a class="btn  btn-primary text-white mr-2" href="adminproductdetails.jsp?oid=<%=rs.getInt("oid") %>">View Details</a>
                                             <a class="btn  btn-danger text-white" href="adminmsgdelete?oid=<%=rs.getInt("oid") %>">Delete</a>
                                             
                                                 </td>
                                           </tr>
                                           
                                        </tbody>
                                        <%
                                            }   }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
 </div>
        </div>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
<script>
	var status = document.getElementById("status").value;
	if(status == "success"){
		sweetAlert("Massage !","Remove Successfully !!","success");
	}
	</script>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>