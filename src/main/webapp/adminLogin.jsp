<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PulsePoint | Admin Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #ffe5ec, #fff0f5);
    color: #333;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Header */
.header {
    background: linear-gradient(135deg, #ffb4c7, #e46a84);
    color: #fff;
    padding: 20px 30px;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.15);
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.header a {
    color: #fff !important;
    margin-left: 20px;
    text-decoration: none;
    font-weight: 600;
    padding: 8px 15px;
    border-radius: 25px;
    transition: 0.3s;
}
.header a:hover, .header a.active {
    background: #fff;
    color: #e46a84 !important;
}

/* Login Card */
.login-card {
    background: #fff;
    border-radius: 25px;
    box-shadow: 0 15px 40px rgba(228,106,132,0.2);
    padding: 50px 35px;
    max-width: 450px;
    margin: 80px auto;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.login-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 25px 50px rgba(228,106,132,0.3);
}

/* Heading */
.login-card h3 {
    color: #e46a84;
    font-weight: 700;
    margin-bottom: 30px;
    text-align: center;
}

/* Inputs */
.form-control {
    border-radius: 30px;
    border: 1px solid #ffd5df;
    padding: 12px 20px;
    background: #fdf2f5;
    transition: all 0.3s ease;
}
.form-control:focus {
    background: #fff;
    border-color: #e46a84;
    box-shadow: 0 0 0 0.25rem rgba(228,106,132,0.25);
}

/* Button */
.btn-custom {
    background: linear-gradient(135deg, #ffb4c7, #e46a84);
    color: white;
    font-weight: 600;
    border-radius: 25px;
    border: none;
    padding: 12px 30px;
    width: 50%;
    transition: 0.3s;
}
.btn-custom:hover {
    background: linear-gradient(135deg, #ff8ea9, #d75472);
    transform: scale(1.05);
}

/* Alert */
.alert {
    border-radius: 20px;
    padding: 10px 15px;
    font-size: 0.95rem;
}

/* Footer */
footer {
    margin-top: auto;
    padding: 20px 0;
    text-align: center;
    font-size: 14px;
    color: #555;
}

/* Responsive */
@media(max-width: 576px){
    .login-card {
        padding: 35px 25px;
        margin: 50px 15px;
    }
    .btn-custom { width: 100%; }
    .header { flex-direction: column; align-items: flex-start; gap: 10px; }
}
</style>
</head>
<body>

<!-- Header -->
<div class="header">
  <div class="fs-4 fw-bold">PulsePoint ❤</div>
  <div>
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<!-- Login Form -->
<div class="login-card text-center">
    <%
        String msg = request.getParameter("msg");
        if(msg != null && msg.equals("Invalid!")){
    %>
        <div class="alert alert-danger py-2">&#10060; Invalid Username / Password</div>
    <%
        }
    %>

    <h3>&#128273; Admin Login</h3>

    <form action="adminLoginAction.jsp" method="post">
        <div class="mb-3 text-start">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" class="form-control" placeholder="Enter Username" name="username" required>
        </div>

        <div class="mb-3 text-start">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
        </div>

        <button type="submit" class="btn btn-custom mt-3">Login</button>
    </form>
</div>

<!-- Footer -->
<footer>
    2025 &copy; PulsePoint | All Rights Reserved
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
