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
//  $postCreator->addDropDown($menuItems,$menuIds);
// $menuItems= array("hidePost"=>"Hide post","stopFollowing"=>"Stop following","report"=>"Report");
// $posted_by = "Ashwin";
// $posted_location = "Trivandrum, Kerala";
// $posted_time ="10 hours ago";
// $posted_by_dp="assets/img/users/4.jpg";
// $post_image="assets/img/1.jpg";
// $postCreator->createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_image);

Class PostCreator{


   function createPost($menuItems,$posted_by,$posted_location,$posted_time,$posted_by_dp,$post_image){
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
                        $this->createPostImage($cardbox_shadow,$post_image);
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
?>