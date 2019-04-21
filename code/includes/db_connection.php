<?php

function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "root";
 $db = "social_bee";
 try {
 $conn = new PDO("mysql:host=$dbhost;dbname=$db", $dbuser, $dbpass);
 echo "Connected successfully";
} catch (PDOException $pe) {
    die("Could not connect to the database $db :" . $pe->getMessage());
}
 return $conn;
 }
 

?>