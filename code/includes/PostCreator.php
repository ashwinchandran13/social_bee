<?php
namespace HtmlGenerator;
$root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
$includes = $root.'includes/';
$htmlCreator = $includes.'HtmlTag.php';
$markup = $includes.'Markup.php';
require $markup;

require $htmlCreator;
// $postCreator = new PostCreator();
// $menuItems= array("Hide post","Stop following","Report");
// $menuIds = array("hidePost","stopFollowing","report");
// //  $postCreator->addDropDown($menuItems,$menuIds);
// require 'db_connection.php';
// $menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
// $posted_by = "Ashwin";
// $posted_location = "Trivandrum, Kerala";
// $posted_time ="10 hours ago";
// $posted_by_dp="assets/img/users/4.jpg";
// $post_image="assets/img/1.jpg";
// echo($postCreator->getPostDetails('79vwko88diwwkkgkc4k0'));

Class PostCreator{
/**DB interaction code */
function getPostDetails($groupid){
   $params = array(':groupid' => $groupid);

      $sql = "SELECT
      post.post_id,
      post.post_parent_id,
      post.post_type,
      post.post_content,
      post.community_id,
      post.post_image,
      (SELECT COUNT(*) FROM tbl_like_history WHERE post_id = post.post_id) AS like_count,
        (SELECT COUNT(*) FROM tbl_comment_history WHERE post_id = post.post_id) AS comment_count,
      post.created_time,
      post.updated_time,
      reg.first_name,
      reg.last_name,
      post.created_by,
      post.updated_by
    FROM tbl_post post, tbl_registration reg
    WHERE post.community_id=:groupid AND
    reg.user_name = post.created_by";
  return executeQuery($sql,$params);
}

function addScript(){
   echo '<!DOCTYPE html>
   <html>
   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
      <script src="js/jquery.js"></script>
      <script src="js/index.js"></script>
      <script src="assets/vendor/jquery/jquery.min.js"></script>
            <script src="assets/vendor/popper.js/umd/popper.min.js"> </script>
            <script src="assets/js/bootstrap.min.js"></script>';
}
function addHead(){
   echo '<head>
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

	<link rel=\'stylesheet\' href="css/bootstrap.min.css">

	<link rel="stylesheet" href="css/style.css">
	<!-- Ashwin: Sidebar nav group dependencies -->

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<!-- Ashwin: Title bar dependencies -->
	<link rel="stylesheet" href="css/materialize.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.css">

		<!-- Semantic UI for drop downs -->
		
</head>';
}
function addClosure(){
   echo '</div>
   <!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->

</body>
</html>';
}
function createGroupWindow(){
  echo '<div class="o-shadow"></div>

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

</div>';
}

function createPostBox(){
   echo '<div class="post_box">
   <form action = "" method="post">
         <div class="p-box">
           <img src="http://placehold.it/100/100"/>
           <textarea placeholder="What\'s in your mind" name="post_content"></textarea>
           <input type="submit" value="post"/>
               <input type="file" onchange="readURL(this);" name="post_image" />
               <img id="blah" src="#" alt="your image" />
         </div>
            </form>
   </div>';
}
function createSideNav(){
   echo '<div id="wrapper">
   <!-- <div class="overlay"></div> -->

   <!-- Sidebar -->
   <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
      <ul class="nav sidebar-nav">
         <li class="sidebar-brand">
            <a href="#">
               Community Name
            </a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-home"></i> Home group</a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-folder"></i> Online Members</a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-file-o"></i> Offline Members</a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-cog"></i> Managers</a>
         </li>
         <li style="color:white;padding-left:30px; padding-top:10px; padding-bottom:10px;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-plus"></i>Dropdown</li>
            <ul class="dropdown-menu" role="menu">
               <li style="color: rgba(137, 142, 146, 0.6);padding-left:30px;" class="dropdown-header" >MEMBERS</li>
               <li><a href="#">Member1</a></li>
               <li><a href="#">Member1</a></li>
               <li><a href="#">Member1</a></li>
               <li><a href="#">Member1</a></li>
               <li><a href="#">Member1</a></li>
            </ul>
         </li>
         
         <li>
            <a href="#"><i class="fa fa-fw fa-bank"></i> Community Calender</a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-dropbox"></i> Community Albums</a>
         </li>
         <li>
            <a href="#"><i class="fa fa-fw fa-twitter"></i> About Community</a>
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
      </button>';
} 
function createNavBar(){
   
   echo '<body><div class="navbar-fixed">
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
                     <img style="height:55px;width:45px; padding-top:10px;"  src="../images/logo.png" alt="logo">
							</a>
							<ul class="dropdown" name="notificationMenu">
								<li class="notification-group">
									<div class="notification-tab">
										<!-- <i class="fa fa-flag"></i> -->
										<h4>Notifications</h4>
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
										<h4>Sign out</h4>
										<span class="label">2/8</span>
									</div> 
								</li>
								
							</ul>
						</div>
					</li>
				</ul>

			</div>
		</nav>
	</div>';
}
   /**HTML creation code */
   function createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_content,$post_image=null){
      $post_main = HtmlTag::createElement('section')->set('class','hero');
     $cardbox_shadow = $post_main->addElement('div')->set('class','row')
      ->addElement('div')->set('class','col-lg-6 offset-lg-3')
      ->addElement('div')->set('class','cardbox shadow-lg bg-white');
      // <section class="hero">
      // <div class="container">
      //    <div class="row">
      //       <div class="col-lg-6 offset-lg-3">
      //          <div class="cardbox shadow-lg bg-white">
                     $menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
                        $this->createCardBoxHeading($cardbox_shadow,$menuItems);
                        $this->createUserHeader($cardbox_shadow,$posted_by,$posted_location,$posted_time,$posted_by_dp);
                        $this->createContent($cardbox_shadow,$post_content);
                        if(!is_null($post_image)){
                           $this->createPostImage($cardbox_shadow,$post_image);
                        }
                        $this->createCardboxBase($cardbox_shadow);
                        $this->createComments($cardbox_shadow,'Write a comment');
                        echo($post_main);
   //             </div>
   //          </div>
   //       </div>
   //    </div>
   // </section>
   }
    function addDropDown($parent,$menuItems){

        foreach(array_keys($menuItems) as $id){
         $parent->addElement('a')
            ->set('class','dropdown-item')
            ->set('href','#')
            ->set('id',$id)
            ->text($menuItems[$id]);
            // echo($tag);
        }
    }
    function createComments($parent,$comment_text){
        $comment = $parent->addElement('div')->set('class','cardbox-comments');
        $span = $comment->addElement('span')->set('class','comment-avatar float-left');
        $a = $span->addElement('a')->set('href','');
        $a->addElement('img')->set('class','rounded-circle')
        ->set('src','assets/img/users/6.jpg')
        ->set('alt','...');
        $div_input = $comment->addElement('div')->set('class','search');
        $div_input->addElement('input')->set('placeholder',$comment_text)
        ->set('type','text');
        $button = $div_input->addElement('button');
        $button->addElement('i')->set('class','fa fa-camera');
       // echo($comment);
     }
     function addParentWithListItemAndAnchor($parent,$href_link=null){
        $a = $parent->addElement('li')->addElement('a');
         if(!is_null($href_link)){
            $a->set('href',$href_link);  
         }
        return $a;
     }

     function addAnchorWithChild($parent,$class_name=null,$child_name,$href_link=null,$text=null){
        $child_tag =$this->addParentWithListItemAndAnchor($parent,$href_link)->addElement($child_name);
        if(!is_null($class_name)){
        $child_tag->set('class',$class_name);
        }
         if(!is_null($text)){
         $child_tag->text($text);
         }
     }

     function addAnchorWithImage($parent,$class_name,$child_name,$href_link=null,$img_src=null,$img_alt=null){
        $image =$this->addParentWithListItemAndAnchor($parent,$href_link)->addElement($child_name)
         ->set('class',$class_name);
         if(!is_null($img_src)){
            $image->set('src',$img_src);
         }
         if(!is_null($img_alt)){
            $image->set('alt',$img_alt);
         }
     }
     function createCommentCount($parent){
        $ul1 = $parent->addElement('ul')->set('class','float-right');
        $this->addAnchorWithChild($ul1,'fa fa-comments','i');
        //<li><a><i class="fa fa-comments"></i></a></li>
        $this->addAnchorWithChild($ul1,'mr-5','em',null,'12');
        //<li><a><em class="mr-5">12</em></a></li>
        $this->addAnchorWithChild($ul1,'fa fa-share-alt','i');
        $this->addAnchorWithChild($ul1,'mr-3','em',null,'03');
        $ul2 = $parent->addElement('ul');
        $this->addAnchorWithChild($ul2,'fa fa-thumbs-up','i');
        $images = array('assets/img/users/3.jpeg','assets/img/users/1.jpg','assets/img/users/5.jpg','assets/img/users/2.jpg');
        $this->addImages($ul2,$images);
        $this->addAnchorWithChild($ul2,null,'span',null,'242 Likes');

     }
