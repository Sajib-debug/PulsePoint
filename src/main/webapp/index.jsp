<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Blood Bank</title>
<style>
/* Smooth animated background */
body {
  margin: 0;
  font-family: "Poppins", sans-serif;
  background: linear-gradient(-45deg, #ff4b5c, #ff758c, #ff4b5c, #d32f2f);
  background-size: 400% 400%;
  animation: gradientMove 8s ease infinite;
  color: white;
}

@keyframes gradientMove {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Header */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(0,0,0,0.2);
  padding: 15px 40px;
}

.header a {
  color: white;
  text-decoration: none;
  font-weight: 600;
  margin-left: 20px;
}

.header a:hover {
  color: #ffb3b3;
}

/* Heart animation */
.heart {
  color: #ffccd5;
  font-size: 28px;
  animation: heartbeat 1.2s infinite;
}

@keyframes heartbeat {
  0%, 40%, 80%, 100% { transform: scale(1); }
  20%, 60% { transform: scale(1.3); }
}

/* Form box */
.form-box {
  background: rgba(255,255,255,0.1);
  backdrop-filter: blur(6px);
  border-radius: 15px;
  width: 60%;
  margin: 60px auto;
  padding: 30px;
  text-align: center;
}

input[type="text"], input[type="email"] {
  border: none;
  background: white;
  color: #333;
  height: 45px;
  width: 80%;
  margin: 10px 0;
  border-radius: 8px;
  padding: 10px;
  font-size: 15px;
}

button {
  background: #fff;
  border: none;
  color: #d32f2f;
  padding: 12px 30px;
  font-size: 16px;
  font-weight: bold;
  border-radius: 25px;
  cursor: pointer;
  transition: 0.3s;
}

button:hover {
  background: #d32f2f;
  color: white;
}

/* About Section */
.about {
  text-align: center;
  width: 70%;
  margin: 60px auto;
  line-height: 1.6;
  font-size: 17px;
  color: #fff8f8;
}
</style>
</head>
<body>

<div class="header">
  <h2>PulsePoint <span class="heart">❤</span></h2>
  <div>
    <a class="active" href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<div class="form-box">
  <h1>Request for Blood</h1>
  <form action="indexFormAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Your Name" required><br>
    <input type="text" name="mobile" placeholder="Enter Your Mobile Number" required><br>
    <input type="email" name="email" placeholder="Enter Your Email" required><br>
    <input type="text" name="bloodgroup" placeholder="Enter Blood Group" required><br>
    <button type="submit">Submit</button>
  </form>
</div>

<div class="about">
  <h2>About PulsePoint</h2>
  <p>
    PulsePoint is a digital bridge between blood donors and recipients.  
    Our mission is simple — to ensure that every drop of blood finds the pulse that needs it most.
  </p>
</div>

<h4 style="text-align:center;">© 2025 PulsePoint | All Rights Reserved</h4>

</body>
</html>
