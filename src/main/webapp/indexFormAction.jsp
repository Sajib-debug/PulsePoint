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
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .message-box {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
            padding: 40px 50px;
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            max-width: 500px;
            width: 90%;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            color: #ffd6d6;
            margin-bottom: 15px;
            font-size: 26px;
        }

        p {
            font-size: 16px;
            color: #f0f0f0;
            line-height: 1.5;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            background: #ff4b5c;
            padding: 12px 28px;
            border-radius: 15px;
            transition: 0.3s;
        }

        a:hover {
            background: #ff758c;
            color: #fff;
        }

        .icon {
            font-size: 50px;
            margin-bottom: 15px;
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
                <div class="icon">🎉</div>
                <h2>Request Submitted Successfully!</h2>
                <p>Thank you <strong><%= name %></strong> for your blood request.<br>We will contact you soon.</p>
<%
            } else {
%>
                <div class="icon">❌</div>
                <h2>Failed to submit your request!</h2>
                <p>Please try again later.</p>
<%
            }
            ps.close();
        } catch(Exception e) {
%>
            <div class="icon">⚠️</div>
            <h2>Error Occurred!</h2>
            <p><%= e.getMessage() %></p>
<%
            e.printStackTrace();
        }
    } else {
%>
        <div class="icon">❗</div>
        <h2>Invalid Form Submission!</h2>
        <p>Please fill all fields correctly.</p>
<%
    }
%>
    <a href="index.jsp">Back to Home</a>
</div>

</body>
</html>
