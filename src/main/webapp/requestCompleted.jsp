<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<html>
<head>
<meta charset="UTF-8">
<style>
body {
    font-family: "Poppins", sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

/* Header Box */
.header-box {
    max-width: 1200px;
    margin: 30px auto 20px auto;
    background-color: #c8e6c9;
    color: #2e7d32;
    text-align: center;
    font-size: 28px;
    font-weight: 600;
    padding: 20px 15px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
}

/* Table */
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

/* Admin Page Button */
.admin-button {
    display: block;
    background-color: #4CAF50;
    color: white;
    padding: 10px 25px;
    border-radius: 25px;
    text-align: center;
    font-weight: bold;
    text-decoration: none;
    margin: 30px auto;
    width: 200px;
}

.admin-button:hover {
    background-color: #388E3C;
}

h2 {
    text-align: center;
    color: #2e7d32;
    margin-bottom: 20px;
}
</style>
<title>Completed Blood Requests</title>
</head>
<body>

<!-- Header Box -->
<div class="header-box">
    Completed Blood Requests
</div>

<br>
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

<!-- Admin Page Button -->
<a href="home.jsp" class="admin-button">Admin Page</a>

<br><br>
<h3><center>All Right Reserved @ PulsePoint : 2025</center></h3>

</body>
</html>
