<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@include file="header.html"%>
<html>
<head>
<meta charset="UTF-8">
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
  margin: auto;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #4CAF50;
  color: white;
}

a.actionLink {
    text-decoration: none;
    color: white;
    background-color: #ff4b5c;
    padding: 6px 12px;
    border-radius: 12px;
    font-weight: bold;
    transition: 0.3s;
}

a.actionLink:hover {
    background-color: #d32f2f;
}
</style>
<title>Blood Requests</title>
</head>
<body>
<br>
<center>
    <h2>Pending Blood Requests</h2>
    <table id="customers">
        <tr>
            <th>Name</th>
            <th>Mobile Number</th>
            <th>Email</th>
            <th>Blood Group</th>
            <th>Done</th>
            <th>Delete</th>
        </tr>
        <%
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM bloodrequest WHERE status='pending'");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("mobilenumber") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("bloodgroup") %></td>
            <td><a class="actionLink" href="requestForBloodDone.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Done</a></td>
            <td><a class="actionLink" href="requestForBloodDelete.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Delete</a></td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: "+ e.getMessage() +"</td></tr>");
            }
        %>
    </table>
</center>
<br><br><br>
<h3><center>All Right Reserved @ PulsePoint : 2025</center></h3>
</body>
</html>
