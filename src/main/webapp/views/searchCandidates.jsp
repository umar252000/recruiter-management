<%@page import="com.umar.recruiter.entity.Company"%>
<%@page import="com.umar.recruiter.entity.Manager"%>
<%@page import="com.umar.recruiter.entity.Position"%>
<%@page import="com.umar.recruiter.entity.Candidate"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Search Candidates</title>
<style>
*, *::before, *::after {
	box-sizing: border-box;
}

.container {
	max-width: 1000px !important;
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
}

form {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

input[type="text"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	flex: 1;
	margin-right: 10px;
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

.table-container {
	max-width: 100%;
	overflow-x: auto; /* Enables horizontal scrolling */
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background: #f4f4f4;
}

form.inline {
	display: inline;
}

select {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	margin-right: 5px;
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

@media ( max-width : 600px) {
	.container {
		padding: 15px;
	}
	button, input[type="text"], select {
		font-size: 14px;
	}
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<h2>Search Candidates</h2>
		<form method="get" action="/recruiter/searchCandidates">
			<input type="text" name="name" placeholder="Search by Name" />
			<button type="submit">Search</button>
		</form>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Qualification</th>
						<th>Designation</th>
						<th>Position</th>
						<th>Manager</th>
						<th>Company</th>
						<th>Status</th>
						<th>Update Position</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates");
					if (candidates != null && !candidates.isEmpty()) {
						for (Candidate candidate : candidates) {
							String positionName = (candidate.getPosition() != null) ? candidate.getPosition().getPositionName()
							: "No Position";
							String managerName = (candidate.getPosition() != null && candidate.getPosition().getManager() != null)
							? candidate.getPosition().getManager().getName()
							: "No Manager";
							String companyName = (candidate.getPosition() != null && candidate.getPosition().getCompany() != null)
							? candidate.getPosition().getCompany().getName()
							: "No Company";
							String status = (candidate.getPosition() != null) ? candidate.getPosition().getStatus() : "No Status";
					%>
					<tr>
						<td><%=candidate.getName()%></td>
						<td><%=candidate.getQualification()%></td>
						<td><%=candidate.getDesignation()%></td>
						<td><%=positionName%></td>
						<td><%=managerName%></td>
						<td><%=companyName%></td>
						<td><%=status%></td>
						<td>
							<form action="/recruiter/updatePosition" method="post"
								class="inline" style="display: flex; gap: 10px;">
								<select name="positionId" required>
									<option value="">Select Position</option>
									<%
									List<Position> positions = (List<Position>) request.getAttribute("positions");
									if (positions != null) {
										for (Position position : positions) {
									%>
									<option value="<%=position.getId()%>"
										<%=candidate.getPosition() != null && candidate.getPosition().getId().equals(position.getId()) ? "selected" : ""%>><%=position.getPositionName()%></option>
									<%
									}
									}
									%>
								</select> <input type="hidden" name="candidateId"
									value="<%=candidate.getId()%>" />
								<button type="submit">Update Position</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="8">No candidates found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<%
		if (candidates != null && !candidates.isEmpty()) {
		%>
		<br>
		<form method="get" action="/recruiter/candidates/export">
			<input type="hidden" name="name"
				value="<%=request.getParameter("name")%>" />
			<button type="submit">Export to Excel</button>
		</form>
		<%
		}
		%>
	</div>
</body>
</html>
