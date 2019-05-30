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
// $community->updateRole('ashwinchandran@gmail.com','79vwko88diwwkkgkc4k0','COMMUNITY_OWNER');

Class Community{

  function getBaseUrl() 
  {
      // output: /myproject/index.php
      $currentPath = $_SERVER['PHP_SELF']; 
  
      // output: Array ( [dirname] => /myproject [basename] => index.php [extension] => php [filename] => index ) 
      $pathInfo = pathinfo($currentPath); 
  
      // output: localhost
      $hostName = $_SERVER['HTTP_HOST']; 
  
      // output: http://
      $protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"],0,5))=='https'?'https':'http';
  
      // return: http://localhost/myproject/
      return $protocol.'://'.$hostName;
  }
  function joinCommunity($user_name, $community_id, $user_type){
    $params = array(':user_name' => $user_name,':community_id' =>$community_id,':user_type' => $user_type );
      $sql = "INSERT INTO tbl_user_role (user_name,community_id,user_type) VALUES (:user_name,:community_id,:user_type)";
   executeProcedure($sql,$params);
  }

  function updateRole($user_name, $community_id, $user_type){
    $params = array(':user_name' => $user_name,':community_id' =>$community_id,':user_type' => $user_type );
      $sql = "UPDATE tbl_user_role SET user_type = :user_type WHERE  user_name = :user_name AND community_id = :community_id";
   executeProcedure($sql,$params);
  }
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
function getCommunityDetails($user_name){
  $params = array(':user_name' => $user_name);

      $sql = "SELECT  com.community_id, com.community_name, com.community_type, com.created_time, role.user_type
      FROM tbl_community com, tbl_user_role role
      WHERE role.user_name=:user_name AND
      role.community_id = com.community_id";
  return executeQuery($sql,$params);
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
function createListItemForCommunityNav($community_id,$community_name,$parent,$href,$span_class,$num_to_display){
  $parent->addElement('li')->set('id',$community_id)->set('name',$community_name)
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
function createCommunityNaviagtion($user_name){
  $main_nav = HtmlTag::createElement('nav')->set('id','sidebar');
$nav_ul = $main_nav->addElement('ul')->set('class','dots');
$community_details = $this->getCommunityDetails($user_name);
foreach($community_details as $community){
$span_class ="glyphicon glyphicon-user";
$num_to_display ="21";
$community_name = $community['community_name'];
$community_id = $community['community_id'];
$user_type = $community['user_type'];
$url = $this->getBaseUrl().'/social_bee/code/homelayout/index.php?group_id='.$community_id.'&user_type='.$user_type;
$href=$url;

$this->createListItemForCommunityNav($community_id,$community_name,$nav_ul,$href,$span_class,$num_to_display);
}
$this->createListItemForCommunityNavWithDiv($nav_ul,"#","glyphicon glyphicon-plus","myBtn");

echo $main_nav;
return $community_details;
}
}
?>