<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Donor Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
  font-family: "Poppins", sans-serif;
  background: linear-gradient(135deg, #ffe5ec 0%, #fff0f5 100%);
  margin: 0;
  color: #333;
}

/* Header */
.header {
  background: linear-gradient(135deg, #ffb4c7, #e46a84);
  color: #fff;
  padding: 15px 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: sticky;
  top: 0;
  z-index: 1000;
  border-bottom-left-radius: 15px;
  border-bottom-right-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}
.header h2 { font-weight: 700; }
.header a {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: 600;
}
.header a:hover { color: #ffd9e3; text-decoration: underline; }

/* Card style for form + eligibility */
.card-container {
  max-width: 900px;
  margin: 50px auto;
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
  justify-content: center;
}

/* Form Card */
.form-card {
  flex: 1;
  min-width: 350px;
  background: #fff;
  padding: 35px 25px;
  border-radius: 20px;
  box-shadow: 0 8px 25px rgba(228,106,132,0.2);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.form-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 30px rgba(228,106,132,0.3);
}
.form-card h1 {
  color: #e46a84;
  margin-bottom: 20px;
  font-weight: 700;
  text-align: center;
}
.form-card .form-control {
  margin-bottom: 15px;
  padding: 12px 15px;
  border-radius: 12px;
  border: 1px solid #ffd5df;
}
.btn-custom {
  background: linear-gradient(135deg, #ffb4c7, #e46a84);
  color: white;
  font-weight: 600;
  border-radius: 25px;
  padding: 10px 25px;
  width: 100%;
  transition: 0.3s;
}
.btn-custom:hover {
  background: linear-gradient(135deg, #ff8ea9, #d75472);
}

/* Eligibility Card */
.eligibility-card {
  flex: 1;
  min-width: 350px;
  background: #fff0f5;
  padding: 30px 25px;
  border-radius: 20px;
  box-shadow: 0 8px 20px rgba(228,106,132,0.15);
}
.eligibility-card h3 {
  color: #e46a84;
  font-weight: 700;
  margin-bottom: 20px;
  text-align: center;
}
.eligibility-card ul {
  list-style: none;
  padding-left: 0;
}
.eligibility-card li {
  margin-bottom: 12px;
  font-size: 15px;
  line-height: 1.6;
}
.eligibility-card li span { margin-right: 10px; font-size: 18px; }

/* Footer */
footer {
  text-align: center;
  padding: 20px;
  color: #777;
  font-size: 14px;
}

/* Responsive */
@media(max-width: 768px){
  .card-container { flex-direction: column; align-items: center; }
}
</style>
</head>

<body>

<!-- Header -->
<div class="header">
  <h2>PulsePoint ❤</h2>
  <div>
    <a href="index.jsp">Home</a>
    <a href="donorRegistration.jsp" class="active">Become a Donor</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<!-- Cards: Eligibility + Form -->
<div class="card-container">

  <!-- Eligibility -->
  <div class="eligibility-card">
    <h3>🩸 Eligibility Requirements</h3>
    <ul>
      <li><span>✅</span>Age between 18 and 65 years</li>
      <li><span>⚖️</span>Weight at least 50 kg</li>
      <li><span>💪</span>Good general health</li>
      <li><span>🩹</span>No recent major surgeries or illnesses</li>
      <li><span>⏱️</span>Not donated in last 3 months</li>
      <li><span>❌</span>No infectious disease history</li>
      <li><span>🆔</span>Valid ID for verification</li>
    </ul>
  </div>

  <!-- Registration Form -->
  <div class="form-card">
    <h1>Register as Donor</h1>
    <form action="donorRegistrationAction.jsp" method="post">
      <input type="text" name="name" class="form-control" placeholder="Full Name" required>
      <input type="text" name="age" class="form-control" placeholder="Age" required>
      <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" required>
      <input type="email" name="email" class="form-control" placeholder="Email Address" required>
      <select name="gender" class="form-control" required>
        <option value="">Select Gender</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
      </select>
      <select name="bloodgroup" class="form-control" required>
        <option value="">Select Blood Group</option>
        <option>A+</option><option>A-</option>
        <option>B+</option><option>B-</option>
        <option>O+</option><option>O-</option>
        <option>AB+</option><option>AB-</option>
      </select>
      <input type="text" name="address" class="form-control" placeholder="Full Address" required>
      <button type="submit" class="btn btn-custom">Register</button>
    </form>
  </div>

</div>

<footer>© 2025 PulsePoint | All Rights Reserved</footer>

</body>
</html>
