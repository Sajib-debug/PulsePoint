<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Completed Blood Requests | PulsePoint</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(120deg, #fff0f2, #ffe5e5);
    margin: 0;
    padding: 0;
}

/* Header Box */
.header-box {
    max-width: 1200px;
    margin: 30px auto 20px auto;
    background-color: #fce4ec;
    color: #d81b60;
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    padding: 20px 15px;
    border-radius: 20px;
    box-shadow: 0px 6px 20px rgba(0,0,0,0.1);
}

/* Table */
.table-custom {
    width: 90%;
    margin: 20px auto;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}

.table-custom th {
    background-color: #d81b60;
    color: white;
    font-weight: 600;
    text-align: center;
}

.table-custom td {
    text-align: center;
    vertical-align: middle;
}

.table-custom tr:nth-child(even){background-color: #fff0f2;}
.table-custom tr:hover {background-color: #ffe5e5; transition: 0.3s;}

/* Admin Page Button */
.admin-button {
    display: inline-block;
    background: linear-gradient(135deg, #d81b60, #f06292);
    color: white;
    padding: 12px 30px;
    border-radius: 30px;
    font-weight: 600;
    text-decoration: none;
    margin: 30px auto 50px auto;
    transition: transform 0.3s, box-shadow 0.3s;
}
.admin-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(216,27,96,0.3);
}

/* Footer */
footer {
    text-align: center;
    padding: 15px 0;
    color: #555;
    font-size: 14px;
}

/* Responsive */
@media(max-width:768px){
    .table-custom {
        width: 100%;
        font-size: 14px;
    }
    .header-box {
        font-size: 24px;
        padding: 18px 10px;
    }
}
</style>
</head>
<body>

<!-- Header Box -->
<div class="header-box">
    Completed Blood Requests 🩸
</div>

<!-- Table -->
<div class="table-responsive">
    <table class="table table-custom table-striped table-hover">
        <thead>
            <tr>
                <th>Name</th>
                <th>Mobile Number</th>
                <th>Email</th>
                <th>Blood Group</th>
            </tr>
        </thead>
        <tbody>
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
                <td colspan="4">No completed requests found 🛑</td>
            </tr>
            <%
                    }
                } catch(Exception e) {
                    out.println("<tr><td colspan='4'>Error: "+ e.getMessage() +"</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

<!-- Admin Page Button -->
<div class="text-center">
    <a href="home.jsp" class="admin-button">🏠 Admin Page</a>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 PulsePoint | All Rights Reserved
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
