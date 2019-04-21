<?php
    //include 'db_connection.php';

if(isset($_POST['login_username']))
{
    $root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
    $homepage = $root."homelayout/index.html";

      $log = new Login();
   $data = $log -> validate($_POST['login_username'],$_POST['login_password']);
   if(sizeof($data)>0){
    header("Location: ".$homepage);
   }
   else{
       echo 'Login failed for user: '.$_POST['login_username'];
   }
} 


Class Login{

    function validate($user_name, $password){
        $params = array(':user_name'=>$user_name,":password"=>$password);
        $sql = "SELECT reg.registration_id, reg.first_name, reg.last_name, reg.mobile_no, reg.user_name, login.user_type 
        FROM tbl_registration reg, tbl_login login 
        WHERE login.user_name = :user_name AND
        login.password = :password AND
        reg.user_name = login.user_name";
 return executeQuery($sql,$params);
    }

}

?>