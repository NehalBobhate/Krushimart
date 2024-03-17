<!DOCTYPE html>
<%@page import="krushimart.UserCRUD"%>
<%@page import="krushimart.User"%>
<%@page import="krushimart.Product"%>
<%@page import="java.util.List"%>


<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>Hello, world!</title>
<style>
body {
	background-image: url("image/b1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.post1 {
	position: absolute;
	top: 38%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 480px;
	padding: 80px 40px;
	box-sizing: border-box;
	background-color: rgba(50, 62, 80, 0.7);
	border-radius: 09px;
	margin: 0 auto;
	margin-top: 140px;
}

.data {
	width: 150px;
	font-size: 20px;
	color: white;
	padding: 5px;	
	margin-left: 0px;
	margin-top: -30px;
	font-weight: bolder;
	display:inline-flex;
	line-height: 70px;
	
}
input{
width:250px;
margin-left:10px;
padding:10px;
border-radius:10px;
}
button{
width:350px;
background-color: #00bfff;
padding: 10px;
border-radius: 20px;
margin-top: 20px;
margin-left: 30px;
color:white;
font-size:23px;
}
h1{
text-align: center;
letter-spacing: 10px;
color: green;
margin-top: 20px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<a class="navbar-brand" href="#"><img src="image/logo1.png"
			width="50px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="homePageFamer.jsp">HOME <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp">PROFILE</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="createpost.jsp">POST</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="about.jsp">ABOUT</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="contactfamer.jsp">CONTACT</a></li>
					<li class="nav-item active"><a class="nav-link"
					href="SignUp.jsp">LOGOUT</a></li>
	</nav>
	<%
	HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	User user1=new User();
	UserCRUD crud = new UserCRUD();
	User user = crud.getUser(email);
	List<Product> list = (List) request.getAttribute("List");
	%>
	<h1>CREATE POST</h1>
	<div class="post1">

		<form action="product" method="post">
			<!--  <label class="data">Id  </label><input type="number" name="id"><br>-->
			<label class="data">Product Name </label> <input type="text"
				name="product_name"><br> <label class="data">Price
			</label><input type="number" name="price"> <br>
			<label class="data"> Quantity </label> <input type="number"
				name="quantity"><br>
				<input type="hidden" name="user_id" value="<%=user.getId()%>" readonly="true">
			<button>POST</button>
		</form>
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
</body>
</html>

