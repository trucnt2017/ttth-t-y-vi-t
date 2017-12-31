<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="/TrungTamTinHoc/Assets/Images/favicon.png" type="image/x-icon" />
<link rel="stylesheet" href="/TrungTamTinHoc/Assets/bootstrap/bootstrap.min.css">
<script src="/TrungTamTinHoc/Assets/bootstrap/popper.min.js"></script>
<script src="/TrungTamTinHoc/Assets/jquery/jquery-3.2.1.min.js"></script>
<script src="/TrungTamTinHoc/Assets/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/TrungTamTinHoc/Scripts/Fragment/Contact-RegisterOnline.js"></script>
<link rel="stylesheet" href="/TrungTamTinHoc/Assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Contact-RegisterOnline.css">
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Header.css">
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Footer.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user == null}">
    <script>
    	$(document).ready(function(){
    		$('.dang-nhap .nav-link').text("Đăng nhập");
    		$('.dang-nhap .nav-link').attr("href", "/TrungTamTinHoc/dang-nhap");
    	});
    </script>
</c:if>
<c:if test="${sessionScope.user != null}">
    <script>
    	$(document).ready(function(){
    		$('.dang-nhap .nav-link').text("Đăng xuất");
    		$('.dang-nhap .nav-link').attr("href", "/TrungTamTinHoc/dang-xuat");
    	});
    </script>
</c:if>
