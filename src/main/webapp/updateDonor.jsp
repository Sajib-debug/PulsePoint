<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ include file="header.html" %>
<html>
<head>
<title>Update Donor</title>
<style>
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(120deg, #ff4b5c, #ff758c);
    color: white;
    text-align: center;
}
input, select {
    width: 60%;
    padding: 10px;
    margin: 10px;
    border-radius: 20px;
    border: none;
    font-size: 16px;
}
button {
    background-color: white;
    color: #ff4b5c;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 25px;
    border: none;
    cursor: pointer;
}
</style>
</head>
<body>

<%
String id = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement("select * from donor where id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
%>

<h1>Update Donor Details</h1>
<form action="updateDonorAction.jsp" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <input type="text" name="name" value="<%= rs.getString("name") %>" placeholder="Enter Name"><br>
    <input type="text" name="father" value="<%= rs.getString("father") %>" placeholder="Enter Father Name"><br>
    <input type="text" name="mother" value="<%= rs.getString("mother") %>" placeholder="Enter Mother Name"><br>
    <input type="text" name="mobilenumber" value="<%= rs.getString("mobilenumber") %>" placeholder="Enter Mobile Number"><br>
    <input type="text" name="gender" value="<%= rs.getString("gender") %>" placeholder="Gender"><br>
    <input type="text" name="email" value="<%= rs.getString("email") %>" placeholder="Enter Email"><br>
    <input type="text" name="bloodgroup" value="<%= rs.getString("bloodgroup") %>" placeholder="Enter Blood Group"><br>
    <input type="text" name="address" value="<%= rs.getString("address") %>" placeholder="Enter Address"><br>

    <button type="submit">Update</button>
</form>

<%
    }
} catch(Exception e){
    out.println("<h3>Error: "+e.getMessage()+"</h3>");
}
%>

</body>
</html>
