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
	$com = new Community();
	$group_id_length = 20;

	
	$user_name = $_SESSION['login_username'];
	$menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
	$posted_by = "Ashwin";
	$posted_location = "Trivandrum, Kerala";
	$posted_time ="10 hours ago";
	$posted_by_dp="assets/img/users/4.jpg";
	$post_image1="assets/img/1.jpg";
	$USER_TYPE_NORMAL ='NORMAL';
	//$user_name = 'vineethrvin@gmail.com';
	if(isset($_GET['group_id']))
	{
		$group_id = $_GET['group_id'];
	}
	$postCreator->addHead();
	if(isset($group_id)){
	$postCreator->createNavBar($user_name,$_GET['group_name']);
	$postCreator->createSideNav($_GET['group_name'],$_GET['group_description']);
	}else{
				$postCreator->createNavBar($user_name);

		$postCreator->createSideNav();

	}
	
	if(isset($_POST['invite-link']))
	{
		$postCreator->joinCommunity($user_name,$_POST['invite-link'],$USER_TYPE_NORMAL);
	}
	if(isset($group_id)){

	$postCreator->createCommunityNaviagtion($user_name);
	}else{
		$postCreator->createCommunityNaviagtion($user_name);
	
	}
	$postCreator->createGroupWindow($group_id_length);
	if(isset($_GET['user_type']))
{
	if($_GET['user_type'] != $USER_TYPE_NORMAL ){
		$postCreator->createPostBox();
	}
}
	if(isset($_POST['group_name']))
	{
		$group_name = $_POST['group_name'];
		$group_description = $_POST['group_description'];
		$group_type = $_POST['group_type'];
	$group_id = $_POST['group_id'];
	$created_by = $user_name;
	$postCreator->addCommunity($group_id,$group_name,$group_description,$group_type,$created_by);
	
	} 
	
	if(isset($_POST['post_content']))
	{
	 $post_content = $_POST['post_content'];
	  if(isset($_POST['post_image'])){
		$post_image = $_POST['post_image'];
		$postCreator->addPostToDb($post_content,$post_image,$group_id,$user_name);
	}else{
		$postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_content);
		$postCreator->addPostToDb($post_content,null,$group_id,$posted_by);

	}
	//echo $post_content;
	} 
	if(isset($group_id)){
		$postDetails = 	$postCreator->getPostDetails($group_id);
		foreach($postDetails as $post){
		$postCreator->createPost($menuItems,$post['created_by'],$posted_location,$posted_time,$posted_by_dp,$post['post_content'],$post_image1);
		}
	}
	$postCreator->addScript();
	$postCreator->addClosure();
}else{
	echo "<html><body><h1>You must be logged in to see this page user</h1><body></html>";
}

function logout(){
	session_destroy();
}
?>