<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/editProfile.css" type="text/css">
<style>
body {
	background-image: url("image/b1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

</style>
</head>
<body>
<%
	HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	UserCRUD crud = new UserCRUD();
	User user = crud.getUser(email);
	%>
	<div>
		<h1>EDIT PROFILE</h1>
		
			
			<div class="form">
				<form action="edit" method="post">
					<input class="input1" type="number" name="id"
						placeholder="Enter ID" value="<%= user.getId() %>" readonly="true"><br> <input class="input1"
						type="text" name="first_name" placeholder="Enter Name" value="<%= user.getFirst_name() %>"> <input
						class="input1" type="text" name="last_name"
						placeholder="Enter Last Name" value="<%= user.getLast_name() %>"><br> <input
						class="input1" type="email" name="email" placeholder="Enter Email" value="<%= user.getEmail() %>" readonly="true">
					 <input
						class="input1" type="tel" name="phone"
						placeholder="Enter Phone No" value="<%= user.getPhone() %>">
						<input
						class="input1" type="hidden" name="password"
						placeholder="Enter Password" value="<%= user.getPassword() %>" >
						<input
						class="input1" type="text" name="role"
						placeholder="Enter Role" value="<%= user.getRole() %>" readonly="true"> 
					<button>Update</button><br><br>
					
				</form>
			</div>
		</div>
	

</body>

</html>
</body>
</html>