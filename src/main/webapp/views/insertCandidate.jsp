<%@page import="com.umar.recruiter.entity.Position"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert Candidate</title>
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

    input[type="text"], input[type="email"], input[type="number"], select {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    input:focus, select:focus {
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

        button, input[type="text"], input[type="email"], input[type="number"], select {
            font-size: 14px;
        }
    }
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">
		<h2>Insert Candidate</h2>
		<form action="/recruiter/insertCandidate" method="post">
			<input type="text" name="name" placeholder="Name" required />
			<input type="text" name="contactNumber" placeholder="Contact Number" required />
			<input type="email" name="emailId" placeholder="Email ID" required />
			<input type="text" name="qualification" placeholder="Qualification" required />
			<input type="text" name="yearOfPassing" placeholder="Year of Passing" required />
			<input type="number" name="experience" placeholder="Experience (in years)" required />
			<input type="text" name="designation" placeholder="Designation" required />
			<input type="number" name="ctc" placeholder="CTC" required />
			<input type="number" name="expectedCtc" placeholder="Expected CTC" required />
			<input type="text" name="noticePeriod" placeholder="Notice Period" required />
			<select name="positionId" required>
				<option value="">Select Position</option>
				<%
				List<Position> positions = (List<Position>) request.getAttribute("positions");
				if (positions != null) {
					for (Position position : positions) {
				%>
				<option value="<%=position.getId()%>"><%=position.getPositionName()%></option>
				<%
					}
				}
				%>
			</select>

			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>
