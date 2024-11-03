<%@page import="com.umar.recruiter.entity.*"%>
<%@page import="java.util.List"%>




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

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background: #f4f4f4;
}

a {
	color: #007BFF;
	text-decoration: none;
	margin-right: 10px;
}

a:hover {
	text-decoration: underline;
}

button {
	padding: 5px 10px;
	background: #d9534f; /* Delete button color */
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	margin-left: 5px;
}

button:hover {
	background: #c9302c; /* Hover effect for delete button */
}

.update-button {
	background: #5cb85c; /* Update button color */
}

.update-button:hover {
	background: #4cae4c; /* Hover effect for update button */
}

select {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	margin-left: 5px;
}

@media ( max-width : 600px) {
	.container {
		padding: 15px;
	}
	button, select {
		font-size: 12px;
	}
	th, td {
		padding: 8px;
	}
}
</style>

<%@ include file="navbar.jsp"%>

<div class="container">
	<h2>Manage Positions</h2>
	<table>
		<thead>
			<tr>
				<th>Company Name</th>
				<th>Manager Name</th>
				<th>Position Name</th>
				<th>Status</th>
				<th>Update Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Position> positions = (List<Position>) request.getAttribute("positions");
			if (positions != null) {
				for (Position position : positions) {
			%>
			<tr>
				<td><%=position.getCompany().getName()%></td>
				<td><%=position.getManager().getName()%></td>
				<td><%=position.getPositionName()%></td>
				<td><%=position.getStatus()%></td>
				<td>

					<form
						action="/recruiter/updatePositionStatus/<%=position.getId()%>"
						method="post" style="display: flex;gap:5px;">
						<select name="status">
							<option value="Active"
								<%="Active".equals(position.getStatus()) ? "selected" : ""%>>Active</option>
							<option value="Hold"
								<%="Hold".equals(position.getStatus()) ? "selected" : ""%>>Hold</option>
							<option value="Completed"
								<%="Completed".equals(position.getStatus()) ? "selected" : ""%>>Completed</option>
						</select>
						<button type="submit" class="update-button">Update Status</button>
					</form>
				</td>
				<td>
					<form action="/recruiter/deletePosition/<%=position.getId()%>"
						method="get" style="display:flex;gap:5px;">
						<a href="/recruiter/positions/edit/<%=position.getId()%>">Edit</a>
						<button type="submit">Delete</button>
					</form>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="5">No positions found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>

