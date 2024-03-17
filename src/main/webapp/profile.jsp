<%@page import="krushimart.ProductCRUD"%>
<%@page import="krushimart.Product"%>
<%@page import="java.util.List"%>
<%@page import="krushimart.UserCRUD"%>
<%@page import="krushimart.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
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
<link rel="stylesheet" href="css/Profile.css">
</head>
<style>
body {
	background-image: url("image/b1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
.main-post {
	border: 2px solid black;
	border-radius: 10px;
	width: 500px;
	justify-content: center;
	margin-top: 20px;
	padding: 10px;
	margin-left: 32%;
	background-color: white;
	opacity: 0.9;
}

.img1 {
	position: relative;
	border: 2px solid black;
	border-radius: 5px;
	margin: 10px;
	display: inline-block;
}

.abt-post {
	position: absolute;
	display: inline-block;
	border-radius: 10px;
	margin-left: 20px;
	line-height: 25px;
	color: black;
	font-weight: bolder;
	font-size: 20px;
}
</style>
<body>

	<%
	HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	UserCRUD crud = new UserCRUD();
	User user = crud.getUser(email);
	%>
	<%
	ProductCRUD productCRUD = new ProductCRUD();
	int id = user.getId();
	List<Product> list = productCRUD.getPostById(id);
	request.setAttribute("List", list);
	%>
	
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
	<div style="text-align: center; font-size: 25px; padding: 10px">
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<%=message%>
		<%
		}
		%></div>

	<div class="main">
	<h3>FARMER PROFILE</h3>
		<img src="image/profile.png" class="img"> <br>
		<h3 class="name">
			<%=user.getFirst_name()%>
		</h3>
	</div>

	<div class="sub-main">
		<label class="data">ID</label>:<p class="data2"><%=user.getId()%></p><br>
		<label class="data">First Name</label>:<p class="data2"><%=user.getFirst_name()%></p><br>
		<label class="data">Last Name</label>:<p class="data2"><%=user.getLast_name()%></p><br>
		<label class="data">Email</label>:<p class="data2"><%=user.getEmail()%></p><br>	
		<label class="data">Phone</label>:<p class="data2"><%=user.getPhone()%></p><br>	
		<input type="hidden" value="<%=user.getPassword() %>">
		<input type="hidden" value="<%=user.getRole() %>">
	</div>
	
	<div class="action">
	<button style="background-color:green;"><a href="edit.jsp" style="text-decoration:none; color:white;">Edit Profile</a></button>
	  <button style="background-color:#1e90ff"><a href="changePassword.jsp" style="text-decoration:none; color:white;">Change Password</a></button>
	<button style="background-color:red"> <a href="createpost.jsp" style="text-decoration:none; color:white;">Add Post</a></button>
	
	</div>

<%
	List<Product> list1 = (List) request.getAttribute("List");
	%>
	<%
			for (Product product : list1) {
			%>

	<div class="main-post">
		<img src="image/p.jpeg" alt="" width="150px" height="150px" class="img1">
		<div class="abt-post">
			<label for="">PRODUCT NAME : <%= product.getProduct_name() %> </label><br> 
			<label for="">QUANTITY : <%=product.getQuantity() %></label><br>
			<label for="">PRICE : <%=product.getPrice() %></label><br>
		<a href="delete?id=<%=product.getId()%>"><button class="btn btn-danger" >DELETE</button></a>
		</div>
	</div>
<%} %>









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

