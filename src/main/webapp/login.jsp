<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Login Form</title>
     <%@ include file="include/links.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-login {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            width: 100%;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
         .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
    <div class="login-container">
        <h2>Login</h2>
        <form id="login">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="upass" placeholder="Enter password">
            </div>
            <button type="submit" class="btn btn-login">Login</button>
        </form>
    </div>
   <%@ include file="include/footer.jsp" %>
   <%@ include file="include/scripts.jsp" %>
<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		$("#login").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			$.ajax({
  				url:"loginController",
  				data:f,
  				method:'POST',
  				success:function(data){
					console.log(data);
  					if(data.trim()==="adminSuccessfull"){
					    alert("Login Successfull!");
 						window.location.href ="admin/dashboard.jsp"; 
  					}
  					else if(data.trim()==="UserSuccessfull"){
  						alert("Login Successfull!");
 						window.location.href ="index.jsp"; 
  					}
  					else if(data.trim()==="usernotactive"){
  						 $('#login')[0].reset();
  						 $.toast({
  							    text: "User Not Active!",
  							    heading: 'warning', 
  							    icon: 'warning', 
  							    showHideTransition: 'plain',
  							    allowToastClose: true, 
  							    hideAfter: 5000, 
  							    stack: 5, 
  							    position: 'top-center', 
  							    textAlign: 'left',
  							    loader: true,  
  							});
  					}else{
  						 $('#login')[0].reset();
  						 $.toast({
  							    text: "Wrong Credential!",
  							    heading: 'error', 
  							    icon: 'error', 
  							    showHideTransition: 'plain',
  							    allowToastClose: true, 
  							    hideAfter: 5000, 
  							    stack: 5, 
  							    position: 'top-center', 
  							    textAlign: 'left',
  							    loader: true,  
  							});
  					}
  					
  				},
				error:function(jqXHR,textStatus,errorThrown){
					 $.toast({
						    text: "Something went to Wrong On Server!",
						    heading: 'error', 
						    icon: 'error', 
						    showHideTransition: 'plain',
						    allowToastClose: true, 
						    hideAfter: 5000, 
						    stack: 5, 
						    position: 'top-center', 
						    textAlign: 'left',
						    loader: true,  
						});
  				}
  			})
  		})
  	})
  </script>
</body>
</html>
