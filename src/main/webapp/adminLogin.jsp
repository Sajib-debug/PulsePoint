<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PulsePoint | Admin Login</title>
<style>
/* Body styling */
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    color: #fff;
    margin: 0;
    padding: 0;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 40px;
    background: rgba(0,0,0,0.3);
}

.header a {
    color: white;
    text-decoration: none;
    font-weight: 600;
    margin-left: 20px;
    padding: 8px 15px;
    border-radius: 8px;
    transition: 0.3s;
}

.header a:hover, .header a.active {
    background: #ff4b5c;
    color: white;
}

/* Container */
.container {
    max-width: 400px;
    margin: 80px auto;
    padding: 40px;
    background: rgba(255,255,255,0.05);
    backdrop-filter: blur(10px);
    border-radius: 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    text-align: center;
}

/* Form headings */
form h2 {
    margin: 15px 0 5px;
    font-weight: 600;
    font-size: 18px;
}

/* Input fields */
input[type="text"], input[type="password"] {
    width: 80%;
    padding: 15px;
    margin: 10px 0 20px;
    border-radius: 25px;
    border: none;
    font-size: 16px;
    outline: none;
    background: rgba(255,255,255,0.1);
    color: #fff;
    transition: 0.3s;
}

input[type="text"]::placeholder, input[type="password"]::placeholder {
    color: #ccc;
}

input[type="text"]:focus, input[type="password"]:focus {
    background: rgba(255,255,255,0.2);
}

/* Button */
button {
    width: 50%;
    padding: 12px 0;
    border-radius: 25px;
    border: none;
    background: #ff4b5c;
    color: white;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #ff758c;
}

/* Footer */
footer {
    margin-top: 50px;
    text-align: center;
    font-size: 14px;
    color: #ccc;
}
</style>
</head>
<body>

<div class="header">
  <div>PulsePoint</div>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<div class="container">

	<br>
	<%
		String msg=request.getParameter("msg");
	if("Invalid!".equals(msg)){
		%>
			<center><font color="red"size="5">Invalid Username/Password</font></center>
		<%
	}
	%>
    <form action="adminLoginAction.jsp" method="post">
        <h2>Username:</h2>
        <input type="text" placeholder="Enter Username" name="username" required>

        <h2>Password:</h2>
        <input type="password" placeholder="Enter Password" name="password" required>

        <br>
        <button type="submit">Submit</button>
    </form>
</div>

<footer>
    2025 PulsePoint | All Rights Reserved
</footer>

</body>
</html>
