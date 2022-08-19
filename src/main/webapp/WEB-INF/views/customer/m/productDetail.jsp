<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

</head>
<body>	
	
	
	
	
	<div class="container-fluid">
	<div class="sticky-top">
				<jsp:include page="../common/navbarTop.jsp"></jsp:include>
	</div>
				<p>임시 사업자 회원 메인화면</p>
				
				<div class="row py-3 border border-2">
				<div class="col-7">${customer.customer_id} 님 안녕하세요</div>
			</div>	
			<div class="row py-3 border border-2">
				<div class="col"><h2>
				상품 번호: ${detail.product_no}<br>
				상품 이름: ${detail.product_name}<br>
				상품 설명 : ${detail.product_description}<br>
				
				
				</h2></div>
				<div class="row py-3 border border-2">
				<a href="./productModify?productNo=${detail.product_no }">상품수정하기</a>
				</div>
			<div class="row py-3 border border-2">
			<a href="./myProductReviewList?productNo=${detail.product_no }">상품리뷰보기</a><br>
			<a href="./myProductAskList?productNo=${detail.product_no }">상품문의보기</a>
			</div>
	</div>
</div>
	<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
		</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>  --%>