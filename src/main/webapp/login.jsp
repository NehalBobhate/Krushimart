<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KrushiMart | Login</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
	<div style="text-align: center; font-size: 25px; padding: 10px; color:white">
		<%
		String message2 = (String) request.getAttribute("message2");
		if (message2 != null) {
		%>
		<%=message2%>
		<%
		}
		%>
		</div>
		
		
		<div class="container">
			<img src="image/loginlogo.png" class="user">
			
			
			<h3>LOGIN</h3>

			<form action="login" method="post">
				
				<input type="text" name="email" placeholder="Enter Your Email">

				<input type="password" name="password"
					placeholder="Enter Your Password"><br> 
					<span style="color: white;font-weight: bolder;">
					<div style="text-align:center"><%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<%=message%>
		<%
		}
		%></div>
		</span> <input	type="submit" name="submit" value="LOGIN"> 
					<a href="forgotpassword.jsp" class="forgot">Forgot Password ?</a>
				<button class="createat">
					<a href="SignUp.jsp" style="text-decoration:none; color:black;">Create Account</a>
				</button>
				
			</form>
		</div>
	
</body>
</html>