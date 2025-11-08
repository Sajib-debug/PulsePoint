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
    background-color: #E49BA6;
    color: #fff;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Header */
.header {
    background-color: #d90429; /* Bright red */
    padding: 20px 40px;
}
.header a {
    color: white !important;
    text-decoration: none;
    font-weight: 600;
    margin-left: 20px;
    border-radius: 8px;
    padding: 8px 15px;
    transition: 0.3s;
}
.header a:hover, .header a.active {
    background-color: white;
    color: #d90429 !important;
}

/* Login box */
.login-box {
    background: white;
    color: #333;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    padding: 40px;
    width: 100%;
    max-width: 400px;
    margin: 80px auto;
}

/* Inputs */
.form-control {
    border-radius: 30px;
    background: #f8f9fa;
    border: 1px solid #ccc;
    color: #333;
}
.form-control:focus {
    background: #fff;
    border-color: #E49BA6;
    box-shadow: 0 0 0 0.25rem rgba(228,155,166,0.25);
}

/* Button */
.btn-custom {
    background-color: #E49BA6;
    color: white;
    font-weight: bold;
    border-radius: 30px;
    transition: 0.3s;
    border: none;
}
.btn-custom:hover {
    background-color: #d17a8a;
    color: white;
}

/* Footer */
footer {
    margin-top: auto;
    padding: 20px 0;
    text-align: center;
    font-size: 14px;
    color: #fff;
}
</style>
</head>
<body>

<!-- Header -->
<div class="header d-flex justify-content-between align-items-center">
  <div class="fs-4 fw-bold">PulsePoint</div>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<!-- Login Form -->
<div class="login-box text-center">
    <%
        String msg = request.getParameter("msg");
        if("Invalid!".equals(msg)){
    %>
        <div class="alert alert-danger py-2">Invalid Username / Password</div>
    <%
        }
    %>

    <form action="adminLoginAction.jsp" method="post">
        <h3 class="mb-4 fw-semibold text-center" style="color:#E49BA6;">Admin Login</h3>

        <div class="mb-3 text-start">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" class="form-control" placeholder="Enter Username" name="username" required>
        </div>

        <div class="mb-3 text-start">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
        </div>

        <button type="submit" class="btn btn-custom w-50 mt-3">Submit</button>
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
