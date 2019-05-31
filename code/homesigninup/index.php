<?php
if(isset($_SESSION['login_username'])){
session_destroy();
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>SOCIAL BEE</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta  name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://fonts.googleapis.com/css?family=Flamenco" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
	<header>
		<nav>
			<div class="row clearfix">
				<img src="../images/logo.png" class="logo" alt="bee logo">
				<ul class="main-nav animated slideInDown" id="check-class" >
					<li>
						<a href="#">ABOUT SOCIAL BEE</a>
					</li>
					<li>
						<a href="#">FAQs</a>
					</li>
					<li>
						<a href="signup/index.php">SIGNUP</a>
					</li>
					
				</ul>
				<a href="#" class="mobicon" onclick="slideshow()"><i class="fas fa-bars"></i>
				</a>
			</div>
		</nav>
		<div class="p1content">
		<h1>Create your own <span class="colanim"><br>social network !</span></h1><br><h3>OR</h3><br>
		<br><h4>Join A Community</h4>
		<a href="signup/index.html#login" class="btn1 btnfull">Login</a>
		<a href="#" class="btn1 btnf">Learn More</a>
	</div>
	</header>
	<script type="text/javascript">
		
		function slideshow() {
			var x = document.getElementById('check-class');
			if(x.style.display === "none"){
				x.style.display="block";
			}else{
				x.style.display="none";
			}
		}
	</script>
</body>
</html>