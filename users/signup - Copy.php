<?php
$_SESSION['base_url'] = 'http://localhost/PROJECT/production_automation/admin';
if (isset($_SESSION['login'])) {
  header("Location: dashboard.php");
}
require_once('../database_con.php');
$department = $con->query('select * from departments')->fetch_all(MYSQLI_ASSOC);
$design = $con->query('select * from users')->fetch_all(MYSQLI_ASSOC);
// echo '<pre>';
// print_r($department);
// print_r($design);
if (isset($_POST['submit'])) {
  $name = $_POST['name'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];
  $address = $_POST['address'];
  $department = $_POST['department'];
  $designation = $_POST['designation'];
  $photo = $_FILES['photo']['name'];
  $password = md5($_POST['password']);
  // echo '<pre>';
  // print_r($department);
  // print_r($designation);
  // print_r($photo);

  $con->query("INSERT INTO users(name, email, phone,address,department_id,designation,photo,password) VALUES ('$name','$email','$phone','$address','$department','$designation','$photo','$password')");

  ?>
  <script>
    window.location.assign('users_list.php')
  </script>
  <?php
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <link rel="stylesheet" href="../signup.css">
</head>

<body class="hold-transition login-page">
  <div class="mt-5">
    <div class="login-logo">
      <a href="index2.html">Sign UP</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form action="" method="post" enctype="multipart/form-data" id="frm_valid">
          <div class="row">
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="text" name="name" class="form-control" placeholder="Name">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-user"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="email" name="email" class="form-control" placeholder="Email">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="text" name="phone" class="form-control" placeholder="Phone">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-phone"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="text" name="address" class="form-control" placeholder="Address">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-address-book"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="input-group mb-3">
                <div class="custom-file">
                  <input type="file" name="photo" class="custom-file-input" id="exampleInputFile">
                  <label class="custom-file-label" for="exampleInputFile">Photo</label>
                </div>
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-photo-film"></span>
                  </div>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="input-group mb-3">
                <select name="department" id="department" class="form-control">
                  <option value="">Select Department</option>
                  <?php foreach ($department as $c) { ?>
                    <option value="<?php echo $c['id'] ?>">
                      <?php echo $c['name'] ?>
                    </option>
                  <?php } ?>
                </select>
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-building"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <select name="designation" id="designation" class="form-control">
                  <option value="">Select Designation</option>
                  <!-- <?php //foreach ($design as $c) { ?>
                    <option value="<?php //echo $c['designation'] ?>">
                      <?php //echo $c['designation'] ?>
                    </option> -->
                    <option value="CEO">CEO</option>
                    <option value="Manager">Manager</option>
                    <option value="Supervisor">Supervisor</option>
                    <option value="Worker">Worker</option>
                   
                  <?php //} ?>
                </select>
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fa-solid fa-users"></span>
                  </div>
                </div>
              </div>
            </div>


           



          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" id="pass">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <input type="password" name="con_password" class="form-control" placeholder="Confirm Password">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-8 pt-1">
              <a href="../dashboard.php" class="btn btn-info">Dashboard</a>
            </div>
            <!-- /.col -->
            <div class="col-4">
              <input type="submit" name="submit" class="btn btn-primary btn-block"></input>
            </div>
            <!-- /.col -->
          </div>
        </form>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->

  <!-- jQuery -->
  <script src="../plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../dist/js/adminlte.min.js"></script>
  <script src="../plugins/jquery-validation/jquery.validate.js"></script>
  <script>
    $(document).ready(function () {
      $('#frm_valid').validate({
        rules: {
          name: "required",
          email: "required",
          phone: "required",
          address: "required",
          department: "required",
          designation: "required",
          password: "required",
          con_password: {
            required: true,
            equalTo: pass,
          }

        },
        messages: {

        }
      })
    })
  </script>
</body>

</html>