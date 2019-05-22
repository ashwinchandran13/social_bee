<?php
    //include 'db_connection.php';
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
    
if(isset($_POST['login_username']))
{
    session_start();
    $login_username = $_POST['login_username'];
    $_SESSION['login_username'] = $login_username;
    $root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
    $base = getBaseUrl();
    $homepage = 'Location:'.$base.'/social_bee/code/homelayout/index.php';

      $log = new Login();
   $data = $log -> validate($login_username,$_POST['login_password']);
   if(sizeof($data)>0){
    header($homepage);
     //echo 'URL: '.$homepage.'<br>';
    // echo $_SERVER['SERVER_NAME'];
   }
   else{
       echo 'Login failed for user: '.$login_username;
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