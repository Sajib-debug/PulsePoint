<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Blood Bank</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* GLOBAL */
body { font-family:"Poppins", sans-serif; background:#f7f7fb; margin:0; color:#333; overflow-x:hidden; }
.header { background: linear-gradient(135deg,#ffb4c7,#e46a84); padding:15px 20px; display:flex; justify-content:space-between; align-items:center; position:sticky; top:0; z-index:1000; border-bottom-left-radius:20px; border-bottom-right-radius:20px; box-shadow:0 4px 20px rgba(0,0,0,0.12); flex-wrap:wrap; }
.header h2 { font-weight:700; color:#fff; letter-spacing:1px; margin-bottom:0; }
.header-btn { background:#fff; color:#e46a84; padding:8px 20px; border-radius:25px; text-decoration:none; margin:5px 5px 0 0; border:1px solid #ffd9e3; font-weight:600; transition:0.3s; display:inline-block; }
.header-btn:hover { background:#ffe5ec; color:#b23d58; }
.heart { animation: beat 1.2s infinite; }
@keyframes beat { 0%,40%,80%,100%{transform:scale(1);} 20%,60%{transform:scale(1.3);} }

/* ABOUT BOARD */
.about-board { background:#fff5f5; padding:50px 20px; text-align:center; margin:20px 6%; border-radius:25px; box-shadow:0 8px 25px rgba(0,0,0,0.12); overflow:hidden; position:relative; }
.about-board h2 { font-size:28px; font-weight:700; color:#e46a84; animation: slidein 3s ease-in-out infinite alternate; margin:0; }
@keyframes slidein { 0%{transform:translateX(-50px);} 50%{transform:translateX(0px);} 100%{transform:translateX(50px);} }

/* BLOOD STOCK CARDS INLINE */
.stock-container { display:flex; overflow-x:auto; gap:15px; padding:20px; margin:20px 0; white-space:nowrap; }
.stock-card { flex:0 0 auto; width:150px; min-width:150px; max-width:150px; padding:15px; border-radius:15px; text-align:center; background:white; border-top:4px solid #e46a84; box-shadow:0 4px 15px rgba(0,0,0,0.1); transition:0.3s; }
.stock-card:hover { transform:translateY(-5px); box-shadow:0 8px 25px rgba(0,0,0,0.15); }
.stock-card h5 { color:#e46a84; font-weight:700; }
.progress-bar-wrapper { height:8px; background:#fbe7ea; border-radius:10px; margin:8px 0; }
.progress-bar-custom { height:100%; background:#e46a84; border-radius:10px; }

/* MAIN FORM + IMAGE */
.main { display:flex; justify-content:space-between; flex-wrap:wrap; padding:40px 6%; gap:30px; }
.form-box { background:white; padding:25px 20px; width:100%; max-width:400px; border-radius:18px; box-shadow:0 8px 25px rgba(0,0,0,0.12); flex:1; }
.form-box h1 { color:#e46a84; font-weight:700; margin-bottom:20px; }
.form-control { margin-bottom:15px; padding:12px 15px; border-radius:12px; border:1px solid #ffd5df; width:100%; }
.btn-custom { background:linear-gradient(135deg,#ffb4c7,#e46a84); color:white; padding:10px 25px; border-radius:25px; font-weight:600; border:none; transition:0.3s; width:100%; }
.btn-custom:hover { background:linear-gradient(135deg,#ff8ea9,#d75472); }
.image-side img { width:100%; max-width:420px; border-radius:15px; box-shadow:0 6px 22px rgba(228,106,132,0.25); transition:0.3s; }
.image-side img:hover { transform:scale(1.05); }

/* WHY DONATE SECTION */
.why-donate { margin:50px 6%; text-align:center; }
.why-title { font-size:28px; font-weight:700; color:#e46a84; margin-bottom:25px; }
.why-cards { display:flex; flex-wrap:wrap; justify-content:center; gap:25px; }
.why-card { background:white; width:250px; padding:20px; border-radius:18px; box-shadow:0 8px 22px rgba(0,0,0,0.10); transition:0.3s; }
.why-card:hover { transform:translateY(-6px); box-shadow:0 12px 25px rgba(0,0,0,0.15); }
.why-icon { font-size:40px; color:#e46a84; margin-bottom:12px; }

/* COMPATIBILITY TABLE */
.compatibility { margin:50px 6%; background:white; padding:25px; border-radius:18px; box-shadow:0 8px 25px rgba(0,0,0,0.12); overflow-x:auto; }
.table th { background:#e46a84; color:white; }

/* DONATION PROCESS TIMELINE */
.process { margin:50px 6%; text-align:center; }
.process-title { font-size:28px; font-weight:700; color:#e46a84; margin-bottom:30px; }
.timeline { position:relative; max-width:700px; margin:auto; }
.timeline::before { content:""; position:absolute; top:0; left:50%; width:4px; height:100%; background:#ffb4c7; transform:translateX(-50%); }
.step { position:relative; width:50%; padding:20px; }
.left { left:0; text-align:right; }
.right { left:50%; }
.step .circle { width:18px; height:18px; background:#e46a84; border-radius:50%; position:absolute; top:25px; right:-9px; }
.right .circle { left:-9px; }
.step h4 { font-weight:600; margin-bottom:5px; }
.step p { font-size:14px; color:#555; }

/* CONTACT & FOOTER */
.contact { background:white; padding:30px; margin:50px 6%; text-align:center; border-radius:18px; box-shadow:0 8px 25px rgba(0,0,0,0.10); }
.contact h4 { color:#e46a84; font-weight:700; }
footer { text-align:center; padding:15px; color:#777; }

/* RESPONSIVE */
@media(max-width:992px){
  .main { flex-direction:column; align-items:center; text-align:center; }
  .image-side img { max-width:320px; margin-top:20px; }
  .timeline::before { left:50%; }
  .step { width:100%; text-align:left; padding-left:40px; padding-right:20px; }
  .step .circle { left:-9px !important; right:auto !important; }
  .stock-container { flex-wrap:nowrap; }
  .why-cards { flex-direction:column; align-items:center; }
}

@media(max-width:576px){
  .header { flex-direction:column; align-items:flex-start; gap:10px; padding:15px; }
  .header h2 { font-size:22px; }
  .header-btn { width:100%; text-align:center; }
  .form-box { max-width:100%; padding:20px; }
  .image-side img { max-width:100%; }
  .stock-card { min-width:130px; flex:0 0 auto; }
  .why-card { width:90%; }
  .compatibility { margin:30px 2%; padding:20px; }
  .process { margin:30px 2%; }
  .about-board { margin:20px 2%; padding:30px; }
  .contact { margin:30px 2%; padding:25px; }
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
  <h2>PulsePoint <span class="heart">❤</span></h2>
  <div>
    <a href="index.jsp" class="header-btn">Home</a>
    <a href="donorRegistration.jsp" class="header-btn">Become Donor</a>
    <a href="adminLogin.jsp" class="header-btn">Admin Login</a>
  </div>
</div>

<!-- ABOUT DIGITAL BOARD -->
<div class="about-board">
  <h2>PulsePoint – Connecting Donors & Recipients Digitally</h2>
</div>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    int totalUnits = 0;
    List<String> bgList = new ArrayList<>();
    List<Integer> unitList = new ArrayList<>();
    List<Double> percentList = new ArrayList<>();

    try {
        con = Project.ConnectionProvider.getConnection();
        st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        rs = st.executeQuery("SELECT bloodgroup, units FROM stock");

        while(rs.next()) totalUnits += rs.getInt("units");
        rs.beforeFirst();
        while(rs.next()){
            bgList.add(rs.getString("bloodgroup"));
            unitList.add(rs.getInt("units"));
            percentList.add(totalUnits>0?(rs.getInt("units")*100.0)/totalUnits:0);
        }

    } catch(Exception e){ out.print("DB Error: "+e); }
%>

<!-- BLOOD STOCK -->
<div class="stock-container">
<%
for(int i=0;i<bgList.size();i++){
%>
  <div class="stock-card">
    <h5><%= bgList.get(i) %></h5>
    <p><%= unitList.get(i) %> Units</p>
    <div class="progress-bar-wrapper">
      <div class="progress-bar-custom" style="width:<%= percentList.get(i) %>%"></div>
    </div>
    <small><b><%= String.format("%.1f",percentList.get(i)) %>%</b></small>
  </div>
<%
}
%>
</div>

<!-- MAIN FORM + IMAGE -->
<div class="main">
  <div class="form-box">
    <h1>Request Blood</h1>
    <form action="indexFormAction.jsp" method="post">
      <input type="text" name="name" class="form-control" placeholder="Name" required>
      <input type="text" name="mobile" class="form-control" placeholder="Mobile" required>
      <input type="email" name="email" class="form-control" placeholder="Email" required>
      <input type="text" name="bloodgroup" class="form-control" placeholder="Blood Group" required>
      <button type="submit" class="btn-custom">Submit Request</button>
    </form>
  </div>
  <div class="image-side">
    <img src="blooddrop.jpg" alt="Blood Donation">
  </div>
</div>

<!-- WHY DONATE -->
<div class="why-donate">
  <div class="why-title">Why Donate Blood?</div>
  <div class="why-cards">
    <div class="why-card"><div class="why-icon">🩸</div><h4>Save Lives</h4><p>Your single donation can save up to 3 lives.</p></div>
    <div class="why-card"><div class="why-icon">❤️</div><h4>Stay Healthy</h4><p>Regular donation improves heart health & reduces disease risks.</p></div>
    <div class="why-card"><div class="why-icon">🌱</div><h4>Support Community</h4><p>Helps hospitals maintain adequate blood supply.</p></div>
  </div>
</div>

<!-- COMPATIBILITY -->
<div class="compatibility">
  <h2 class="text-center mb-4">Blood Group Compatibility</h2>
  <div class="table-responsive">
    <table class="table table-bordered text-center">
      <tr><th>Blood Group</th><th>Can Donate To</th><th>Can Receive From</th></tr>
      <tr><td>O−</td><td>All Groups</td><td>O−</td></tr>
      <tr><td>O+</td><td>O+, A+, B+, AB+</td><td>O+, O−</td></tr>
      <tr><td>A+</td><td>A+, AB+</td><td>A+, A−, O+, O−</td></tr>
      <tr><td>B+</td><td>B+, AB+</td><td>B+, B−, O+, O−</td></tr>
      <tr><td>AB+</td><td>AB+</td><td>All Groups</td></tr>
    </table>
  </div>
</div>

<!-- DONATION PROCESS -->
<div class="process">
  <div class="process-title">Blood Donation Process</div>
  <div class="timeline">
    <div class="step left"><div class="circle"></div><h4>Step 1: Registration</h4><p>Fill form and verify identity.</p></div>
    <div class="step right"><div class="circle"></div><h4>Step 2: Health Check</h4><p>Quick medical screening for safety.</p></div>
    <div class="step left"><div class="circle"></div><h4>Step 3: Donation</h4><p>10–12 minutes painless donation process.</p></div>
    <div class="step right"><div class="circle"></div><h4>Step 4: Refreshments</h4><p>Enjoy snacks and rest for a few minutes.</p></div>
  </div>
</div>

<!-- CONTACT -->
<div class="contact">
  <h4>Contact Us</h4>
  <p>Email: aaa@gmail.com</p>
  <p>Phone: 017XXXXXXXX</p>
</div>

<footer>© 2025 PulsePoint | All Rights Reserved</footer>
</body>
</html>
