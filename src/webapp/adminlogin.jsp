<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
 

<!DOCTYPE html>
<html>
<head>
	<title>admin Login page</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<img class="wave" src="img/wave.png">
	<div class="container">
		<div class="img">
			<img src="img/admin.png">
		</div>
		<div class="login-content">
			<form action="adminlog" method="post">
				<img src="img/avatar.svg">
				<h2 class="title">Welcome Admin</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Email</h5>
           		   		<input type="email" class="input" name="email" required>
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input" name="password" required>
            	   </div>
            	</div>
            	
            	<input type="submit" class="btn" value="Login">
           
            </form>
        </div>
    </div>
    <script type="text/javascript" src="./js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>
	<script>
	var status = document.getElementById("status").value;
	if(status == "failed"){
		sweetAlert("Sorry","Login Failed !!","error");
	}
	
	</script>
</body>
</html>


    