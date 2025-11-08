<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Home</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: "Poppins", sans-serif;
    background-color: #fff;
}

/* Main container layout */
.main-container {
    display: flex;
    height: 100vh;
    overflow: hidden;
}

/* Sidebar styling */
.sidebar {
    width: 250px;
    background-color: #ffd6dc;
    display: flex;
    flex-direction: column;
    padding: 30px 20px;
    box-shadow: 2px 0 10px rgba(0,0,0,0.1);
}

.sidebar h2 {
    font-size: 22px;
    text-align: center;
    margin-bottom: 30px;
    color: #333;
    font-weight: 600;
}

.sidebar .btn {
    background-color: #ff5c8d;
    color: #fff;
    font-weight: 500;
    margin-bottom: 12px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.sidebar .btn:hover {
    background-color: #ff2e63;
}

/* Right content area */
.content-wrapper {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    overflow-y: auto;
    padding: 20px;
    background-color: #9B5DE0; /* Updated background color */
}

/* Welcome Box */
.welcome-box {
    background-color: #f0e5ff; /* Light color for contrast */
    color: #4B0082; /* Dark purple text */
    text-align: center;
    font-size: 28px;
    font-weight: 600;
    padding: 20px 15px;
    margin-bottom: 30px;
    border-radius: 15px;
    width: 60%;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
}

/* Image styling */
.image-container {
    width: 80%;
    max-width: 900px;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 6px 15px rgba(0,0,0,0.25);
    margin-bottom: 20px;
}

.image-container img {
    width: 100%;
    height: 400px;
    object-fit: cover;
}

/* Footer */
.footer {
    text-align: center;
    margin-top: 20px;
    color: #fff; /* White text for visibility */
    font-size: 14px;
}
</style>
</head>

<body>

<div class="main-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>PulsePoint</h2>
        <a href="addNewDonor.jsp" class="btn">Add New Donor</a>
        <a href="editDeleteList.jsp" class="btn">Edit/Delete/List Donors</a>
        <a href="manageStock.jsp" class="btn">Manage Stock</a>
        <a href="requestForBlood.jsp" class="btn">Request for Blood</a>
        <a href="requestCompleted.jsp" class="btn">Request Completed</a>
        <a href="index.jsp" class="btn btn-danger mt-auto">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content-wrapper">
        <!-- Welcome Box -->
        <div class="welcome-box">
            Welcome Admin!
        </div>

        <!-- Main Image -->
        <div class="image-container">
            <img src="home.jpg" alt="PulsePoint Home">
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 PulsePoint. All Rights Reserved.
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
