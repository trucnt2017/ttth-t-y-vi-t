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
 			$('#MaChi').val($('.'+id+' .mc').text());
			$('#NoiDungChi').val($('.'+id+' .ndc').text());
			$('#NgayChi').val($('.'+id+' .nc').text());
			$('#GiaTien').val($('.'+id+' .gt').text());
			$('#MaNV').val($('.'+id+' .mnv').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("chiTieuUpdate").value="true";
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
          <a class="nav-link" href="TaiQuanLyHocVien">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Học Viên</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="LoadQuanLyLopHoc">
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
          <a class="nav-link" href="TaiQLyThoiKhoaBieu">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Thời Khóa Biểu</span>
          </a>
        </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="TaiQuanLyPhong">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Quản Lí Phòng</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="LoadQuanLyChiTieu">
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
        <li class="breadcrumb-item active">Nội Dung Chi Tiêu</li>
      </ol>
      <form method="post" action="ThemChiTieu" id="QuanLyChiTieu">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Mã Chi</label>
                <input name="namemaChi" class="form-control" id="MaChi" type="text" aria-describedby="nameHelp" placeholder="Nhập Mã Chi">
                <span class="error" id="error-TieuDe"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputName">Nội Dung Chi</label>
                <input name="namenoiDungChi" class="form-control" id="NoiDungChi" type="text" aria-describedby="nameHelp" placeholder="Nhập Nội Dung Chi">
                <span class="error" id="error-NoiDung"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputName">Ngày Chi</label>
                <input name="namengayChi" class="form-control" id="NgayChi" type="date" aria-describedby="nameHelp" placeholder="Nhập Ngày Chi">
                <span class="error" id="error-Nhom"></span>
              </div>
              <div class="col-md-6">
                <label for="exampleInputName">Giá Tiền</label>
                <input name="namegiaTien" class="form-control" id="GiaTien" type="text" aria-describedby="nameHelp" placeholder="Nhập Giá Tiền">
                <span class="error" id="error-TacGia"></span>
              </div>
                <div class="col-md-6">
                <label for="exampleInputName">Mã Nhân Viên</label>
                <select name="namemaNV" class="form-control" id="MaNV" type="combobox" placeholder="Chọn mã giáo viên">
                    <option value="NV01">NV01</option>
                    <option value="NV02">NV02 </option>
                    
                </select>
                <span class="error" id="error-TacGia"></span>
              </div>
              <input class="chiTieuUpdate" type="hidden" name="chiTieuUpdate" id="chiTieuUpdate">
              </div>
            </div>
          <div>
              <!--<center><button id="buttonSubmit" type="submit">Lưu</button></center>-->
              <center><input id="submit" type="submit" value="Lưu"/></center>
          </div>   
        </form>  
      <!-- Example Data Table-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Danh Sách Chi Tiêu</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã Chi</th>
                  <th>Nội Dung Chi</th>
                  <th>Ngày Chi</th>
                  <th>Giá Tiền</th>
                  <th>Mã Nhân Viên</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Mã Chi</th>
                  <th>Nội Dung Chi</th>
                  <th>Ngày Chi</th>
                  <th>Giá Tiền</th>
                  <th>Mã Nhân Viên</th>
                  <th colspan="2">Chức Năng</th>
                </tr>
              </tfoot>
              <tbody>
                <c:forEach var="row" items="${entries}">
					<tr class="${row.maChi}">
						<td class="mc">${row.maChi}</td>
						<td class="ndc">${row.noiDungChi}</td>
						<td class="nc">${row.ngayChi}</td>
						<td class="gt">${row.giaTien}</td>
						<td class="mnv">${row.maNV}</td>
						<td>
						<button type="submit" name="insert" id="${row.maChi}" onclick="myFunction()" class="edit">Sửa</button></td>
						<form method="post" action="XoaChiTieu">
						<td><button type="submit" name="delete" class="${row.maChi} delete">Xóa</button></td>
						<input type="hidden" name="maChi" value="${row.maChi}">
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
  </div>
</body>

</html>
