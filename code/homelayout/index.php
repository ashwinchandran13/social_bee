<?php
namespace HtmlGenerator;
$root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
$includes = $root.'includes/';
$htmlCreator = $includes.'HtmlTag.php';
$markup = $includes.'Markup.php';
$postCreator = $includes.'PostCreator.php';
$community = $includes.'Community.php';
$dbConnection = $includes.'db_connection.php';
// require $markup;
// require $htmlCreator;
require $postCreator;
require $community;
require $dbConnection;
$postCreator = new PostCreator();
$com = new Community();
//TODO: read from the login and use
$user_name = 'vineethrvin@gmail.com';
$group_id_length = 20;
if(isset($_POST['group_name']))
{
	$group_name = $_POST['group_name'];
	$group_description = $_POST['group_description'];
	$group_type = $_POST['group_type'];
$group_id = $_POST['group_id'];
$created_by = $user_name;
	$com->addCommunity($group_id,$group_name,$group_description,$group_type,$created_by);

} 
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

		<!-- Semantic UI for drop downs -->
		
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
		<!-- <div class="overlay"></div> -->

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

<?php
$com->createCommunityNaviagtion($user_name);
?>

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
		<form action="" method="">
			<label>
         Invite Link<span class="req" >*</span>
      </label>
			<input type="text"required autocomplete="off" name="invite-link" />
			<input type="submit" value="Join" name="join-group" class="fsSubmitButton">

		</form>
  </div>
  <div id="menu1" class="tab-pane fade in">
		<h3>Create a Group</h3>
		
		<form action="" method="post">
		<label>
				Group Id<span class="req" >*</span>
			</label>
			<input type="text"required autocomplete="off" name="group_id" value="<?php echo $com->getCommunityId($group_id_length)?>" readonly/>
			<label>
				Group Name<span class="req" >*</span>
			</label>
			<input type="text"required autocomplete="off" name="group_name" />
			<label>
				Group Type<span class="req" >*</span>
			</label>
			<br><br>
		<?php
					$com->createCommunityType();
		?>
		<br><br><br>
		<label>
				Group Description<span class="req" >*</span>
			</label>
			<br><br>
		<textarea placeholder="Enter Description" name="group_description"></textarea>
		<input type="submit" value="Submit" name="btn_create_group" class="fsSubmitButton">

		</form>

  </div>
</div>

</div>

</div>

							<?php
							      $menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
										$posted_by = "Ashwin";
										$posted_location = "Trivandrum, Kerala";
										$posted_time ="10 hours ago";
										$posted_by_dp="assets/img/users/4.jpg";
										$post_image="assets/img/1.jpg";
										$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_image);
										$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_image);
										$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,"assets/img/users/4.jpg");
							?>

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