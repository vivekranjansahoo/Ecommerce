<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin feedback</title>
<%@include file="/includes/head.jsp"%>
</head>
<body>

<%@include file="/includes/nv.jsp"%>
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
                                                    
                                                    <th>Order Id</th>
                                              		<th>Email</th>
                                                    <th>Subject</th>
                                                   <th>Massage By You</th>
                                                  <th>Msg By Admin</th>
                                                    
                                                </tr>
                                            </thead>
                                             <% 
	  var oid = Integer.parseInt(request.getParameter("oid"));
	
	%>
                                        <%
                                            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from massage m ,orders o where '"+oid+"'=o_id and m.oid=o.o_id group by o_id;");
                                        
                                            while (rs.next()) {
                                        %>
                                        <tbody>
                                         <tr>
                                                
                                                <td><%=rs.getInt("m.oid") %></td>
                                         		<td><%=rs.getString("m.email") %></td>
                                               <td><%=rs.getString("m.subject") %></td>
                                             <td><%=rs.getString("m.msg") %></td>
                                             <td><%=rs.getString("o.msg") %></td>
                                            
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