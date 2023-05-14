<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%

User auth = (User) request.getSession().getAttribute("auth");
if(auth==null){
	response.sendRedirect("login.jsp");
}

var bill = request.getSession().getAttribute("bill");


%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
  rel="stylesheet"
/>
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>

 <body>
 
  <div class="container py-5 " style="margin-top:120px">
    <div class="row d-flex justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card rounded-3">
          <div class="card-body mx-1 my-2">
            <div class="d-flex align-items-center">
              <div>
               <img src="img/razorpay.png" height="100px" width="120px" style="margin-left:120px">
              </div>
              <div>
               
              </div>
            </div>
            

            <div class="pt-3">
              <div class="d-flex flex-row pb-3">
                <div class="rounded border border-primary border-2 d-flex w-100 p-3 align-items-center"
                  style="background-color: rgba(18, 101, 241, 0.07);">
                  <div class="d-flex align-items-center pe-3">
                    <input class="form-check-input" type="radio" name="radioNoLabelX" id="radioNoLabel11"
                      value="" aria-label="..." checked />
                  </div>
                  <div class="d-flex flex-column">
                  <p class="mb-1 small text-primary">Total amount</p>
                 <%
                     ResultSet rss = DatabaseConnection.getResultFromSqlQuery("select sum(o.total) from orders o where o.u_id ='"+auth.getId()+"'and o.billno='"+bill+"'");
			   
			 while (rss.next()) { 
                    %>
                    <h6 class="mb-0 text-primary">$<%=rss.getInt(1) %></h6>
                  <% 
                  var total=rss.getInt(1);
				}%>
				
                  </div>
                </div>
              </div>

         
            </div>

            <div class="d-flex justify-content-between align-items-center pb-1" style="margin-top:20px">
              <button type="button" class="btn btn-primary btn-lg" style="margin-left:120px" id="rzp-button1" >Pay amount</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_2yzb2hGbf1QVa5", // Enter the Key ID generated from the Dashboard
    <%
    ResultSet rsss = DatabaseConnection.getResultFromSqlQuery("select sum(o.total) from orders o where o.u_id ='"+auth.getId()+"'and o.billno='"+bill+"'");

while (rsss.next()) { 
   %>
   
    "amount":" <%=rsss.getInt(1)*100 %>", 
    <% 
	}%>
    // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Tech Shop", //your business name
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
  //  "order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "callback_url": "http://localhost:8082/Ecommerce/thankyou.jsp",
    "prefill": {
        "name": "Vivek", //your customer's name
        "email": "vk@example.com",
        "contact": "7008673052"
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>


</body>
</html>

