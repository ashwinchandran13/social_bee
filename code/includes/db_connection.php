<?php
// namespace HTMLGenerator;
function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "root";
 $db = "social_bee";
 try {
 $conn = new PDO("mysql:host=$dbhost;dbname=$db", $dbuser, $dbpass);
} catch (PDOException $pe) {
    die("Could not connect to the database $db :" . $pe->getMessage());
}
 return $conn;
 }
 
 function executeQuery($sql,$params=null){
  try{
    $conn = OpenCon();
    $stmt = $conn->prepare($sql);
    if($params == null){
      $stmt->execute();
    }else{
      $stmt->execute($params);
    }
  }
  catch(PDOException $e){
   echo $sql . "<br>" . $e->getMessage();
   return null;
  }
  $conn = null;
return $stmt->fetchAll();
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
?>