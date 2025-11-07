<%@ page import="java.sql.*, Project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PulsePoint | Request Status</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            text-align: center;
            padding: 50px;
            background: linear-gradient(120deg, #ff4b5c, #ff758c, #d32f2f);
            color: white;
        }
        .message-box {
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
            display: inline-block;
            margin-top: 50px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            background: #e63946;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }
        a:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>

<div class="message-box">
<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String bloodgroup = request.getParameter("bloodgroup");
    String status = "pending";

    if(name != null && mobile != null && email != null && bloodgroup != null) {
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bloodrequest(name, mobilenumber, email, bloodgroup, status) VALUES(?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, email);
            ps.setString(4, bloodgroup);
            ps.setString(5, status);

            int result = ps.executeUpdate();
            if(result > 0) {
%>
                <h2>Request Submitted Successfully!</h2>
                <p>Thank you <strong><%= name %></strong> for your blood request. We will contact you soon.</p>
<%
            } else {
%>
                <h2>Failed to submit your request!</h2>
                <p>Please try again later.</p>
<%
            }
            ps.close();
        } catch(Exception e) {
%>
            <h2>Error Occurred!</h2>
            <p><%= e.getMessage() %></p>
<%
            e.printStackTrace();
        }
    } else {
%>
        <h2>Invalid Form Submission!</h2>
        <p>Please fill all fields.</p>
<%
    }
%>
    <a href="index.jsp">Back to Home</a>
</div>

</body>
</html>