function addImages($parent,$images){
foreach($images as $image){
    $this->addAnchorWithImage($parent,'img-fluid rounded-circle','img','#',$image,'User');
    //<li><a href="#"><img src="assets/img/users/2.jpg" class="img-fluid rounded-circle" alt="User"></a>
}
}
     

     
     function createCardboxBase($parent){
$base_div = $parent->addElement('div')->set('class','cardbox-base');
$this->createCommentCount($base_div);
// echo($base_div);
       
     }
     function createContent($parent,$text){
      $img_div = $parent->addElement('div')->set('class','cardbox-item');
      $img_div->addElement('p')
      ->text($text);
      // ->set('src',$image_src)
      // ->set('alt','Image');
     // echo($img_div);
   //    <div class="cardbox-item">
   //    <img class="img-fluid" src="assets/img/1.jpg" alt="Image">
   // </div>
     }
     function createPostImage($parent,$image_src){
      $img_div = $parent->addElement('div')->set('class','cardbox-item');
      $img_div->addElement('img')
      ->set('class','img-fluid')
      ->set('src',$image_src)
      ->set('alt','Image');
     // echo($img_div);
   //    <div class="cardbox-item">
   //    <img class="img-fluid" src="assets/img/1.jpg" alt="Image">
   // </div>
     }


     function createUserHeader($parent,$post_by,$post_location,$post_time,$post_by_dp){
        $user_header_div = $parent->addElement('div')->set('class','media m-0');
        $anchor_div = $user_header_div->addElement('div')
        ->set('class','d-flex mr-3');
        $a = $anchor_div->addElement('a')
        ->set('href','');
        $this->createImage($a,'img-fluid rounded-circle',$post_by_dp,'User');
        $user_media_body = $user_header_div->addElement('div')
        ->set('class','media-body');
        $user_media_body->addElement('p')
        ->set('class','m-0')
        ->text($post_by);
        $this->addSmallSpan($user_media_body,'icon ion-md-pin',$post_location);
        $this->addSmallSpan($user_media_body,'icon ion-md-time',$post_time);
        //echo($user_header_div);

//       <div class="media m-0">
//       <div class="d-flex mr-3">
//          <a href=""><img class="img-fluid rounded-circle" src="assets/img/users/4.jpg" alt="User"></a>
//       </div>
//       <div class="media-body">
//          <p class="m-0">Benjamin Robinson</p>
//          <small><span><i class="icon ion-md-pin"></i> Nairobi, Kenya</span></small>
//          <small><span><i class="icon ion-md-time"></i> 10 hours ago</span></small>
//       </div>
//    </div>
// </div>
     }
     function createImage($parent,$class,$src,$alt){
      $parent->addElement('img')
      ->set('class',$class)
      ->set('src',$src)
      ->set('alt',$alt);
     }

     function addSmallSpan($parent,$class,$text){
      $parent->addElement('small')
      ->addElement('span')
      ->addElement('i')
      ->set('class',$class)
      ->text($text);
     }

     function createCardBoxHeading($parent,$menuItems){
        $div_cardbox_heading = $parent->addElement('div')->set('class','cardbox-heading');
        $div_dropdown = $div_cardbox_heading->addElement('div')->set('class','dropdown float-right');
        $div_dropdown ->addElement('button')->set('class','btn btn-flat btn-flat-icon')
        ->set('type','button')
        ->set('data-toggle','dropdown')
        ->set('aria-expanded','false')
        ->addElement('em')
      ->set('class','fa fa-ellipsis-h');
      $div_dropdown_menu = $div_dropdown->addElement('div')
      ->set('class','dropdown-menu dropdown-scale dropdown-menu-right')
      ->set('role','menu')
      ->set('style','position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;');
      $this->addDropDown($div_dropdown_menu,$menuItems);
// echo $div_cardbox_heading;
      // <div class="cardbox-heading">
      // <div class="dropdown float-right">
      //    <button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown"
      //       aria-expanded="false">
      //       <em class="fa fa-ellipsis-h"></em>
      //    </button>
      //    <div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu"
      //       style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
      //       $menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
      //       // $menuIds = array("hidePost","stopFollowing","report");
      //    </div>
      // </div>
     }
}

// Check here
// function showcalendar(){
//    echo '
// <!-- Ashwin: Calendar -->
// <!-- The Modal -->
// <div id="myModal" class="modal">

// <!-- Modal content -->
// <div class="modal-content">
// 	<span class="close">&times;</span>
//    <div id="calendar"></div>

// </div>'
// }

?>