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
Class PostCreator{
    function addDropDown($menuItems,$menuIds){

        for($i=0; $i<count($menuItems); $i++){
            $tag = HtmlTag::createElement('a')
            ->set('class','dropdown-item')
            ->set('href','#')
            ->set('id',$menuIds[$i])
            ->text($menuItems[$i]);
            echo($tag);
        }
    }
    function createComments($comment_text){
        $comment = HtmlTag::createElement('div')->set('class','cardbox-comments');
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
        echo($comment);
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
     

     
     function createCardboxBase(){
$base_div = HtmlTag::createElement('div')->set('class','cardbox-base');
$this->createCommentCount($base_div);
echo($base_div);
        // <div class="cardbox-base">
								// 	<ul class="float-right">
								// 		<li><a><i class="fa fa-comments"></i></a></li>
								// 		<li><a><em class="mr-5">12</em></a></li>
								// 		<li><a><i class="fa fa-share-alt"></i></a></li>
								// 		<li><a><em class="mr-3">03</em></a></li>
								// 	</ul>
								// 	<ul>
								// 		<li><a><i class="fa fa-thumbs-up"></i></a></li>
								// 		<li><a href="#"><img src="assets/img/users/3.jpeg" class="img-fluid rounded-circle" alt="User"></a>
								// 		</li>
								// 		<li><a href="#"><img src="assets/img/users/1.jpg" class="img-fluid rounded-circle" alt="User"></a>
								// 		</li>
								// 		<li><a href="#"><img src="assets/img/users/5.jpg" class="img-fluid rounded-circle" alt="User"></a>
								// 		</li>
								// 		<li><a href="#"><img src="assets/img/users/2.jpg" class="img-fluid rounded-circle" alt="User"></a>
								// 		</li>
								// 		<li><a><span>242 Likes</span></a></li>
								// 	</ul>
								// </div>
     }

     
}
?>