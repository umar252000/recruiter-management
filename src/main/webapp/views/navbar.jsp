<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Recruiter Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    header {
        background: #4CAF50;
        color: #fff;
        padding: 15px 20px;
        text-align: center;
    }

    nav {
        display: flex;
        justify-content: center;
        background: #333;
        padding: 10px 0;
        align-items:center;
    }

    nav a {
        color: #fff;
        padding: 14px 20px;
        text-decoration: none;
        text-align: center;
        transition: background 0.3s;
    }

    nav a:hover {
        background: #575757;
    }

    .logout {
        background: #f44336; /* Red color */
        color: white;
        border: none;
        padding: 14px 20px;
        text-decoration: none;
        text-align: center;
        cursor: pointer;
        transition: background 0.3s;
    }

    .logout:hover {
        background: #d32f2f; /* Darker red */
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 600px) {
        nav {
            flex-direction: column;
        }
        nav a, .logout {
            padding: 10px;
        }
    }
</style>
</head>
<body>
    <header>
        <h2>Welcome to the Recruiter Management</h2>
    </header>
    <nav>
        <a href="/recruiter/insertCandidate">Insert Candidate</a>
        <a href="/recruiter/searchCandidates">Search Candidates</a>
        <a href="/recruiter/insertPosition">Insert Position</a>
        <a href="/recruiter/searchPositions">Search Positions</a>
        <form action="/recruiter/login" method="get" style="margin: 0;">
            <button type="submit" class="logout">Logout</button>
        </form>
    </nav>
    
</body>
</html>
