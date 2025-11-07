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
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
        }

        .message-box {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(8px);
            padding: 40px 50px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 50px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            max-width: 500px;
        }

        h2 {
            color: #ffe3e3;
            margin-bottom: 15px;
        }

        p {
            font-size: 16px;
            color: #f0f0f0;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            background: #ff4b5c;
            padding: 12px 28px;
            border-radius: 12px;
            transition: 0.3s;
        }

        a:hover {
            background: #ff758c;
            color: #fff;
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
                <h2>🎉 Request Submitted Successfully!</h2>
                <p>Thank you <strong><%= name %></strong> for your blood request.<br>We will contact you soon.</p>
<%
            } else {
%>
                <h2>❌ Failed to submit your request!</h2>
                <p>Please try again later.</p>
<%
            }
            ps.close();
        } catch(Exception e) {
%>
            <h2>⚠️ Error Occurred!</h2>
            <p><%= e.getMessage() %></p>
<%
            e.printStackTrace();
        }
    } else {
%>
        <h2>❗ Invalid Form Submission!</h2>
        <p>Please fill all fields correctly.</p>
<%
    }
%>
    <a href="index.jsp">Back to Home</a>
</div>

</body>
</html>
