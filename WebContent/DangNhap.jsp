<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>TinHocTayViet.com</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
	<title>Đăng nhập</title>
	<jsp:include page="/jsp/LibImport.jsp" />
	<link rel="stylesheet" href="/css/SignIn.css">
	<script src="/js/DangNhap-validate.js"></script>
	<script>
		$(document).ready(function(){	
			$('[data-toggle="popover"]').popover();
			if(${usernameCheck} == 0 && ${isChecked} != null){
				usernameInput = $('#username')[0];
				usernameInput.setAttribute('data-content', 'Tên người dùng hoặc email không tồn tại!');
				$('#username').popover('show');	
				
				$('#username').val('${returnUsername}');
				$('#password').val('${returnPass}');
	
			}
			else{
				if(${passwordCheck} == 0 && ${isChecked} != null){
					passwordInput = $('#password')[0];
					passwordInput.setAttribute('data-content', 'Mật khẩu nhập vào chưa đúng!');	
					$('#password').popover('show');	
					
					$('#username').val('${returnUsername}');
					$('#password').val('${returnPass}');
				}
				else{
					$('#username').val('${returnUsername}');
					$('#password').val('${returnPass}');
				}
			}
		});
	</script>
</head>
<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Đăng Nhập</div>
      <div class="card-body">
        <form class="form-container my-auto" action="dang-nhap" method="post">
					<center><h1>Đăng Nhập</h1></center>
					<div class="form-group">
						<label>Tài Khoản</label> 
						<input type="text" class="form-control" placeholder="Tên đăng nhập"
						data-toggle="popover" data-content="" id="username" name="username">
						<small class="form-text"></small>
					</div>
					<div class="form-group">
						<label>Mật Khẩu</label>
						<input type="password" class="form-control" placeholder="Mật khẩu"
						data-toggle="popover" data-content="" id="password" name="password">
					</div>
					<br>
					<button type="submit" class="btn btn-success btn-block" id="submit-btn" name="login" value="Sign In">Đăng Nhập</button>
					<br>
										 
				</form>
        <div class="text-center">    
          <!--<a class="d-block small" href="forgot-password.html">Quên mật khẩu?</a>-->
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>

