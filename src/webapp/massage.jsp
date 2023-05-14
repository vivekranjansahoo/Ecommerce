<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
	response.sendRedirect("login.jsp");
}

%>
 <!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/includes/head.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
    <link rel="stylesheet" href="css/massage/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />

    <!-- font Awesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<body>
	<%@include file="/includes/nv.jsp"%>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

   <div>
  <div class="contact-form-wrapper d-flex justify-content-center">
    <form action="massage" method="post" class="contact-form">
    <% 
	var oid = Integer.parseInt(request.getParameter("oid"));
	
	%>
	<input type="hidden" name="oid" value="<%= oid %>">
		
      <h5 class="title">Massage us</h5>
      <p class="description">Feel free to contact us if you need any assistance, any help or another question.
      </p>
      <div>
        <input type="email" class="form-control rounded border-white mb-3 form-input" id="name" placeholder="Email" name="email" required>
      </div>
      <div>
        <input type="text" class="form-control rounded border-white mb-3 form-input" placeholder="subject" name="subject" required>
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
		sweetAlert("Massage Sent !","Thank you ! Our team will contact you !!","success");
	}
	</script>
</body>
</html>