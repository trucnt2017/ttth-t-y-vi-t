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
 			$('#idmadiem').val($('.'+id+' .md').text());
			$('#idmahocvien').val($('.'+id+' .mhv').text());
			$('#idmalop').val($('.'+id+' .ml').text());
			$('#idmanhanvien').val($('.'+id+' .mnv').text());
			$('#iddiem').val($('.'+id+' .d').text());
			$('#idghichu').val($('.'+id+' .gc').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("diemUpdate").value="true";
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
  <nav data-brackets-id='758' class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a data-brackets-id='759' class="navbar-brand" href="index.html">Tin Học Tây Việt</a>
    <button data-brackets-id='760' class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span data-brackets-id='761' class="navbar-toggler-icon"></span>
    </button>
    <div data-brackets-id='762' class="collapse navbar-collapse" id="navbarResponsive">
      <ul data-brackets-id='763' class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li data-brackets-id='764' class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a data-brackets-id='765' class="nav-link" href="/TinHocTayViet/LoadTKBGV">
            <i data-brackets-id='766' class="fa fa-fw fa-wrench"></i>
            <span data-brackets-id='767' class="nav-link-text">Xem Thời Khóa Biểu</span>
          </a>
        </li>
        <li data-brackets-id='768' class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a data-brackets-id='769' class="nav-link" href="/TinHocTayViet/LoadQuanLyDiem">
            <i data-brackets-id='770' class="fa fa-fw fa-wrench"></i>
            <span data-brackets-id='771' class="nav-link-text">Quản Lí Điểm Học Viên</span>
          </a>
        </li>
        
        <li data-brackets-id='776' class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a data-brackets-id='777' class="nav-link" href="/TinHocTayViet/LoadDanhSachHV">
            <i data-brackets-id='778' class="fa fa-fw fa-table"></i>
            <span data-brackets-id='779' class="nav-link-text">Xem Danh Sách Học Viên</span>
          </a>
        </li>
      </ul>
      <!--Nút Thu Nhỏ-->
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <!--Đăng Xuất-->
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Đăng Xuất</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Nội dung -->
  <div class="content-wrapper">
    <div class="container-fluid">
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">Quản Lí Điểm Học Viên</li>
      </ol>
      <form method="post" action="ThemDiem" id="QuanLyDiem">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Mã Điểm Thi</label>
                <input name="namemadiem" class="form-control" id="idmadiem" type="text" aria-describedby="nameHelp" placeholder="Nhập điểm thi">
                <span class="error" id="error-MaDiem"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Mã Học Viên</label>
                <input name="namemahocvien" class="form-control" id="idmahocvien" type=" text " aria-describedby="nameHelp" placeholder="Nhập mã học viên">
                <span class="error" id="error-MaHV"></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Mã Lớp</label>
                <input name="namemalop" class="form-control" id="idmalop" type="text" placeholder="Nhập mã lớp">
                <span class="error" id="error-MaLop"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Mã Nhân Viên</label>
                <input name="namemanhanvien" class="form-control" id="idmanhanvien" type="text" placeholder="Nhập mã nhân viên">
                <span class="error" id="error-MaKhoa"></span>
              </div>
                <div class="col-md-6">
                <label for="exampleInputPassword1">Điểm</label>
                <input name="namediem" class="form-control" id="iddiem" type="text" placeholder="Nhập điểm">
                <span class="error" id="error-Diem"></span>
              </div>
                <div class="col-md-6">
                <label for="exampleInputPassword1">Ghi Chú</label>
                <input name="nameghichu" class="form-control" id="idghichu" type="text" placeholder="Nhập ghi chú">
                <span class="error" id="error-Diem"></span>
              </div>
              <input class="diemUpdate" type="" name="diemUpdate" id="diemUpdate">
              </div>
                
            </div>
          </div> 
          <div>
               <!--<center><a class="btn btn-primary" href="">Lưu</a></center>-->
              <center><input id="submit" type="submit" value="Lưu"/></center>
          </div>        
        </form>
      <!-- Example Data Table-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>Chi Tiết Điểm Học Viên</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã Điểm Thi</th>
                  <th>Mã Học Viên</th>
                  <th>Mã Lớp</th>
                  <th>Mã Giáo Viên</th>
                  <th>Điểm</th>
                  <th>Ghi Chú</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Mã Điểm Thi</th>
                  <th>Mã Học Viên</th>
                  <th>Mã Lớp</th>
                  <th>Mã Giáo Viên</th>
                  <th>Điểm</th>
                  <th>Ghi Chú</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </tfoot>
              <tbody>
                <c:forEach var="row" items="${entries}">
					<tr class="${row.maDiem}">
						<td class="md">${row.maDiem}</td>
						<td class="mhv">${row.maHV}</td>
						<td class="ml">${row.maLop}</td>
						<td class="mnv">${row.maNV}</td>
						<td class="d">${row.diem}</td>
						<td class="gc">${row.ghiChu}</td>
						<td>
						<button type="submit" name="insert" id="${row.maDiem}" onclick="myFunction()" class="edit">Sửa</button></td>
						<form method="post" action="XoaKhoaHoc">
						<td><button type="submit" name="delete" class="${row.maDiem} delete">Xóa</button></td>
						<input type="hidden" name="maDiem" value="${row.maDiem}">
						</form>
					</tr>
				</c:forEach>
              </tbody>
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
    <script>
      
    </script>
  </div>
</body>

</html>
l>