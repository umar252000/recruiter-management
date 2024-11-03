<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recruiter Login</title>
<style>
*, *::before, *::after {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background: white;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 400px;
	width: 100%;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

button {
	width: 100%;
	padding: 10px;
	background: #5cb85c; /* Green background */
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

button:hover {
	background: #4cae4c; /* Darker green on hover */
}

@media ( max-width : 600px) {
	.container {
		padding: 15px;
	}
	button, input {
		font-size: 12px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<h2>Recruiter Login</h2>
		<%
		String errorMessage = (String) request.getAttribute("error");
		if (errorMessage != null) {
		%>
		<div style="color: red;"><%=errorMessage%></div>
		<%
		}
		%>


		<form action="/recruiter/login" method="post">
			<input type="text" name="username" placeholder="Username" required />
			<input type="password" name="password" placeholder="Password"
				required />
			<button type="submit">Login</button>
		</form>
	</div>
</body>
</html>
