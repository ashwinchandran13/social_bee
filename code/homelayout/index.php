<?php
namespace HtmlGenerator;
$root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
$includes = $root.'includes/';
$htmlCreator = $includes.'HtmlTag.php';
$markup = $includes.'Markup.php';
$postCreator = $includes.'PostCreator.php';
// require $markup;
// require $htmlCreator;
require $postCreator;
$postCreator = new PostCreator();

?>
<!DOCTYPE html>
<html>

<head>
	<!-- Ashwin:Post Dependencies -->
	<!-- ==============================================
		Title and Meta Tags
		=============================================== -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- ==============================================
		 CSS Styles
		=============================================== -->
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<!-- Ionicons CSS-->
	<link rel="stylesheet" href="assets/css/ionicons.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="assets/css/style.css">

	<!-- ==============================================
		 Fonts
		=============================================== -->
	<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet">
	<link rel="stylesheet" href="css/opensans.css">
	<!-- ==============================================
		 Favicon
		=============================================== -->
	<link rel="shortcut icon" href="assets/img/favicon.png">


	<!-- Tweaks for older IEs-->
	<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

	<!--Ashwin: Sidebar nav dependencies -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

	<link rel='stylesheet' href='css/bootstrap.min.css'>

	<link rel="stylesheet" href="css/style.css">
	<!-- Ashwin: Sidebar nav group dependencies -->

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<!-- Ashwin: Title bar dependencies -->
	<link rel='stylesheet' href='css/materialize.css'>
	<link rel='stylesheet'
		href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.css'>

		

</head>

<body>
	<!-- Ashwin: Title bar  -->
	<div class="navbar-fixed">
		<nav>
			<div class="nav-wrapper">
				<form action="" method="post">
					<div class="input-field">
						<input id="search" type="search" name="search">
						<label class="label-icon" for="search"><i class="material-icons">search</i></label>
						<i class="material-icons">close</i>
					</div>
				</form>
				<!-- Ashwin: Dropdown begins -->
				<ul class="inner-navigation">
					<li class="right">
						<!--span class="notification-label"></span-->
						<div class="dropdown-container">
							<a href="#" data-dropdown="notificationMenu" class="menu-link has-notifications circle">
								<i class="fa fa-bell"></i>
							</a>
							<ul class="dropdown" name="notificationMenu">
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-flag"></i> -->
										<h4>Tasks</h4>
										<span class="label">4</span>
									</div>
									<!-- tab -->
									<ul class="notification-list">
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">project3</a></span>
												<span class="date">2 minutes ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">project2</a></span>
												<span class="date">12 hours ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">project6</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">project2</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>

									</ul>
								</li>
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-bug"></i> -->
										<h4>Bugs</h4>
										<span class="label">2/8</span>
									</div> <!-- tab -->
									<ul class="notification-list">
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project1</a></span>
												<span class="date">2 minutes ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project2</a></span>
												<span class="date">12 hours ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project3</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project4</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project5</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project6</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project7</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@project8</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>

									</ul>
									<!-- list -->
								</li>
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-envelope"></i> -->
										<h4>Messages</h4>
										<span class="label">3</span>
									</div>
									<ul class="notification-list">
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@mstrlaw</a></span>
												<span class="date">2 minutes ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@mstrlaw</a></span>
												<span class="date">12 hours ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@mstrlaw</a></span>
												<span class="date">2 days ago</span>
											</div>
										</li>

									</ul>
								</li>
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-calendar"></i> -->
										<h4>Calendar</h4>
										<span class="label">2</span>
									</div>
									<ul class="notification-list">
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@mstrlaw</a></span>
												<span class="date">tomorrow</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">@mstrlaw</a></span>
												<span class="date">in 2 days</span>
											</div>
										</li>
									</ul>
								</li>
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-trophy"></i> -->
										<h4>Badges</h4>
										<span class="label">2</span>
									</div>
									<ul class="notification-list">
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">technical</a></span>
												<span class="date">2 weeks ago</span>
											</div>
										</li>
										<li class="notification-list-item">
											<p class="message">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
											<div class="item-footer">
												<span class="from"><a href="#">personal</a></span>
												<span class="date">3 weeks ago</span>
											</div>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
				</ul>

			</div>
		</nav>
	</div>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.3/js/materialize.js'></script>


	<!-- Ashwin: Sidebar nav body -->
	<div id="wrapper">
		<div class="overlay"></div>

		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				<li class="sidebar-brand">
					<a href="#">
						Bootstrap 3
					</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-home"></i> Home</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-folder"></i> Page one</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-file-o"></i> Second page</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-cog"></i> Third page</a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-plus"></i> Dropdown <span
							class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header">Dropdown heading</li>
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-bank"></i> Page four</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-dropbox"></i> Page 5</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-twitter"></i> Last page</a>
				</li>
			</ul>
		</nav>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
				<span class="hamb-top"></span>
				<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
			</button>


			<!-- Ashwin: Sidebar group nav body -->
			<nav id="sidebar">
				<ul class="dots">
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-user"><mark>23</mark></span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-envelope"><mark class="big swing">7</mark></span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-time"><mark class="rubberBand">99</mark></span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-list-alt"></span>
						</a>
					</li>
					<li>
					<br>
					<br>
					<br>
					</li>
					<li>
					<!-- Ashwin: Permanent button for join and create a group-->
						<a href="#">
							<!-- Trigger/Open The Modal -->
							<div id="myBtn">
							<span class="glyphicon glyphicon-plus"></span></div>
						</a>
					<!-- Ends here -->
					</li>
				</ul>
			</nav>
		<!-- The Modal -->
