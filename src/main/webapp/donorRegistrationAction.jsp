<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donor Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(to right, #fff5f5, #ffe5e5);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.popup {
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    padding: 30px 40px;
    text-align: center;
    max-width: 400px;
    animation: fadeIn 0.5s ease-in-out;
}
.popup h2 {
    color: #E49BA6;
    font-size: 2rem;
    margin-bottom: 15px;
}
.popup p {
    font-size: 1rem;
    color: #555;
    margin-bottom: 25px;
}
.btn-custom {
    background: #E49BA6;
    color: #fff;
    font-weight: 600;
    border-radius: 25px;
    padding: 10px 25px;
    text-decoration: none;
    transition: 0.3s;
}
.btn-custom:hover {
    background: #d57d8c;
}
.heart {
    color: #ff0000;
    animation: heartbeat 1s infinite;
    font-size: 2rem;
}
@keyframes heartbeat {
    0%, 40%, 80%, 100% { transform: scale(1); }
    20%, 60% { transform: scale(1.3); }
}
@keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
</style>
</head>
<body>

<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String mobilenumber = request.getParameter("mobile");
    String email = request.getParameter("email");
    String bloodgroup = request.getParameter("bloodgroup");
    String address = request.getParameter("address");

    boolean success = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bloodbank", "root", "root");
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO donorregistration VALUES (?, ?, ?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, age);
        ps.setString(3, gender);
        ps.setString(4, mobilenumber);
        ps.setString(5, email);
        ps.setString(6, bloodgroup);
        ps.setString(7, address);

        int result = ps.executeUpdate();
        if(result > 0) success = true;
        con.close();
    } catch(Exception e) {
        out.println("<p style='color:red;'>"+e+"</p>");
    }

    if(success){
%>
<div class="popup">
    <h2>✅ <span class="heart">❤</span> Registration Successful!</h2>
    <p>Thank you, <b><%=name%></b>! Your details have been saved successfully.</p>
    <a href="donorRegistration.jsp" class="btn-custom">Register Another Donor</a>
    <br><br>
    <a href="index.jsp" class="btn-custom">Back to Home</a>
</div>
<%
    } else {
%>
<div class="popup">
    <h2 style="color:red;">❌ Registration Failed!</h2>
    <p>Something went wrong. Please try again.</p>
    <a href="donorRegistration.jsp" class="btn-custom">Back</a>
</div>
<%
    }
%>

</body>
</html>
