<?xml version="1.0" encoding="ISO-8859-1" ?>
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
			$('#taikhoan').val($('.'+id+' .tdn').text());
			$('#tenHienThi').val($('.'+id+' .tht').text());
			$('#password').val($('.'+id+' .mk').text());
			$('#quyen').val($('.'+id+' .pq').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("DiemUpdate").value="true";
	}
</script>
<!DOCTYPE html>
<html data-brackets-id='744' lang="en">

<head data-brackets-id='745'>
  <meta data-brackets-id='746' charset="utf-8">
  <meta data-brackets-id='747' http-equiv="X-UA-Compatible" content="IE=edge">
  <meta data-brackets-id='748' name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta data-brackets-id='749' name="description" content="">
  <meta data-brackets-id='750' name="author" content="">
  <title data-brackets-id='751'>TinHocTayViet.com</title>
  <!-- Bootstrap core CSS-->
  <link data-brackets-id='752' href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link data-brackets-id='753' href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link data-brackets-id='754' href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link data-brackets-id='755' href="css/sb-admin.css" rel="stylesheet">
  <script data-brackets-id='756' type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
</head>

<body data-brackets-id='757' class="fixed-nav sticky-footer bg-dark" id="page-top">
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
          <a data-brackets-id='769' class="nav-link" href="/TinHocTayViet/QuanLiDiem">
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
      <ul data-brackets-id='780' class="navbar-nav sidenav-toggler">
        <li data-brackets-id='781' class="nav-item">
          <a data-brackets-id='782' class="nav-link text-center" id="sidenavToggler">
            <i data-brackets-id='783' class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul data-brackets-id='784' class="navbar-nav ml-auto">
        <!--Đăng Xuất-->
        <li data-brackets-id='785' class="nav-item">
          <a data-brackets-id='786' class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i data-brackets-id='787' class="fa fa-fw fa-sign-out"></i>Đăng Xuất</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Nội dung -->
  <div class="content-wrapper">
    <div class="container-fluid">
      
      <!-- Example Data Table-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Thời Khóa Biểu</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã Lớp</th>
                  <th>Mã Khóa</th>
                  <th>Mã Phòng</th>
                  <th>Thời Gian</th>
                  
                </tr>
              </thead>
              <tbody>
				<c:forEach var="row" items="${entries}">
					<tr class="${row.maLop}">
						<td class="malop">${row.maLop}</td>
						<td class="makhoa">${row.maKhoa}</td>
						<td class="maphong">${row.maPhong}</td>
						<td class="tg">${row.ngayHoc}</td>
						
					</tr>
				</c:forEach>	
			</tbody>
              <tfoot>
                <tr>
                  <th>Mã Lớp</th>
                  <th>Mã Khóa</th>
                  <th>Mã Phòng</th>
                  <th>Thời Gian</th>
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




