<%@page import="com.umar.recruiter.entity.Company"%>
<%@page import="com.umar.recruiter.entity.Manager"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert New Position</title>
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
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin: 10px 0 5px;
        font-weight: bold;
    }

    select, input[type="text"], textarea {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    select:focus, input[type="text"]:focus, textarea:focus {
        border-color: #4CAF50;
        outline: none;
    }

    button {
        padding: 10px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #45a049;
    }

    a {
        text-align: center;
        display: block;
        color: #007BFF;
        text-decoration: none;
        text-align: center;
    }

    a:hover {
        text-decoration: underline;
    }

    @media (max-width: 600px) {
        .container {
            padding: 15px;
        }

        button, select, input[type="text"], textarea {
            font-size: 14px;
        }
    }
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<h2>Insert New Position</h2>
		<form action="/recruiter/insertPosition" method="post">
			<label for="company">Company:</label>
			<select name="companyId" id="company" required>
				<option value="">Select Company</option>
				<%
				List<Company> companies = (List<Company>) request.getAttribute("companies");
				for (Company company : companies) {
				%>
				<option value="<%=company.getId()%>"><%=company.getName()%></option>
				<%
				}
				%>
			</select>

			<label for="manager">Manager:</label>
			<select name="managerId" id="manager" required>
				<option value="">Select Manager</option>
				<%
				List<Manager> managers = (List<Manager>) request.getAttribute("managers");
				for (Manager manager : managers) {
				%>
				<option value="<%=manager.getId()%>"><%=manager.getName()%></option>
				<%
				}
				%>
			</select>

			<label for="positionName">Position Name:</label>
			<input type="text" name="positionName" id="positionName" required />

			<label for="jobDescription">Job Description:</label>
			<textarea name="jobDescription" id="jobDescription" required></textarea>

			<button type="submit">Add Position</button>
		</form>
	</div>
</body>
</html>
