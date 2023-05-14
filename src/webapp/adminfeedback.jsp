<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 

var auth = request.getSession().getAttribute("admin");
if (auth != "admin") {
	response.sendRedirect("adminlogin.jsp");
}

%>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index/style.css">
    <title>admin Contact Form </title>
    <link rel="stylesheet" href="css/massage/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />

    <!-- font Awesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<body>
<header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h2 style="margin-top:15px; margin-left:40px">Massage By Admin </h2>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black; font-size:18px" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black ;font-size:18px" href="adminorder.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black; font-size:18px" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

   <div>
  <div class="contact-form-wrapper d-flex justify-content-center">
    <form action="adminfeedback" method="post" class="contact-form">
    <% 
	var oid = Integer.parseInt(request.getParameter("oid"));
	
	%>
	<input type="hidden" name="oid" value="<%= oid %>">
		
      <h5 class="title">Massage by Admin</h5>
      <p class="description">Feel free to contact us if you need any assistance, any help or another question.
      </p>
      
      <div>
        <p class="form-control rounded border-white mb-3 form-input">Order Id <b><%= oid %></b></p>
      </div>
      <div>
        <textarea id="message" class="form-control rounded border-white mb-3 form-text-area" rows="5" cols="30" placeholder="Message" name="msg" required></textarea>
      </div>
      <div class="submit-button-wrapper">
        <input type="submit" value="Send">
      </div>
    </form>
  </div>
</div> 
    
    
      <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
<script>
	var status = document.getElementById("status").value;
	if(status == "success"){
		sweetAlert("Massage Sent !","by admin !!","success");
	}
	</script>
</body>
</html>