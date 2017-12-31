<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<fmt:requestEncoding value="UTF-8" />
<script type="text/javascript">
	$(document).ready(function(){
		$('.edit').click(function(){
			var id = $(this).attr('id');
 			$('#MaKhoa').val($('.'+id+' .mk').text());
			$('#NgayMoKhoa').val($('.'+id+' .nmk').text());
			$('#TenKhoaHoc').val($('.'+id+' .tk').text());
			$('#NoiDung').val($('.'+id+' .nd').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("khoaHocUpdate").value="true";
	}
</script>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>TinHocTayViet.com</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">Tin Học Tây Việt</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="/TinHocTayViet/TaiQuanLyTaiKhoan">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Quản Lí Tài Khoản</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/TaiQuanLyNhanVien">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Nhân Viên</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="/TinHocTayViet/LoadQuanLyKhoaHoc">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Quản Lí Khóa Học</span>
          </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Nội dung -->
  <div class="content-wrapper">
    <div class="container-fluid">
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">Quản Lí Khóa Học</li>
      </ol>
      <form method="post" action="ThemKhoaHoc" id="LoadQuanLyKhoaHoc">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Mã Khóa</label>
                <input name="maKhoa" class="form-control" id="MaKhoa" type="text" aria-describedby="nameHelp" placeholder="Nhập khóa học">
                <span class="error" id="error-MaKhoa"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Ngày Mở Khóa</label>
                <input name="ngayMoKhoa" class="form-control" id="NgayMoKhoa" type="date" aria-describedby="nameHelp" placeholder="Nhập ngày mở khóa">
                <span class="error" id="error-NgayMoKhoa"></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Tên Khóa Học</label>
                <input name="tenKhoaHoc" class="form-control" id="TenKhoaHoc" type="text" placeholder="Nhập tên khóa học">
                <span class="error" id="error-TenKhoaHoc"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Nội Dung</label>
                <input name="noiDung" class="form-control" id="NoiDung" type="text" placeholder="Nhập nội dung">
                <span class="error" id="error-GhiChu"></span>
              </div>
              <input class="update" type="hidden" name="khoaHocUpdate" id="khoaHocUpdate">
            </div>
          </div> 
          <div>            
               <!--<center><a class="btn btn-primary" href="">Lưu</a></center>-->
              <!--<center><button id="buttonSubmit" type="submit">Lưu</button></center>-->
              <center><input id="submit" type="submit" value="Save"/></center>
          </div>        
        </form>
      <!-- Example Data Table-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Thông Tin Khóa Học</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã Khóa</th>
                  <th>Tên Khóa</th>
                  <th>Ngày Mở Khóa</th>
                  <th>Ghi Chú</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="row" items="${entries}">
					<tr class="${row.maKhoa}">
						<td class="mk">${row.maKhoa}</td>
						<td class="tk">${row.tenKhoa}</td>
						<td class="nmk">${row.ngayMoKhoa}</td>
						<td class="nd">${row.noiDung}</td>
						<td>
						<button type="submit" name="insert" id="${row.maKhoa}" onclick="myFunction()" class="edit">Edit</button></td>
						<form method="post" action="XoaKhoaHoc">
						<td><button type="submit" name="delete" class="${row.maKhoa} delete">Delete</button></td>
						<input type="hidden" name="maKhoa" value="${row.maKhoa}">
						</form>
					</tr>
				</c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <th>Mã Khóa</th>
                  <th>Tên Khóa</th>
                  <th>Ngày Mở Khóa</th>
                  <th>Ghi Chú</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Đã cập nhật ngày thứ ba lúc 11:59 PM</div>
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Tin Học Tây Việt</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Bạn có thật sự muốn đăng xuất?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Chọn nút "Đăng xuất" nếu bạn thật sự muốn đăng xuất.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
            <a class="btn btn-primary" href="login.html">Đăng xuất</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery/jquery.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.js"></script>
    <script src="js/sb-admin-charts.js"></script>
    <script src="js/sb-admin-piecharts.js"></script>
  </div>
</body>

</html>
