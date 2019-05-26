<?php
namespace HtmlGenerator;
	session_start();
if(isset($_SESSION['login_username'])){
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
	// require $community;
	require $dbConnection;
	$postCreator = new PostCreator();
	// $com = new Community();
	//TODO: read from the login and use
	$group_id_length = 20;

	
	$user_name = $_SESSION['login_username'];
	$menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
	$posted_by = "Ashwin";
	$posted_location = "Trivandrum, Kerala";
	$posted_time ="10 hours ago";
	$posted_by_dp="assets/img/users/4.jpg";
	$post_image="assets/img/1.jpg";
	//$user_name = 'vineethrvin@gmail.com';
	$postCreator->addHead();
	$postCreator->createNavBar($user_name);
	$postCreator->createSideNav();
	$postCreator->createCommunityNaviagtion($user_name);
	$postCreator->createGroupWindow($group_id_length);
	$postCreator->createPostBox();

	if(isset($_POST['group_name']))
	{
		$group_name = $_POST['group_name'];
		$group_description = $_POST['group_description'];
		$group_type = $_POST['group_type'];
	$group_id = $_POST['group_id'];
	$created_by = $user_name;
		$com->addCommunity($group_id,$group_name,$group_description,$group_type,$created_by);
	
	} 
	
	if(isset($_POST['post_content']))
	{
	 $post_content = $_POST['post_content'];
	 if(isset($_POST['post_images'])){
		$post_image = $_POST['post_images'];
		$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_content,$post_image);
	 }else{
		$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_content);
	
	}
	//echo $post_content;
	} 
	$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,"This is to test how it looks with longer text, Hope it word wraps and looks good in the given space else I am screwed",$post_image);
	$postCreator->addScript();
	$postCreator->addClosure();
}else{
	echo "<html><body><h1>You must be logged in to see this page user</h1><body></html>";
}

function logout(){
	session_destroy();
}
?>