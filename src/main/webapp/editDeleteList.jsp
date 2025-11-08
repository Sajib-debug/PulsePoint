<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>

<center>
<table id="customers">
<tr>
<th>ID</th>
<th>Name</th>
<th>Father</th>
<th>Mother</th>
<th>Mobile</th>
<th>Gender</th>
<th>Email</th>
<th>Blood Group</th>
<th>Address</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from donor");
		while(rs.next())
		{
%>
	<tr>
		<td><%= rs.getInt("id") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("father") %></td>
		<td><%= rs.getString("mother") %></td>
		<td><%= rs.getString("mobilenumber") %></td>
		<td><%= rs.getString("gender") %></td>
		<td><%= rs.getString("email") %></td>
		<td><%= rs.getString("bloodgroup") %></td>
		<td><%= rs.getString("address") %></td>
		<td><a href="updateDonor.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
		<td><a href="deleteDonor.jsp?id=<%= rs.getInt("id") %>">Delete</a></td>
	</tr>
<%
		}
	}catch(Exception e){
		out.println("<tr><td colspan='11'>Error: "+e.getMessage()+"</td></tr>");
	}
%>
</table>
</center>

<br><br><br>
<h3><center>All Right Reserved @ PulsePoint : 2025</center></h3>
</body>
</html>
