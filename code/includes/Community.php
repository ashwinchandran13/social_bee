<?php
namespace HtmlGenerator;
// $root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
// $includes = $root.'includes/';
// $htmlCreator = $includes.'HtmlTag.php';
// $markup = $includes.'Markup.php';
// require $markup;
// require $htmlCreator;
// require 'db_connection.php';
// $community = new Community();
// $community->createCommunityType();

Class Community{
    function getCommunityId($limit)
    {
      
      return substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, $limit);
    }

    function addCommunity($in_community_id,$in_community_name,$in_community_description,$in_community_type,$in_created_by){
      $params = array(':in_community_id' => $in_community_id,':in_community_name' => $in_community_name, ':in_community_name' => $in_community_name, ':in_community_description' => $in_community_description, 
  ':in_created_by' => $in_created_by,':in_community_type' => $in_community_type);

 $sql = "CALL community_creation(:in_community_id,
 :in_community_name,
 :in_community_description,
 :in_created_by,
 :in_community_type
   ) ";
   executeProcedure($sql,$params);
    }

    function getCommunityType(){
      $sql = "SELECT `community_type_name` FROM tbl_community_type";
  return executeQuery($sql);
}
function createCommunityType(){
  $select = HtmlTag::createElement('select')->set('name','group_type');
  $community_types = $this->getCommunityType();
  foreach($community_types as $community_type){
    $select->addElement('option')->text($community_type['community_type_name']);
  }
  echo $select;
}
function createListItemForCommunityNav($parent,$href,$span_class,$num_to_display){
  $parent->addElement('li')
  ->addElement('a')->set('href',$href)
  ->addElement('span')->set('class',$span_class)
  ->addElement('mark')->text($num_to_display);
}
function createListItemForCommunityNavWithDiv($parent,$href,$span_class,$div_id){
  $parent->addElement('li')
  ->addElement('a')->set('href',$href)
  ->addElement('div')->set('id',$div_id)
  ->addElement('span')->set('class',$span_class);
}
function createCommunityNaviagtion(){
  $main_nav = HtmlTag::createElement('nav')->set('id','sidebar');
$nav_ul = $main_nav->addElement('ul')->set('class','dots');
$href="#";
$span_class ="glyphicon glyphicon-user";
$num_to_display ="21";
$this->createListItemForCommunityNav($nav_ul,$href,$span_class,$num_to_display);
$this->createListItemForCommunityNavWithDiv($nav_ul,"#","glyphicon glyphicon-plus","myBtn");
echo $main_nav;
//   <nav id="sidebar">
//   <ul class="dots">
//     <li>
//       <a href="#">
//         <span class="glyphicon glyphicon-user"><mark>23</mark></span>
//       </a>
//     </li>
//     <li>
//       <a href="#">
//         <span class="glyphicon glyphicon-envelope"><mark class="big swing">7</mark></span>
//       </a>
//     </li>
//     <li>
//       <a href="#">
//         <span class="glyphicon glyphicon-time"><mark class="rubberBand">99</mark></span>
//       </a>
//     </li>
//     <li>
//       <a href="#">
//         <span class="glyphicon glyphicon-list-alt"></span>
//       </a>
//     </li>
//     <li>
//     <br>
//     <br>
//     <br>
//     </li>
//     <li>
//     <!-- Ashwin: Permanent button for join and create a group-->
//       <a href="#">
//         <!-- Trigger/Open The Modal -->
//         <div id="myBtn">
//         <span class="glyphicon glyphicon-plus"></span></div>
//       </a>
//     <!-- Ends here -->
//     </li>
//   </ul>
// </nav>
}
}
?>