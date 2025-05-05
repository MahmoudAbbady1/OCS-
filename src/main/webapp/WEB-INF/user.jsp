<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Your Balance Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }
        .header {
            background-color: #1a73e8;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        .card {
            background-color: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .balance-card {
            background-color: #1a73e8;
            color: white;
        }
        .logout-btn {
            background-color: transparent;
            border: 1px solid white;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
        <form action="/Balancer/LogoutServlet" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
    
    <div class="container">
        <div class="dashboard">
            <div class="card balance-card">
                <h3>Current Balance</h3>
                <p style="font-size: 2rem; margin: 1rem 0;">$<%= session.getAttribute("balance") != null ? session.getAttribute("balance") : "0.00" %></p>
            </div>
            <div class="card">
                <h3>Recent Transactions</h3>
                <p>No recent transactions</p>
            </div>
            <div class="card">
                <h3>Account Settings</h3>
                <p>Manage your account preferences</p>
            </div>
        </div>
    </div>
</body>
</html> 