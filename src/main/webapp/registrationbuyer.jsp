<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/byuer.css" type="text/css">
<body>
<body>
	<div>
		<h1 class="heading">BUYER RGISTRATION</h1>
		<div class="main1">
			<img src="image/consumer.jpg" width="100%" height="580px">
			<div class="form2">
				<form action="register" method="post">
					<!--  <input class="in" type="number" name="id" placeholder="Enter Id"><br> -->
					<input class="in" type="text" name="first_name" placeholder="Enter First Name"><br> 
					<input class="in" type="text" name="last_name" placeholder="Enter Last Name"><br> 
					<input class="in" type="email" name="email" placeholder="Enter Email"><br> 
					<input class="in" type="password" name="password" placeholder="Enter Password"><br> 
					<input class="in" type="tel" name="phone" placeholder="Enter Phone"> <br>
					<input type="hidden" name="role" value="buyer" >
					<button class="bt">Submit</button><br>
					<a href="login.jsp" >Login</a>
				</form>
			</div>
		</div>
	</div>

</body>

</html>
</body>

</html>