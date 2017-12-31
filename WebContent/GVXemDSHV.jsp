<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<html data-brackets-id='744' lang="vi">

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
      <!--NÃºt Thu Nhá»-->
      <ul data-brackets-id='780' class="navbar-nav sidenav-toggler">
        <li data-brackets-id='781' class="nav-item">
          <a data-brackets-id='782' class="nav-link text-center" id="sidenavToggler">
            <i data-brackets-id='783' class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul data-brackets-id='784' class="navbar-nav ml-auto">
        <!--ÄÄng Xuáº¥t-->
        <li data-brackets-id='785' class="nav-item">
          <a data-brackets-id='786' class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i data-brackets-id='787' class="fa fa-fw fa-sign-out"></i>Đăng Xuất</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Ná»i dung -->
  <div data-brackets-id='788' class="content-wrapper">
    <div data-brackets-id='789' class="container-fluid">
      <!-- Example Data Table-->
      <div data-brackets-id='790' class="card mb-3">
        <div data-brackets-id='791' class="card-header">
          <i data-brackets-id='792' class="fa fa-table"></i>Danh Sách Học Viên</div>
        <div data-brackets-id='793' class="card-body">
          <div data-brackets-id='794' class="table-responsive">
            <table data-brackets-id='795' class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead data-brackets-id='796'>
                <tr data-brackets-id='797'>
                  <th data-brackets-id='798'>Mã Học Viên</th>
                  <th data-brackets-id='799'>Họ Học Viên</th>
                  <th data-brackets-id='800'>Tên Học Viên</th>
                  <th data-brackets-id='801'>Phái</th>
                  <th data-brackets-id='803'>Nơi Sinh</th>
                </tr>
              </thead>
               <tbody>
				<c:forEach var="row" items="${entries}">
					<tr class="${row.maHV}">
						<td class="mahocvien">${row.maHV}</td>
						<td class="hohocvien">${row.hoHV}</td>
						<td class="tenhv">${row.tenHV}</td>
						<td class="phai">${row.phai}</td>
						<td class="noisinh">${row.noiSinh}</td>
					</tr>
				</c:forEach>	
			</tbody>
              <tfoot data-brackets-id='804'>
                <tr data-brackets-id='805'>
                  <th data-brackets-id='798'>Mã Học Viên</th>
                  <th data-brackets-id='799'>Họ Học Viên</th>
                  <th data-brackets-id='800'>Tên Học Viên</th>
                  <th data-brackets-id='801'>Phái</th>
                  <th data-brackets-id='803'>Nơi Sinh</th>
                </tr>
            </table>
          </div>
        </div>
        <div data-brackets-id='862' class="card-footer small text-muted">ÄÃ£ cáº­p nháº­t ngÃ y thá»© ba lÃºc 11:59 PM</div>
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer data-brackets-id='863' class="sticky-footer">
      <div data-brackets-id='864' class="container">
        <div data-brackets-id='865' class="text-center">
          <small data-brackets-id='866'>Copyright Â© Tin Há»c TÃ¢y Viá»t</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a data-brackets-id='867' class="scroll-to-top rounded" href="#page-top">
      <i data-brackets-id='868' class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div data-brackets-id='869' class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div data-brackets-id='870' class="modal-dialog" role="document">
        <div data-brackets-id='871' class="modal-content">
          <div data-brackets-id='872' class="modal-header">
            <h5 data-brackets-id='873' class="modal-title" id="exampleModalLabel">Báº¡n cÃ³ tháº­t sá»± muá»n ÄÄng xuáº¥t?</h5>
            <button data-brackets-id='874' class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span data-brackets-id='875' aria-hidden="true">Ã</span>
            </button>
          </div>
          <div data-brackets-id='876' class="modal-body">Chá»n nÃºt "ÄÄng xuáº¥t" náº¿u báº¡n tháº­t sá»± muá»n ÄÄng xuáº¥t.</div>
          <div data-brackets-id='877' class="modal-footer">
            <button data-brackets-id='878' class="btn btn-secondary" type="button" data-dismiss="modal">Há»§y</button>
            <a data-brackets-id='879' class="btn btn-primary" href="login.html">ÄÄng xuáº¥t</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script data-brackets-id='880' src="vendor/jquery/jquery.min.js"></script>
    <script data-brackets-id='881' src="vendor/jquery/jquery.js"></script>
    <script data-brackets-id='882' src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script data-brackets-id='883' src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script data-brackets-id='884' src="vendor/chart.js/Chart.min.js"></script>
    <script data-brackets-id='885' src="vendor/datatables/jquery.dataTables.js"></script>
    <script data-brackets-id='886' src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script data-brackets-id='887' src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script data-brackets-id='888' src="js/sb-admin-datatables.js"></script>
    <script data-brackets-id='889' src="js/sb-admin-charts.js"></script>
    <script data-brackets-id='890' src="js/sb-admin-piecharts.js"></script>
    <script data-brackets-id='891'>
      
    </script>
  </div>
</body>

</html>