<div id="myModal" class="modal">

<!-- Modal content -->
<div class="modal-content">
	<span class="close">&times;</span>
	<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Join</a></li>
  <li><a data-toggle="tab" href="#menu1">Create</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <h3>Join a Group</h3>
    <p> form</p>
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3>Create A Group</h3>
    <p>form</p>
  </div>
</div>

</div>

</div>
			<!-- <main>
			<h1>Hello world!</h1>
			<p>Move cursor over icon on the left to animate marks</p>
			<ul>
			  <li>To change mark color use following class's: <code>.green, .blue</code></li>
			  <li>Marks are prepare to handle with two-digit numbers from <code>0 to 99</code>. If your number is greater than 99 use logic to display <code>99+</code>.</li>
			</ul>
		   <meter value="2" min="0" max="10">2 out of 10</meter><br>
			<meter value="0.6">60%</meter>   
			</main> -->

			<!-- post box -->
			<!-- <div class="post-box">
			<div class="text">
				<img src="http://placehold.it/100/100"/>
				<textarea placeholder="What's in your mind"></textarea>
				<input type="submit" value="post"/>
			</div>
		</div>
		<div class="overlay"></div>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->
			<!-- Post box ends -->

			<!-- Ashwin: post body -->
			<!-- ==============================================
	    Hero
	    =============================================== -->
			<section class="hero">

				<div class="container">
					<div class="row">
						<div class="col-lg-6 offset-lg-3">

							<div class="cardbox shadow-lg bg-white">

								<div class="cardbox-heading">
									<!-- START dropdown-->
									<div class="dropdown float-right">
										<button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown"
											aria-expanded="false">
											<em class="fa fa-ellipsis-h"></em>
										</button>
										<div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu"
											style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
											<?php
											$menuItems= array("Hide post","Stop following","Report");
											$menuIds = array("hidePost","stopFollowing","report");
											$postCreator->addDropDown($menuItems,$menuIds);
											?>
										</div>
									</div>
									<!--/ dropdown -->
									<div class="media m-0">
										<div class="d-flex mr-3">
											<a href=""><img class="img-fluid rounded-circle" src="assets/img/users/4.jpg" alt="User"></a>
										</div>
										<div class="media-body">
											<p class="m-0">Benjamin Robinson</p>
											<small><span><i class="icon ion-md-pin"></i> Nairobi, Kenya</span></small>
											<small><span><i class="icon ion-md-time"></i> 10 hours ago</span></small>
										</div>
									</div>
									<!--/ media -->
								</div>
								<!--/ cardbox-heading -->

								<div class="cardbox-item">
									<img class="img-fluid" src="assets/img/1.jpg" alt="Image">
								</div>
								<?php
										$postCreator->createCardboxBase();
										$postCreator->createComments('Write a comment');
								?>
								<!--/ cardbox-like -->

							</div>
							<!--/ cardbox -->

						</div>
					
					</div>
					<!--/ row -->
				</div>
				<!--/ container -->
			</section>


			<!-- ==============================================
		Scripts
		=============================================== -->
			<script src="assets/vendor/jquery/jquery.min.js"></script>
			<script src="assets/vendor/popper.js/umd/popper.min.js"> </script>
			<script src="assets/js/bootstrap.min.js"></script>

		</div>
		<!-- /#page-content-wrapper -->
		<!-- Ashwin: Sidebar open animation shifts page to right ends here -->
	</div>
	<!-- /#wrapper -->
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>



	<script src="js/index.js"></script>
</body>

</html>