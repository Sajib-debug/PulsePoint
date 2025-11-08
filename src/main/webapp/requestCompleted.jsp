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

h2 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 20px;
}
</style>
<title>Completed Blood Requests</title>
</head>
<body>
<br>
<h2>Completed Blood Requests</h2>
<center>
    <table id="customers">
        <tr>
            <th>Name</th>
            <th>Mobile Number</th>
            <th>Email</th>
            <th>Blood Group</th>
        </tr>
        <%
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM bloodrequest WHERE status='done'");
                boolean hasData = false;
                while(rs.next()) {
                    hasData = true;
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("mobilenumber") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("bloodgroup") %></td>
        </tr>
        <%
                }
                if(!hasData){
        %>
        <tr>
            <td colspan="4">No completed requests found.</td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='4'>Error: "+ e.getMessage() +"</td></tr>");
            }
        %>
    </table>
</center>

<br><br><br>
<h3><center>All Right Reserved @ PulsePoint : 2025</center></h3>
</body>
</html>
