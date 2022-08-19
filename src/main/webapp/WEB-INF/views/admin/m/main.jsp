<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>
<script type="text/javascript">
	
	window.addEventListener("DOMContentLoaded", function() {
			
	});
</script>
</head>
<body>

	<p>임시 관리자 메인화면</p>
	<div class="container-fluid">
	
	<c:choose>
		<c:when test="${admin != null}">

			<div class="row py-3 border border-2">
				<div class="col-7">${admin.admin_id}</div>
				<div class="col-3"><a href="../lg/logout">로그아웃</a></div>
			</div>	
			<div class="row py-3 border border-2">
				<div class="col">
					<h3>회원관리</h3>
					<a href="../mmgt/totalConsumerList">일반 회원 리스트</a><br>
					<a href="">사업자 회원 리스트</a>
				</div>
			</div>	
			<div class="row py-3 border border-2">
				<div class="col">
					<h3>상점관리</h3>
					<a href="">상점 리스트</a><br>
					<a href="">상점 매출현황</a>
				</div>
			</div>
			<div class="row py-3 border border-2">
				<div class="col">
					<h3><a href="">주문관리</a></h3>
				</div>
			</div>
			<div class="row py-3 border border-2">
				<div class="col">
					<h3>고객센터 관리</h3>
					<a href="">일반회원 1:1 문의</a><br>
					<a href="">일반회원 자주묻는 질문</a><br>
					<a href="">사업자회원 1:1 문의</a>
				</div>
			</div>
			<div class="row py-3 border border-2">
				<div class="col">
					<h3>공지사항 관리</h3>
					<a href="">일반회원 공지사항</a><br>
					<a href="">사업자회원 공지사항</a>
				</div>
			</div>
			
			<div class="row py-3 border border-2">
				<div class="col">
					<h3>쿠폰 관리</h3>
					<a href="../mmgt/couponMain">쿠폰 생성 리스트</a><br>
				</div>
			</div>
			
		</c:when>
		<c:otherwise>
			비회원입니다.
			<a href="../lg/login">로그인하기</a>
		</c:otherwise>
	</c:choose>
	</div>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>