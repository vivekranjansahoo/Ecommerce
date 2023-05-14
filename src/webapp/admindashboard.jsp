<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="user.model.*"%>
 <%@page import="com.connection.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

 <%
	var auth = request.getSession().getAttribute("admin");
	if (auth != "admin") {
		response.sendRedirect("adminlogin.jsp");
	}
	
	%>
    <!DOCTYPE html>
<html lang="en">
    <head>
    	 <%@include file="includes/head.jsp"%>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/admin/css/style.css">
          
    </head>
    <body>
    <header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h2 style="margin-top:15px; margin-left:40px">Admin Dashboard</h2>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black" href="adminorder.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>
       
            <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4" align="center">admin</h1>
                       
                        <div class="row my-5">
                            <div class="col-xl-3">
                                <div class="card bg-primary text-white mb-4">
                                
                                
                                <%
                                            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select count(id) from products");
                                            while (rs.next()) {
                                        %>
                                        
                                    <div class="card-body">All Products <h1><%=rs.getInt(1) %></h1></div>
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminallproducts.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                
                                 <%
                                            ResultSet rsss = DatabaseConnection.getResultFromSqlQuery("select count(id) from products");
                                            while (rsss.next()) {
                                        %>
                                    <div class="card-body">Add Product <h1><%=rsss.getInt(1) %></h1></div>
                                    
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminaddproduct.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                
                                
                                 <%
                                            ResultSet rss = DatabaseConnection.getResultFromSqlQuery("select count(o_id) from orders o where o.status='processing'");
                                            while (rss.next()) {
                                        %>
                                    <div class="card-body">Order Recived <h1><%=rss.getInt(1) %></h1></div>
                                      <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminorder.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                
                                 <%
                                            ResultSet rrss = DatabaseConnection.getResultFromSqlQuery("select count(o_id) from orders o where o.status='delivered'");
                                            while (rrss.next()) {
                                        %>
                                    <div class="card-body">Order Delivered <h1><%=rrss.getInt(1) %></h1></div>
                                    
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminorderdeliver.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                  <%
                                            ResultSet r = DatabaseConnection.getResultFromSqlQuery("select count(o_id) from orders o where o.status='cancel'");
                                            while (r.next()) {
                                        %>
                                    <div class="card-body">Order Cancel <h1><%=r.getInt(1) %></h1></div>
                                    
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminordercancel.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-3 col-md-6">
                                <div class="card bg-info text-white mb-4">
                                  <%
                                            ResultSet s = DatabaseConnection.getResultFromSqlQuery("select count(o_id) from orders o where o.status='return'");
                                            while (s.next()) {
                                        %>
                                    <div class="card-body">Return Order <h1><%=s.getInt(1) %></h1></div>
                                    
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminreturnorder.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                  <%
                                            ResultSet rrrss = DatabaseConnection.getResultFromSqlQuery("select count(id) from massage");
                                            while (rrrss.next()) {
                                        %>
                                    <div class="card-body">FeedBack <h1><%=rrrss.getInt(1) %></h1></div>
                                     <%
                                            }
                                        %>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="adminmassage.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                      </div>
           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
 
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
  
    </body>
</html>
    