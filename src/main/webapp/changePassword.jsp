<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <% HttpSession httpSession = request.getSession();
        System.out.println(httpSession);
        String email = (String) httpSession.getAttribute("session");
        UserCRUD crud = new UserCRUD();
        User user = crud.getUser(email); %>

    <div>
        <form action="changepd" method="post">
            <label>Password</label>
        Enter New Password: <input type="text" name="password" value="<%= user.getPassword() %>">
            <input type="text" name="email" value="<%=user.getEmail()%>" readonly="true">
            <input type="text" name="role" value="<%=user.getRole()%>" readonly="true">
            <button>Change Password</button>
        </form>
    </div>
</body>
</html>
