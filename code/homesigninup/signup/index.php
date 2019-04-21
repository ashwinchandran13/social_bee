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
$registration =  $_SERVER['DOCUMENT_ROOT'].'/social_bee/code/includes/registration.php';
    include $registration;
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
          
          <form action="/" method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="email" />
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="pswd" />
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>

    <script type="text/javascript"></script>

    <script>
      // Get the modal
      var modal = document.getElementById('myModal');
      
      // Get the button that opens the modal
      var btn = document.getElementById("create");
      
      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];
      
      // When the user clicks the button, open the modal 
      btn.onclick = function() {
        modal.style.display = "block";
      }
      
      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
        modal.style.display = "none";
      }
      
      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
      </script>
      
   
</body>

</html>
