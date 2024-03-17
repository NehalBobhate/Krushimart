<!DOCTYPE html>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>KrushiMart | SignUp</title>
<link rel="stylesheet" href="css/registration.css" type="text/css">
</head>
<body>


	<div class="maindiv" id="bgimg">
		<div class="applogo">
			<h1>
				<img src="image/logo1.png" alt="logo" class="logoimg">
				<div class="mart tracking-in-expand">MART</div>
			</h1>
		</div>
		<div style="padding: 5px; size: 25px; text-align: center; padding-top:20px">
			<%
			String message = (String) request.getAttribute("message");
			if (message != null) {
			%>
			<%=message%>
			<%
			}
			%>
		</div>

		<div class="cards">
			<div class="farmer cardreg">
				<div class="common-card" align="center">
					<h3 class="heading">FARMER</h3>
					<div>
						<img src="https://cdn-icons-png.flaticon.com/512/3319/3319221.png"
							alt="famericon" width="110px" class="farmer_icon">
					</div>
					<div class="signup">
						<a href="registrationfarmer.jsp">SIGN UP</a>
					</div>

				</div>
			</div>
			<div class="buyer cardreg">
				<div class="common-card" align="center">
					<h3 class="heading">CONSUMER</h3>
					<div>
						<img src="https://cdn-icons-png.flaticon.com/512/2760/2760970.png"
							alt="famericon" width="110px" class="farmer_icon">
					</div>
					<div class="signup">
						<a href="registrationbuyer.jsp">SIGN UP</a>
					</div>
					<div class="signup"
						style="position: absolute; top: 90%; left: 40%;">
						<a href="login.jsp">LOGIN</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>



