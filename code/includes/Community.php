
<?php
// $community = new Community();
// echo($community->unique_code(8));
require 'db_connection.php';

Class Community{
    function getCommunityId()
    {
      $limit =20;
      return substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, $limit);
    }

    function addCommunity($in_community_name,$in_community_name){
      $params = array(':in_community_name' => $in_community_name, ':in_community_name' => $in_community_name, ':in_community_description' => $in_community_description, 
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
?>