<?php
    include 'db_connection.php';

function getAllRegisteredUsers()
 {
    $sql = "SELECT
    `registration_id`,
    `first_name`,
    `last_name`,
    `organization_name`,
    `dob`,
    `email_id`,
    `user_name`,
    `mobile_no`
  FROM `social_bee`.`tbl_registration`";
return executeQuery($sql);
 }

 function register($first_name,$last_name,$organization_name,$dob,$email_id,$mobile_no,$user_name,$pass_word,$user_type)
{

}
 function getOrganizationType(){
    $sql = "SELECT
      `name`
  FROM `social_bee`.`tbl_registration`";
return executeQuery($sql);
 }
   
 function executeQuery($sql){
    $conn = OpenCon();
    $result = $conn->query($sql);
    CloseCon($conn);
    return $result;
 }
?>