<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Recruiter Management</title>
<style>
    *, *::before, *::after {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    p {
        font-size: 16px;
        text-align: center;
        color: #555;
        margin-bottom: 15px;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        background: #e9ecef;
        margin: 10px 0;
        padding: 10px;
        border-radius: 4px;
    }

    .feature-title {
        font-weight: bold;
        color: #333;
    }

    @media (max-width: 600px) {
        .container {
            padding: 15px;
        }
    }
</style>
</head>
<body>
    
    <%@ include file="navbar.jsp" %>
    
    <div class="container">
        <h2>Dashboard</h2>
        <p>Welcome to the Recruiter Management Dashboard</p>
        <p>Here are the key features of this project:</p>
        <ul>
            <li>
                <span class="feature-title">User Authentication:</span> Secure login for recruiters to access their dashboard and manage data effectively.
            </li>
            <li>
                <span class="feature-title">Candidate Management:</span> Insert, update, search, and delete candidate profiles, making it easy to keep track of potential hires.
            </li>
            <li>
                <span class="feature-title">Position Management:</span> Create and manage job positions, including details like the company, manager, and job description.
            </li>
            <li>
                <span class="feature-title">Status Tracking:</span> Update and track the status of job positions (Active, Hold, Completed), ensuring clarity in hiring processes.
            </li>
            <li>
                <span class="feature-title">Responsive Design:</span> User-friendly interface that works seamlessly across desktops, tablets, and smartphones.
            </li>
            <li>
                <span class="feature-title">Data Export:</span> Export candidate data to Excel for reporting and analysis, facilitating data-driven decision-making.
            </li>
        </ul>
    </div>
    
</body>
</html>
