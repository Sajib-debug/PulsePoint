<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Blood Requests | PulsePoint</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    font-family: "Poppins", sans-serif;
    background-color: #fdf2f2; /* Soft pinkish background */
    color: #333;
    margin: 0;
    padding: 0;
}

/* Header Box */
.header-box {
    max-width: 1200px;
    margin: 30px auto 20px auto;
    background-color: #fff;
    color: #2e3d49;
    text-align: center;
    font-size: 28px;
    font-weight: 600;
    padding: 20px 15px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

/* Table */
#customers {
    width: 90%;
    margin: auto;
    border-collapse: collapse;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

#customers th, #customers td {
    padding: 12px 15px;
    text-align: center;
}

#customers th {
    background-color: #f7c8d0; /* Soft pink header */
    color: #2e3d49;
    font-weight: 600;
    font-size: 16px;
}

#customers tr:nth-child(even) {
    background-color: #fff0f3;
}

#customers tr:hover {
    background-color: #ffe6ec; /* Hover soft pink */
}

/* Action Buttons */
a.actionLink {
    text-decoration: none;
    color: #fff;
    padding: 6px 12px;
    border-radius: 12px;
    font-weight: 600;
    transition: 0.3s;
    font-size: 14px;
}

a.actionLink.done {
    background-color: #4CAF50; /* Green */
}

a.actionLink.done:hover {
    background-color: #388E3C;
}

a.actionLink.delete {
    background-color: #FF6B6B; /* Soft Red */
}

a.actionLink.delete:hover {
    background-color: #E53935;
}

/* Admin Page Button */
.admin-button {
    display: block;
    background-color: #1976d2; /* Professional Blue */
    color: white;
    padding: 12px 25px;
    border-radius: 25px;
    text-align: center;
    font-weight: bold;
    text-decoration: none;
    margin: 30px auto;
    width: 220px;
    transition: 0.3s;
}

.admin-button:hover {
    background-color: #1565c0;
}

/* Footer */
footer {
    text-align: center;
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
}

/* Responsive Table */
@media(max-width:768px){
    #customers th, #customers td {
        padding: 8px;
        font-size: 14px;
    }

    .header-box {
        font-size: 22px;
        padding: 15px 10px;
    }

    .admin-button {
        width: 180px;
        padding: 10px 20px;
    }
}
</style>
</head>
<body>

<!-- Header Box -->
<div class="header-box">
    Pending Blood Requests
</div>

<br>
<div class="table-responsive">
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
                boolean hasData = false;
                while(rs.next()) {
                    String name = rs.getString("name");
                    String mobile = rs.getString("mobilenumber");
                    String email = rs.getString("email");
                    String bloodgroup = rs.getString("bloodgroup");

                    // Skip row if all values are null
                    if ((name == null || name.isEmpty()) &&
                        (mobile == null || mobile.isEmpty()) &&
                        (email == null || email.isEmpty()) &&
                        (bloodgroup == null || bloodgroup.isEmpty())) {
                        continue;
                    }
                    hasData = true;
        %>
        <tr>
            <td><%= name != null ? name : "" %></td>
            <td><%= mobile != null ? mobile : "" %></td>
            <td><%= email != null ? email : "" %></td>
            <td><%= bloodgroup != null ? bloodgroup : "" %></td>
            <td><a class="actionLink done" href="requestForBloodDone.jsp?mobilenumber=<%= mobile %>">Done</a></td>
            <td><a class="actionLink delete" href="requestForBloodDelete.jsp?mobilenumber=<%= mobile %>">Delete</a></td>
        </tr>
        <%
                }
                if(!hasData){
        %>
        <tr>
            <td colspan="6">No pending requests found.</td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: "+ e.getMessage() +"</td></tr>");
            }
        %>
    </table>
</div>

<!-- Admin Page Button -->
<a href="home.jsp" class="admin-button">Admin Page</a>

<footer>
    All Rights Reserved @ PulsePoint | 2025
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
