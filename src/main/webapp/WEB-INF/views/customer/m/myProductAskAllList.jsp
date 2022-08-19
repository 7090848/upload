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
				<p>임시 상품 문의 전체 페이지</p>
				
			
			
			
		<c:forEach items= "${ask}" var ="ask">
				<div class="row py-3 border border-2">
				<td>구매자번호(나중에 닉네임으로) : ${ask.consumer_no}</td><br>
				<td>문의 : ${ask.product_ask_content}</td><br>
				<td>상품 : ${ask.product_no}</td><br>
				</div>
			
			</c:forEach>
		

	</div>
	
	
	<footer class="fixed-bottom">
		<div class="container-fluid">
			<div class="row">
				<div class= "col"></div>
				<div class= "col"></div>
				<div class= "col-4">
				
			
				
				</div>
			</div>
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
				
    	
    
</footer>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>