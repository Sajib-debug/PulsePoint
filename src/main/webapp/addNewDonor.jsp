<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Donor | PulsePoint</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background-color: #f8f9fa; /* Soft neutral background */
            color: #333;
            font-size: 14px;
        }
        /* Header Box */
        .header-box {
            max-width: 700px;
            margin: 30px auto 20px auto;
            background-color: #ffd6dc; /* pastel pink */
            color: #d32f2f;
            text-align: center;
            font-size: 26px;
            font-weight: 600;
            padding: 20px 15px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
            letter-spacing: 0.5px;
        }
        .container {
            background-color: #fff;
            width: 65%;
            margin: 20px auto 40px auto;
            padding: 25px 35px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="password"], input[type="email"], 
        select, input[type="number"] {
            border: 1px solid #ccc;
            background: #f1f1f1;
            height: 40px;
            font-size: 14px;
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            margin-top: 6px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }
        h2 {
            font-size: 16px;
            margin-bottom: 3px;
            color: #222;
        }
        h1 {
            text-align: center;
            color: #d32f2f;
            font-size: 22px;
            margin-bottom: 25px;
        }
        .button {
            background-color: #e53935;
            border: none;
            padding: 10px 25px;
            border-radius: 20px;
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
        }
        .button:hover {
            background-color: #b71c1c;
        }
        .admin-button {
            background-color: #1976d2;
        }
        .admin-button:hover {
            background-color: #0d47a1;
        }
        h3 {
            text-align: center;
            color: gray;
            margin-top: 40px;
            font-size: 13px;
        }
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }
            .header-box {
                width: 90%;
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<%
    int id = 1;
    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT MAX(id) FROM donor");
        if (rs.next()) {
            id = rs.getInt(1) + 1;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!-- Header Box -->
<div class="header-box">
    Add New Donor
</div>

<div class="container">
    <h1>Donor ID: <%= id %></h1>

    <form action="addNewDonorAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <h2>Name</h2>
        <input type="text" placeholder="Enter Name" name="name" required>

        <h2>Father Name</h2>
        <input type="text" placeholder="Enter Father Name" name="father" required>

        <h2>Mother Name</h2>
        <input type="text" placeholder="Enter Mother Name" name="mother" required>

        <h2>Mobile Number</h2>
        <input type="number" placeholder="Enter Mobile Number" name="mobilenumber" required>

        <h2>Gender</h2>
        <select name="gender" required>
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>

        <h2>Blood Group</h2>
        <select name="bloodgroup" required>
            <option value="">Select</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
        </select>

        <h2>Address</h2>
        <input type="text" placeholder="Enter Address" name="address" required>

        <center>
            <button type="submit" class="button">Save</button>
            <a href="home.jsp" class="button admin-button" style="margin-left: 10px;">Admin Page</a>
        </center>
    </form>
</div>

<h3>All Rights Reserved @ PulsePoint: 2025</h3>

</body>
</html>
