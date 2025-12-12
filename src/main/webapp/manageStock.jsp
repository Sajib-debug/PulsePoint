<%@page import="Project.ConnectionProvider" %> 
<%@page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
    font-family: "Poppins", sans-serif;
    background-color: #fdf2f2; /* halka pinkish background */
    color: #333;
    margin: 0;
    padding: 0;
}

/* Header Box */
.header-box {
    max-width: 1200px;
    margin: 30px auto 20px auto;
    background-color: #ffe6ea; /* halka pinkish */
    color: #d32f2f;
    text-align: center;
    font-size: 28px;
    font-weight: 600;
    padding: 20px 15px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
}

/* Container Flex */
.container {
    display: flex;
    justify-content: space-between;
    max-width: 1200px;
    margin: auto;
    gap: 30px;
}

/* Form Section */
.form-section {
    flex: 1;
    background-color: #fff;
    padding: 25px 35px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
}

input[type="text"], select {
    border: 1px solid #ccc;
    background: #f9f0f0; /* halka pinkish */
    height: 45px;
    font-size: 14px;
    padding: 10px;
    width: 100%;
    border-radius: 8px;
    margin-top: 6px;
    margin-bottom: 15px;
    box-sizing: border-box;
}

button.button {
    background-color: #f48fb1; /* soft pink */
    color: white;
    padding: 10px 25px;
    border-radius: 25px;
    border: none;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
    width: 100%;
}

button.button:hover {
    background-color: #ec407a;
}

/* Table Section */
.table-section {
    flex: 1;
    background-color: #fff;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
}

#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even) {background-color:#f2f2f2;}
#customers tr:hover {background-color: #fce4ec;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #f48fb1; /* soft pink */
    color: white;
}

/* Admin Page Button */
.admin-button {
    display: block;
    background-color: #f06292;
    color: white;
    padding: 10px 25px;
    border-radius: 25px;
    text-align: center;
    font-weight: bold;
    text-decoration: none;
    margin-top: 20px;
}

.admin-button:hover {
    background-color: #d81b60;
}

/* Responsive */
@media(max-width: 1000px){
    .container{
        flex-direction: column;
    }
    .form-section, .table-section {
        width: 100%;
    }
}
</style>
<title>Manage Stock</title>
</head>
<body>

<!-- Header Box -->
<div class="header-box">
    Stock
</div>

<div class="container">

    <!-- Left Side: Form -->
    <div class="form-section">
        <%
        String msg = request.getParameter("msg");
        if ("invalid".equals(msg)) {
        %>
            <center><font color="red" size="5">Something went wrong! Try Again.</font></center>
        <% } else if ("valid".equals(msg)) { %>
            <center><font color="green" size="5">Update Unit</font></center>
        <% } %>

        <form action="manageStockAction.jsp" method="post">
            <h3>Select Blood Group</h3>
            <select name="bloodgroup">
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>

            <h3>Select Increase/Decrease</h3>
            <select name="indec">
                <option value="inc">Increase</option>
                <option value="dec">Decrease</option>            
            </select>

            <h3>Units (ml)</h3>
            <select name="units">
                <% for(int i=1; i<=1000; i++){ %>
                    <option value="<%=i%>"><%=i%></option>
                <% } %>
            </select>

            <button type="submit" class="button">Save</button>
        </form>
    </div>

    <!-- Right Side: Table + Admin Button -->
    <div class="table-section">
        <table id="customers">
            <tr>
                <th>Blood Group</th>
                <th>Units(ml)</th>
            </tr>
            <%
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM stock");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("bloodgroup") %></td>
                <td><%= rs.getString("units") %></td>
            </tr>
            <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='2'>Error: "+ e.getMessage() +"</td></tr>");
            }
            %>
        </table>

        <a href="home.jsp" class="admin-button">Admin Page</a>
    </div>

</div>

</body>
</html>
