<%@include file="header.html"%>
<html>
<head>
<meta charset="UTF-8">
<title>PulsePoint | Home</title>
<style>
body {
    margin: 0;
    font-family: "Poppins", sans-serif;
    background-color: #fff;
}

/* Welcome Message */
.welcome {
    text-align: center;
    background-color: #ff4b5c;
    color: white;
    font-size: 40px;
    font-weight: bold;
    padding: 20px 15px;
    letter-spacing: 1px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

/* Navigation Buttons */
.nav-buttons {
    text-align: center;
    margin: 20px 0 40px 0;
}

.nav-buttons a {
    text-decoration: none;
    display: inline-block;
    background-color: #fff;
    color: #ff4b5c;
    border: 2px solid #ff4b5c;
    padding: 12px 30px;
    border-radius: 25px;
    margin: 0 10px;
    font-weight: bold;
    transition: 0.3s;
}

.nav-buttons a:hover {
    background-color: #ff4b5c;
    color: #fff;
}

/* Slideshow */
.slideshow-container {
    max-width: 1000px;
    position: relative;
    margin: auto;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

.mySlides {
    width: 100%;
    height: 400px;  /* image height proper size */
    display: none;
    object-fit: cover;
}

/* Footer */
.footer {
    text-align: center;
    margin: 40px 0;
    color: #888;
    font-size: 14px;
}
</style>
</head>
<body>

<!-- Welcome Message -->
<div class="welcome">
    Welcome to PulsePoint
</div>

<br>
<br>

<!-- Slideshow -->
<div class="slideshow-container">
    <img class="mySlides" src="welcome.jpg">
    <img class="mySlides" src="admin.PNG">
    <img class="mySlides" src="slide1.jpg">
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 PulsePoint. All Rights Reserved.
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2500); // Change image every 2.5 seconds
}
</script>

</body>
</html>
