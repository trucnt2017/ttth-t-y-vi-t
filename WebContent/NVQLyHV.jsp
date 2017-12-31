<?xml version="1.0" encoding="UTF-8" ?>
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
		$('.edit1').click(function(){
			var id = $(this).attr('id');
 			$('#idmahocvien').val($('.'+id+' .mhv').text());
			$('#idhohocvien').val($('.'+id+' .hhv').text());
			$('#idtenhocvien').val($('.'+id+' .thv').text());
			$('#idphai').val($('.'+id+' .p').text());
			$('#idnoisinh').val($('.'+id+' .ns').text());
			$('#idfacebook').val($('.'+id+' .fb').text());
			$('#idmalop').val($('.'+id+' .ml').text());
			$('#idsodienthoai').val($('.'+id+' .sdt').text());
			$('#idemail').val($('.'+id+' .e').text());
			$('#idngaydangki').val($('.'+id+' .ndk').text());
			$('#idtinhtrang').val($('.'+id+' .tt').text());
			$('#idghichu').val($('.'+id+' .gc').text());
			$('#idmanhanvien').val($('.'+id+' .mnv').text());
			event.preventDefault();
		});
	});
	function myFunction(){
		document.getElementById("update").value="true";
	}
</script>
<!DOCTYPE html>
<html lang="vi">
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
                    <a class="nav-link" href="NVQliTT.html">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Quản Lí Tin Tức</span>
          </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a class="nav-link" href="NVTuVanTT.html">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Tư Vấn Trực Tuyến</span>
          </a>
                </li>
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
                    <a class="nav-link" href="NVTraCuuKH.html">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tra Cứu Khóa Học</span>
          </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                    <a class="nav-link" href="NVTraCuuGV.html">
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
                <li class="breadcrumb-item active">Thông Tin Học Viên</li>
            </ol>
            <form method="post" action="LuuHocVien" id="QuanLyHocVien">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
			                <label>Mã Phòng</label>
			                <input name="namemahocvien" class="form-control" id="idmahocvien" type="text" aria-describedby="nameHelp" placeholder="Nhập mã phòng">
			                <span class="error" id="error-MaPhong"></span>
			              </div>
                        <div class="col-md-6">
                            <label>Mã Lớp</label>
                            <input name="namemalop" class="form-control" id="idmalop" type="text" aria-describedby="nameHelp" placeholder="Nhập mã lớp">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label>Họ Học Viên</label>
                            <input name="namehohocvien" class="form-control" id="idhohocvien" type="text" aria-describedby="nameHelp" placeholder="Nhập họ học viên">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label>Số Điện Thoại</label>
                            <input name="namesodienthoai" class="form-control" id="idsodienthoai" type="text" aria-describedby="nameHelp" placeholder="Nhập số điện thoại">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label>Tên Học Viên</label>
                            <input name="nametenhocvien" class="form-control" id="idtenhocvien" type="text" aria-describedby="nameHelp" placeholder="Nhập tên học viên">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <input name="nameemail" class="form-control" id="idemail" type="text" aria-describedby="nameHelp" placeholder="Nhập Email">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                         <label>Phái</label>
                           <select name="namephai" class="form-control" id="idphai" type="combobox" aria-describedby="nameHelp" placeholder="Nhập giới tính">
                                <option value="Nam">Nam</option>
                                <option value="Nu">Nữ</option>
			                </select>        
			                <span class="error" id="error"></span>
			              </div>
                         <div class="col-md-6">
                            <label for="exampleInputName">Ngày Đăng Kí</label>
                            <input name="namengaydangki" class="form-control" id="idngaydangki" type="date" aria-describedby="nameHelp" placeholder="Nhập ngày đăng kí">
                            <span class="error" id="error"></span>
                        </div>
			              <div class="col-md-6">
                            <label for="exampleInputName">Nơi Sinh</label>
                            <input name="namenoisinh" class="form-control" id="idnoisinh" type="text" aria-describedby="nameHelp" placeholder="Nhập nơi sinh">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
			                <label>Tình Trạng</label>
			                <select name="nametinhtrang" class="form-control" id="idtinhtrang" type="combobox" aria-describedby="nameHelp" placeholder="Nhập tình trạng học">
			                    <option value="Con hoc">Còn học</option>
			                    <option value="Bao luu">Bảo lưu</option>
			                    <option value="Nghi hoc">Nghĩ học</option>
			                </select>        
			                <span class="error" id="error"></span>
			              </div>
                        <div class="col-md-6">
                            <label for="exampleInputName">FaceBook</label>
                            <input name="namefacebook" class="form-control" id="idfacebook" type="text" aria-describedby="nameHelp" placeholder="Nhập địa chỉ facebook">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label for="exampleInputName">Mã Nhân Viên</label>
                            <input name="namemanhanvien" class="form-control" id="idmanhanvien" type="text" aria-describedby="nameHelp" placeholder="Nhập mã nhân viên">
                            <span class="error" id="error"></span>
                        </div>
                        <div class="col-md-6">
                            <label for="exampleInputName">Ghi Chú</label>
                            <input name="nameghichu" class="form-control" id="idghichu" type="text" aria-describedby="nameHelp" placeholder="Nhập ghi chú">
                            <span class="error" id="error"></span>
                        </div>
                        <input class="update" type="hidden" name="update" id="update">
                    </div>
                </div>
                <div>
                    <!--<center><a class="btn btn-primary" href="">Lưu</a></center>-->
                    <center><input id="submit" onclick="alert('Lưu thông tin Học viên thành công!!!?')" type="submit" value="Lưu"/></center>
                </div>
            </form>
            <!-- Example Data Table-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>Danh Sách Học Viên</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Mã Học Viên</th>
                                    <th>Họ Học Viên</th>
                                    <th>Tên Học Viên</th>
                                    <th>Phái</th>
                                    <th>Nơi Sinh</th>
                                    <th>Facebook</th>
                                    <th>Mã Lớp</th>
                                    <th>Số Điện Thoại</th>                                    
                                    <th>Email</th>
                                    <th>Ngày Đăng Kí</th>
                                    <th>Tình Trang</th>
                                    <th>Ghi Chú</th>
                                    <th>Mã Nhân Viên</th>
                                    <th colspan="2">Chức Năng</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:forEach var="row" items="${entries}">
									<tr class="${row.maHV}">
										<td class="mhv">${row.maHV}</td>
										<td class="hhv">${row.hoHV}</td>
										<td class="thv">${row.tenHV}</td>
										<td class="p">${row.phai}</td>
										<td class="ns">${row.noiSinh}</td>
										<td class="fb">${row.facebook}</td>
										<td class="ml">${row.maLop}</td>
										<td class="sdt">${row.soDT}</td>
										<td class="e">${row.email}</td>
										<td class="ndk">${row.ngayDK}</td>
										<td class="tt">${row.tinhTrang}</td>
										<td class="gc">${row.ghiChu}</td>
										<td class="mnv">${row.maNV}</td>
										<td>
										   <button type="submit" name="insert" id="${row.maHV}" onclick="myFunction()" class="edit1">Sửa</button></td>
										<form method="post" action="XoaHocVien">
										<td><button type="submit" name="delete" onclick="return confirm('Bạn có muốn xóa thông tin học viên có mã số ${row.maHV} không?')" class="${row.maHV} delete">Xóa</button></td>
										<input type="hidden" name="maHV" value="${row.maHV}">
										</form>
									</tr>
								</c:forEach>	
							</tbody>
                            <tfoot>
                                <tr>
                                    <th>Mã Học Viên</th>
                                    <th>Họ Học Viên</th>
                                    <th>Tên Học Viên</th>
                                    <th>Phái</th>
                                    <th>Nơi Sinh</th>
                                    <th>Facebook</th>
                                    <th>Mã Lớp</th>
                                    <th>Số Điện Thoại</th>                                    
                                    <th>Email</th>
                                    <th>Ngày Đăng Kí</th>
                                    <th>Tình Trang</th>
                                    <th>Ghi Chú</th>
                                    <th>Mã Nhân Viên</th>
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
                        <a class="btn btn-primary" href="/TinHocTayViet/dang-nhap">Đăng xuất</a>
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