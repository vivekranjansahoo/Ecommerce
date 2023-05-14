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
   <title>admin page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
   <!-- font awesome cdn link  -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/adminaddproduct/css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
 
<link rel="stylesheet" href="css/index/style.css">
</head>
<body>
<header class="sticky">
    <a href="#" class="logo"><img src="img/techshop.png" alt=""></a>
    <ul class="navmenu">
     <h2 style="margin-top:15px; margin-left:40px">Add a New Product </h2>
    </ul>
    <div class="nav-icon">
     <li class="nav-item "><a class="nav-link fa fa-home" style="color:black; font-size:18px" href="admindashboard.jsp">Home<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
			
				<li class="nav-item"><a class="nav-link fa fa-shopping-bag" style="color:black ;font-size:18px" href="orders.jsp">Orders</a></li>
				<li class="nav-item "><a class="nav-link fa fa-user"  style="color:black; font-size:18px" href="adminlogout">(admin)Logout</a></li>
			
				
      
    </div>
    
  </header>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
   


   <div class="admin-product-form-container" style="margin-top:100px">

      <form action="adminaddproducts" method="post" enctype="multipart/form-data">
         <h3 style="margin-top:20px">add a new product</h3>
         <input type="text" placeholder="enter product name" name="name" class="box" required>
         <input type="text" placeholder="enter product category" name="category" class="box" required>
          <input type="text" placeholder="enter product price" name="price" class="box" required>
         <input type="file"  name="image" class="box" required>
         <input type="submit" class="btn" name="add_product" value="add product">
      </form>

   </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
	<script>
	var status = document.getElementById("status").value;
	if(status=="success"){
		sweetAlert("Congrats","Item added Successfully !!","success");
	}
	else if(status=="failed"){
		sweetAlert("Sorry","Item was not added  !!","error");
	}
	</script>
</body>
</html>