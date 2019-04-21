<?php
    include 'db_connection.php';

    if(isset($_POST['email']))
{
  register();
} 
// Class Registration{
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
 
  function register()
 {
  // echo $_POST['email'];
  $params = array(':fname' => $_POST['fname'], ':lname' => $_POST['lname'], ':email' => $_POST['email'], 
  ':phone_no' => $_POST['phone_no'],':user_name' => $_POST['email'],':password' => $_POST['password']);

 $sql = "CALL registration (
  :fname,
  :lname,
     :email,
     :phone_no,
     :user_name,
     :password
   ) ";
   executeProcedure($sql,$params);
 }
  function getOrganizationType(){
     $sql = "SELECT `name` FROM tbl_organization_type";
 return executeQuery($sql);
  }
    
  function executeQuery($sql){
     $conn = OpenCon();
     $result = $conn->query($sql);
     CloseCon($conn);
     if ($result->num_rows > 0) {
     return $result;
     }
     else{
       echo "0 results";
     }
  }
 
  function executeProcedure($sql,$params){
    try{
      $conn = OpenCon();
      $stmt = $conn->prepare($sql);
            $stmt->execute($params);
      $conn =null;
    }
   catch(PDOException $e){
    echo $sql . "<br>" . $e->getMessage();
   }
   }
// }

?>