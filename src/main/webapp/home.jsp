<%@ page import="java.sql.*,java.util.*,Project.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>PulsePoint | Admin Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.2.0"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg,#ffe6eb,#fff0f5); /* Soft pinkish gradient */
        margin: 0;
        color: #333;
    }

    .main-container {
        display: flex;
        min-height: 100vh;
        transition: all 0.3s ease;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background: #fff;
        padding: 25px 20px;
        border-right: 1px solid #e5e7eb;
        box-shadow: 2px 0 20px rgba(0,0,0,0.08);
        position: sticky;
        top: 0;
        height: 100vh;
        transition: all 0.3s ease;
    }

    .sidebar h2 {
        font-size: 28px;
        font-weight: 700;
        color: #4a4a4a;
        text-align: center;
        margin-bottom: 40px;
    }

    .nav-btn {
        display: block;
        padding: 12px 18px;
        margin-bottom: 12px;
        border-radius: 12px;
        background: #f7f2f5; /* softer pink for sidebar links */
        font-weight: 500;
        color: #333;
        text-decoration: none;
        border: 1px solid #f3d6de;
        transition: 0.3s;
    }

    .nav-btn:hover {
        background: #d9778b;
        color: #fff;
        border-color: #d9778b;
        transform: translateX(5px);
    }

    .logout-btn {
        background: #ff6b6b !important;
        color: white !important;
        border: none !important;
    }

    /* Content */
    .content-wrapper {
        flex: 1;
        padding: 30px 40px;
        transition: all 0.3s ease;
    }

    /* Welcome Box */
    .welcome-box {
        background: linear-gradient(135deg,#ffd6e0,#ffb3cc); /* Pinkish gradient */
        padding: 30px;
        border-radius: 20px;
        font-size: 28px;
        font-weight: 700;
        text-align: center;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        margin-bottom: 30px;
        color: #5a1f3a;
    }

    /* Statistic Cards */
    .stat-card {
        padding: 25px;
        border-radius: 18px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        font-weight: 600;
        transition: transform 0.3s, box-shadow 0.3s;
        color: #333;
    }

    .stat-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }

    .stat-card h3 {
        font-size: 18px;
        margin-bottom: 10px;
        font-weight: 600;
    }

    .stat-card p {
        font-size: 32px;
        font-weight: 700;
        margin: 0;
    }

    /* Gradient colors for stats */
    .card-blue { background: linear-gradient(135deg,#b8c6ff,#7c94f6); color:#1b255a; }
    .card-pink { background: linear-gradient(135deg,#ffb3b3,#ff7f7f); color:#5a1f1f; }
    .card-green { background: linear-gradient(135deg,#a0e6b0,#65d18f); color:#1f3a2a; }
    .card-yellow { background: linear-gradient(135deg,#ffe69b,#ffd54d); color:#665a1f; }

    /* Chart Cards */
    .chart-card {
        border-radius: 20px;
        padding: 25px;
        background: #fff0f5;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        height: 360px;
        transition: transform 0.3s;
    }

    .chart-card:hover { transform: translateY(-6px); }

    .chart-card h5 { text-align: center; font-weight: 600; margin-bottom: 25px; color:#5a1f3a; }

    /* Responsive */
    @media(max-width: 768px) {
        .main-container { flex-direction: column; }
        .sidebar { width: 100%; height: auto; border-right: none; border-bottom: 1px solid #ddd; }
        .content-wrapper { padding: 20px; }
        .stat-card p { font-size: 26px; }
        .chart-card { height: 300px; }
    }
</style>
</head>
<body>

<div class="main-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>PulsePoint</h2>
        <a href="donorRequest.jsp" class="nav-btn">Donor Request</a>
        <a href="addNewDonor.jsp" class="nav-btn">Add New Donor</a>
        <a href="editDeleteList.jsp" class="nav-btn">Manage Donors</a>
        <a href="manageStock.jsp" class="nav-btn">Manage Stock</a>
        <a href="requestForBlood.jsp" class="nav-btn">Request Blood</a>
        <a href="requestCompleted.jsp" class="nav-btn">Completed Requests</a>
        <a href="index.jsp" class="nav-btn logout-btn">Logout</a>
    </div>

    <!-- Content -->
    <div class="content-wrapper">
        <div class="welcome-box">
            Welcome Admin! 👋
        </div>

        <%
            Connection con = ConnectionProvider.getConnection();
            ResultSet rs;

            int totalDonors = 0, totalRequests = 0, pendingRequests = 0, doneRequests = 0;

            rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM donor");
            if(rs.next()) totalDonors = rs.getInt(1);

            rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM bloodrequest");
            if(rs.next()) totalRequests = rs.getInt(1);

            rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM bloodrequest WHERE status='pending'");
            if(rs.next()) pendingRequests = rs.getInt(1);

            rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM bloodrequest WHERE status='done'");
            if(rs.next()) doneRequests = rs.getInt(1);

            rs = con.createStatement().executeQuery("SELECT bloodgroup, units FROM stock");
            Map<String,Integer> stockMap = new LinkedHashMap<>();
            while(rs.next()){
                stockMap.put(rs.getString("bloodgroup"), rs.getInt("units"));
            }
        %>

        <!-- Stat Cards -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3"><div class="stat-card card-blue"><h3>Total Donors</h3><p><%= totalDonors %></p></div></div>
            <div class="col-md-3 mb-3"><div class="stat-card card-pink"><h3>Total Requests</h3><p><%= totalRequests %></p></div></div>
            <div class="col-md-3 mb-3"><div class="stat-card card-yellow"><h3>Pending</h3><p><%= pendingRequests %></p></div></div>
            <div class="col-md-3 mb-3"><div class="stat-card card-green"><h3>Completed</h3><p><%= doneRequests %></p></div></div>
        </div>

        <!-- Charts -->
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="chart-card">
                    <h5>Blood Stock 🩸</h5>
                    <canvas id="stockChart"></canvas>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="chart-card">
                    <h5>Request Status 📊</h5>
                    <canvas id="requestChart"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
new Chart(document.getElementById('stockChart'), {
    type:'bar',
    data:{
        labels:[<% for(String bg : stockMap.keySet()) out.print("'" + bg + "',"); %>],
        datasets:[{
            label:'Units',
            data:[<% for(Integer u : stockMap.values()) out.print(u + ","); %>],
            backgroundColor:['#ff7f7f','#ffd699','#a0e6b0','#6a7ae0','#d18aff','#ffb36f','#ff9d9d','#b8c6ff'] // modern palette
        }]
    },
    options:{
        plugins:{ datalabels:{ color:'#333', anchor:'end', align:'top' }},
        scales:{ y:{ beginAtZero:true }},
        responsive:true
    },
    plugins:[ChartDataLabels]
});

new Chart(document.getElementById('requestChart'), {
    type:'doughnut',
    data:{
        labels:['Pending','Done'],
        datasets:[{
            data:[<%= pendingRequests %>, <%= doneRequests %>],
            backgroundColor:['#ff99a1','#6ad18f'] // softer pink & green
        }]
    },
    options:{
        plugins:{
            datalabels:{ color:'#333', formatter:(v,ctx)=>{
                let s = ctx.chart.data.datasets[0].data.reduce((a,b)=>a+b,0);
                return (v*100/s).toFixed(1)+'%';
            }},
            legend:{ position:'bottom' }
        },
        responsive:true
    },
    plugins:[ChartDataLabels]
});
</script>
</body>
</html>
