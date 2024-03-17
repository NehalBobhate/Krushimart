<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/famerRegistration.css" type="text/css">
</head>
<body>

	<div>
		<h1>FARMER RGISTRATION</h1>
		<div class="main">
			<img src="image/far.jpg" width="100%" height="580px">
			<div class="form">
				<form action="register" method="post">
					<!--  <input class="input1" type="number" name="id"
						placeholder="Enter ID">--><br> <input class="input1"
						type="text" name="first_name" placeholder="Enter Name"> <input
						class="input1" type="text" name="last_name"
						placeholder="Enter Last Name"><br> <input
						class="input1" type="email" name="email" placeholder="Enter Email">
					<input class="input1" type="password" name="password"
						placeholder="Enter Password"><br> <input
						class="input1" type="tel" name="phone"
						placeholder="Enter Phone No"> <input types="hidden"
						name="role" value="farmer" hidden> 
					<button>Submit</button><br><br>
					<a href="login.jsp" style="text-decoration: none; font-size:30px; margin-left:40%; color:blue;">Login</a>
				</form>
			</div>
		</div>
	</div>

</body>

</html>
</body>
</html>