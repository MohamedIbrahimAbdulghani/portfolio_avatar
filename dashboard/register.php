<?php
session_start();

require_once "lib/function.php";


if(!empty($_SESSION["user"])):
  header("Location: home.php");
endif;

if(isset($_POST["submit"])):

    // foreach($_POST as $key => $value):
    //     $$key = $value;
    // endforeach;
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    

    if(checkInputRequire($name)):
      $error_message[] = "Name Is require";
    endif;
    if(checkInputRequire($email)):
      $error_message[] = "Email Is Require";
    endif;
    if(checkInputRequire($password)):
      $error_message[] = "Password Is Require";
    endif;

    if(empty($error_message)):
      $result = addNewUser($name, $email, $password);
      $success_message = "Success";
      header("refresh:1;url=login.php");

    endif;




endif;

?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registration Page </title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="backassets/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="backassets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="backassets/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="" class="h1"><b>Register</b></a>
    </div>
    <div class="card-body">

    <?php if(!empty($error_message)): ?>
      <div class="alert alert-danger alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-ban"></i> Alert!</h5>
                  <ul>
                    <?php foreach($error_message as $error): ?>
                      <li><?php echo $error ?></li>
                    <?php endforeach; ?>
                  </ul>
      </div>  
    <?php endif; ?>

    <?php if(!empty($success_message)): ?>
      <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-check"></i><?php echo $success_message ?></h5>
      </div>  
    <?php endif; ?>


      <form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="POST">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Full name" name="name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block" name="submit">Register</button>
          </div>
          <!-- /.col -->
      </form>


      <a href="login.php" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="backassets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="backassets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="backassets/dist/js/adminlte.min.js"></script>
</body>
</html>
