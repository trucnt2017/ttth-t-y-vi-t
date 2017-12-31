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
 			$('#MaLop').val($('.'+id+' .ml').text());
			$('#MaKhoa').val($('.'+id+' .mk').text());
			$('#MaNV').val($('.'+id+' .mnv').text());
			$('#TenLop').val($('.'+id+' .tl').text());
			$('#ThoiGianHoc').val($('.'+id+' .tgh').text());
			$('#CaDK').val($('.'+id+' .cdk').text());
			$('#NgayKhaiGiang').val($('.'+id+' .nkg').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("lopHocUpdate").value="true";
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
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/TaiQuanLyHocVien">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Học Viên</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/LoadQuanLyLopHoc">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Lớp Học</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="LoadNVTraCuuKH">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tra Cứu Khóa Học</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="LoadNVTraCuuGV">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tra Cứu Giáo Viên</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/TaiQLyThoiKhoaBieu">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Thời Khóa Biểu</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/TaiQuanLyPhong">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Phòng</span>
          </a>
        </li>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="/TinHocTayViet/LoadQuanLyChiTieu">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Chi Tiêu</span>
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
        <li class="breadcrumb-item active">Thông Tin Lớp Học</li>
      </ol>
      <form method="post" action="ThemLopHoc" id="QuanLyLopHoc">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Mã Lớp</label>
                <input name="maLop" class="form-control" id="MaLop" type="text" aria-describedby="nameHelp" placeholder="Nhập mã lớp">
                <span class="error" id="error-MaLop"></span>
              </div>
                <div class="col-md-6">
                <label for="exampleInputName">Thời Gian Học</label>
                <input name="thoiGianHoc" class="form-control" id="ThoiGianHoc" type="" aria-describedby="nameHelp" placeholder="Nhập thời gian học">
                <span class="error" id="error-TGHoc"></span>
              </div>
                <div class="col-md-6">
                <label for="exampleInputName">Mã Khóa</label>
                <select name="maKhoa" class="form-control" id="MaKhoa" type="combobox" placeholder="Ca Đăng Kí">
                    <option value="KH01">KH01</option>
                    <option value="KH02">KH02 </option>
                    
                </select>
              </div>
                <div class="col-md-6">
                <label for="exampleInputName">Ngày Khai Giảng</label>
                <input name="ngayKhaiGiang" class="form-control" id="NgayKhaiGiang" type="date" aria-describedby="nameHelp" placeholder="Nhập ngày khai giảng">
                <span class="error" id="error-NgKG"></span>
                </div>
                <div class="col-md-6">
                <label for="exampleInputName">Tên Lớp</label>
                <input name="tenLop" class="form-control" id="TenLop" type="text" aria-describedby="nameHelp" placeholder="Nhập tên lớp">
                <span class="error" id="error-TenLop"></span>
              </div>
                 <div class="col-md-6">
                <label for="exampleInputName">Ca Đăng Kí</label>
                <select name="caDK" class="form-control" id="CaDK" type="combobox" placeholder="Ca Đăng Kí">
                    <option value="Ca 1">Ca 1</option>
                    <option value="Ca 2">Ca 2 </option>
                    <option value="Ca 3">Ca 3</option>
                    <option value="Ca 4">Ca 4</option>
                </select>
                </div>
                <div class="col-md-6">
                <label for="exampleInputName">Mã Giáo Viên</label>
                <select name="maNV" class="form-control" id="MaNV" type="combobox" placeholder="Chọn mã giáo viên">
                    <option value="NV01">NV01</option>
                    <option value="NV02">NV02 </option>
                    
                </select>
                <span class="error" id="error-LinkBH"></span>
              </div>
              <input class="lopHocUpdate" type="hidden" name="lopHocUpdate" id="lopHocUpdate">
              </div>
              </div>
          <div>
                
              <!--<center><a class="btn btn-primary" href="">Lưu</a></center>-->
              <!--<center><button id="buttonSubmit" type="submit">Lưu</button></center>-->
              <center><input id="submit" type="submit" value="Lưu"/></center>
          </div>   
        </form>
        
        
      <!-- Example Data Table-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>Danh Sách Lớp Học</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã Lớp</th>
                  <th>Mã Khóa</th>
                  <th>Tên Lớp</th>
                  <th>Thời Gian Học</th>
                  <th>Ngày Khai Giảng</th>
                  <th>Ca Đăng Kí</th>
                  <th>Mã Giáo Viên</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="row" items="${entries}">
					<tr class="${row.maLop}">
						<td class="ml">${row.maLop}</td>
						<td class="mk">${row.maKhoa}</td>
						<td class="tl">${row.tenLop}</td>
						<td class="tgh">${row.thoiGianHoc}</td>
						<td class="nkg">${row.ngayKhaiGiang}</td>
						<td class="cdk">${row.caDK}</td>
						<td class="mnv">${row.maNV}</td>
						<td>
						<button type="submit" name="insert" id="${row.maLop}" onclick="myFunction()" class="edit">Sửa</button></td>
						<form method="post" action="XoaLopHoc">
						<td><button type="submit" name="delete" class="${row.maLop} delete">Xóa</button></td>
						<input type="hidden" name="maLop" value="${row.maLop}">
						</form>
					</tr>
				</c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <th>Mã Lớp</th>
                  <th>Mã Khóa</th>
                  <th>Tên Lớp</th>
                  <th>Thời Gian Học</th>
                  <th>Ngày Khai Giảng</th>
                  <th>Ca Đăng Kí</th>
                  <th>Mã Giáo Viên</th>
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
    <script>
      
    </script>
  </div>
</body>

</html>
