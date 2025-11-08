<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<html>
<head>
<style>
/* Table Styles */
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
  margin: 0 auto;
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

/* Header Box */
.header-box {
    max-width: 900px;
    margin: 30px auto 20px auto;
    background-color: #ffd6dc; /* pastel pink */
    color: #d32f2f;
    text-align: center;
    font-size: 26px;
    font-weight: 600;
    padding: 20px 15px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
    letter-spacing: 0.5px;
}

/* Button */
.button {
    display: inline-block;
    margin: 30px auto;
    background-color: #1976d2;
    color: white;
    padding: 10px 25px;
    border-radius: 20px;
    text-decoration: none;
    font-size: 15px;
    transition: 0.3s;
}

.button:hover {
    background-color: #0d47a1;
}

/* Footer */
h3 {
    text-align: center;
    color: gray;
    margin-top: 40px;
    font-size: 13px;
}
</style>
</head>
<body>

<!-- Header Box -->
<div class="header-box">
    Edit/Delete/List Donor
</div>

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

<!-- Admin Page Button -->
<center>
    <a href="home.jsp" class="button">Admin Page</a>
</center>

<h3>All Right Reserved @ PulsePoint : 2025</h3>

</body>
</html>
