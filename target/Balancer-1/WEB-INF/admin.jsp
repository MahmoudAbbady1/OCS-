<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        .form-container {
            margin: 20px 0;
            padding: 10px;
            background: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        label {
            display: inline-block;
            margin-right: 10px;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 5px 0;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .section-title {
            margin-top: 40px;
            color: #34495e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>

        <!-- List -->
        <h2 class="section-title">Users List</h2>
        <form action="/Balancer/ListAdminServlet" method="post" class="form-container">
            <input type="submit" value="Show Users">
        </form>

        <!-- Delete -->
        <h2 class="section-title">Delete User</h2>
        <form action="/Balancer/DeleteAdminServlet" method="post" class="form-container">
            <label for="deleteUserId">User ID:</label>
            <input type="text" id="deleteUserId" name="userId" required>
            <input type="submit" value="Delete User">
        </form>

        <!-- Edit-->
        <h2 class="section-title">Edit User</h2>
        <form action="/Balancer/EditUserServlet" method="post" class="form-container">
            <label for="editUserId">User ID:</label>
            <input type="text" id="editUserId" name="userId" required>
            <label for="editBalance">New Balance:</label>
            <input type="text" id="editBalance" name="newBalance" required>
            <input type="submit" value="Edit User">
        </form>

        <!--  Create -->
        <h2 class="section-title">Create New User</h2>
        <form action="/Balancer/CreateUserServlet" method="post" class="form-container">
            <label for="newUserId">User ID:</label>
            <input type="text" id="newUserId" name="userId" required>
            <label for="newBalance">Balance:</label>
            <input type="text" id="newBalance" name="balance" required>
            <input type="submit" value="Create User">
        </form>
    </div>
</body>
</html>