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


</head>
<body>	
	
	
	
	
	<div class="container-fluid">
		<div class="sticky-top">
				<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
				<p>임시 내 등급 페이지</p>
				
			<div class="row py-3 border border-2">
				당신의 등급은 : ${model.rank.store_tier_name }입니다<br>
			  	다음 등급 목표치 : ${model.rank.store_tier_achieved_amount} <br>
			  	현재 포인트는 : ${model.store.store_total_sales_amount } <br>
			</div>
			
	
			반복문으로 트로피 리스트 전체 출력- 이래야 훗날에 관리가 편함
			<div class="row py-3 border border-2">
			
	
			</div>
</div>

<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
</footer>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>