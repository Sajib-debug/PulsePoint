<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor Added | PulsePoint</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            padding-top: 100px;
        }
        .msg {
            background-color: #fff;
            border-radius: 15px;
            width: 50%;
            margin: 0 auto;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #d32f2f;
        }
        a {
            text-decoration: none;
            background: #e53935;
            color: white;
            padding: 10px 25px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 20px;
            transition: 0.3s;
        }
        a:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>

<%
try {
    // Receive data from the form
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String gender = request.getParameter("gender");
    String bloodgroup = request.getParameter("bloodgroup");
    String address = request.getParameter("address");

    // You can later add email field if you include it in the form
    String email = "";

    // Insert into database
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO donor(id, name, father, mother, mobilenumber, gender, email, bloodgroup, address) VALUES (?,?,?,?,?,?,?,?,?)"
    );

    ps.setInt(1, id);
    ps.setString(2, name);
    ps.setString(3, father);
    ps.setString(4, mother);
    ps.setString(5, mobilenumber);
    ps.setString(6, gender);
    ps.setString(7, email);
    ps.setString(8, bloodgroup);
    ps.setString(9, address);

    int rows = ps.executeUpdate();

    if (rows > 0) {
%>
        <div class="msg">
            <h2>✅ Donor Added Successfully!</h2>
            <p>Thank you, <strong><%= name %></strong>, for registering as a donor.</p>
            <a href="addNewDonor.jsp">Add Another Donor</a>
        </div>
<%
    } else {
%>
        <div class="msg">
            <h2>⚠️ Failed to Add Donor</h2>
            <p>Please try again.</p>
            <a href="addNewDonor.jsp">Go Back</a>
        </div>
<%
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace();
%>
    <div class="msg">
        <h2>❌ Error Occurred!</h2>
        <p><%= e.getMessage() %></p>
        <a href="addNewDonor.jsp">Go Back</a>
    </div>
<%
}
%>

</body>
</html>
