<?php
namespace HtmlGenerator;

?>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
      <link rel="stylesheet" href="css/style.css">
</head>

<body>
<?php

$root = $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/';
$includes = $root.'includes/';
$registration = $includes.'registration.php';
$login = $includes.'login.php';
$htmlCreator = $includes.'HtmlTag.php';
$markup = $includes.'Markup.php';
// $postCreator = $includes.'PostCreator.php';
    require $registration;
     require $login;
          require $markup;

     require $htmlCreator;
    //  require $postCreator;
    //  echo(HtmlTag::createElement('p')->text('some content'));
?>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form action="<?php $registration?>" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req" >*</span>
              </label>
              <input type="text"required autocomplete="off" name="fname" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req" >*</span>
              </label>
              <input type="text"required autocomplete="off" name="lname"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="email" />
          </div>

          <div class="field-wrap">
            <label>
              Phone No.<span class="req">*</span>
            </label>
            <input type="integer"required autocomplete="off" name="phone_no" />
          </div>
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="password" />
          </div>
          
           <div class="field-wrap">
            <label>
              Retype Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="repswd" />
          </div>
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="<?php $login ?>" method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="login_username" />
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="login_password" />
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button type="submit" class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div>
</div>
      



</body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="js/index.js"></script>
<script type="text/javascript"></script>
</html>
