<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Blood Bank</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
  font-family: "Poppins", sans-serif;
  background: linear-gradient(to right, #fff 60%, #fff5f5 40%);
  color: #333;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
}

/* Header */
.header {
  background: #E49BA6; /* Soft pink color */
  box-shadow: 0 2px 10px rgba(0,0,0,0.15);
  padding: 15px 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: sticky;
  top: 0;
  z-index: 1000;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.header h2 {
  color: #fff;
  font-weight: 700;
  letter-spacing: 1px;
}

.header a {
  color: #fff;
  text-decoration: none;
  font-weight: 600;
  margin-left: 25px;
  transition: 0.3s;
}

.header a:hover {
  color: #ffd9e0;
  text-decoration: underline;
}

/* Heart Animation */
.heart {
  color: #ff0000; /* Red heart */
  animation: heartbeat 1.2s infinite;
}
@keyframes heartbeat {
  0%, 40%, 80%, 100% { transform: scale(1); }
  20%, 60% { transform: scale(1.3); }
}

/* Main section */
.main {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  padding: 60px 5%;
}

/* Form box */
.form-box {
  background: #ffffff;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  border-radius: 15px;
  width: 360px;
  padding: 35px 25px;
  text-align: center;
  transition: 0.3s;
}
.form-box:hover {
  transform: translateY(-5px);
}

.form-box h1 {
  color: #E49BA6;
  margin-bottom: 25px;
  font-weight: 700;
}

.form-control {
  border-radius: 8px;
  padding: 10px 15px;
  margin-bottom: 15px;
  border: 1px solid #f5c1ca;
}

.btn-custom {
  background: #E49BA6;
  color: #fff;
  font-weight: 600;
  border-radius: 25px;
  padding: 10px 25px;
  transition: 0.3s;
}
.btn-custom:hover {
  background: #d57d8c;
}

/* Image side */
.image-side img {
  max-width: 430px;
  border-radius: 10px;
  box-shadow: 0 0 25px rgba(228, 155, 166, 0.3);
  transition: 0.3s;
}
.image-side img:hover {
  transform: scale(1.05);
}

/* About Section */
.about {
  background: #fff5f5;
  padding: 60px 20px;
  margin-top: 50px;
  border-radius: 10px;
  text-align: center;
}
.about h2 {
  color: #E49BA6;
  margin-bottom: 20px;
  font-weight: 700;
}
.about p {
  max-width: 850px;
  margin: auto;
  font-size: 16px;
  line-height: 1.7;
  color: #444;
}

/* Contact Section */
.contact {
  background: #fff;
  text-align: center;
  padding: 40px 20px;
  border-top: 2px solid #ffe5e5;
}
.contact h4 {
  color: #E49BA6;
  margin-bottom: 15px;
}
.contact p {
  margin: 3px 0;
  font-size: 15px;
  color: #555;
}

footer {
  text-align: center;
  padding: 15px;
  font-size: 14px;
  color: #999;
  border-top: 1px solid #eee;
}
</style>
</head>

<body>

<!-- Header -->
<div class="header">
  <h2>PulsePoint <span class="heart">❤</span></h2>
  <div>
    <a href="index.jsp" class="active">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<!-- Main Section -->
<div class="main">
  <!-- Left: Form -->
  <div class="form-box">
    <h1>Request for Blood</h1>
    <form action="indexFormAction.jsp" method="post">
      <input type="text" name="name" class="form-control" placeholder="Enter Your Name" required>
      <input type="text" name="mobile" class="form-control" placeholder="Enter Your Mobile Number" required>
      <input type="email" name="email" class="form-control" placeholder="Enter Your Email" required>
      <input type="text" name="bloodgroup" class="form-control" placeholder="Enter Blood Group" required>
      <button type="submit" class="btn btn-custom">Submit</button>
    </form>
  </div>

  <!-- Right: Image -->
  <div class="image-side">
    <img src="blooddrop.jpg" alt="Blood Donation">
  </div>
</div>

<!-- About Section -->
<div class="about">
  <h2>About PulsePoint</h2>
  <p>
    PulsePoint is a compassionate digital bridge connecting blood donors and recipients.  
    Every drop of blood symbolizes life and hope — our mission is to ensure that no one dies due to blood shortage.  
  </p>
  <p>
    Blood groups are divided into A, B, AB, and O — each positive (+) or negative (−).  
    <br>❤️ <b>O−</b> donors are universal givers  
    <br>❤️ <b>AB+</b> can receive from all groups  
    <br>❤️ <b>A</b> donates to A and AB  
    <br>❤️ <b>B</b> donates to B and AB  
    <br>Donate blood, save lives — because every pulse counts!
  </p>
</div>

<!-- Contact Section -->
<div class="contact">
  <h4>Contact Us</h4>
  <p>Email: aaa@gmail.com</p>
  <p>Phone: 017XXXXXXXX</p>
</div>

<!-- Footer -->
<footer>© 2025 PulsePoint | All Rights Reserved</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
