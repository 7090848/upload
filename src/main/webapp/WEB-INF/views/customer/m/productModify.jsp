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
				<p>임시 상품 수정 메인화면</p>
				
				<div class="row py-3 border border-2">
				<div class="col-7">${customer.customer_id} 님 안녕하세요</div>
			</div>	
			
			
			
			<div class="row py-3 border border-2">
				<div class="col">
				

					<form action="./productModifyProcess" method="post">
				상품 이름 : <input name = "product_name" type = "text">
				가격 : <input name = "product_price" type = "text">
				상품 상세 설명 : <input name = "product_description" type = "text">
				상품 배송비(여기서 하는게 맞나?) : <input name = "product_post_price" type = "text">
				 <input name = "product_no" type = "hidden" value="${detail.product_no }">
				think)) 상점 전화랑, 주소는 어떻게 넣을까? 아니 어디서 ? 일단 이 부분은 생각해보자
				상점 이름 프로필 외엔 기본 null 값으로 인서트 하자
				그리고 한번 생성은 하겠지만 상점을 2개 생성할 수는 없으니 수정으로 버튼이 바뀌어야 한다.
				<input type="submit" value="수정요청" class="btn btn-primary">				
				
				</form>
				
				
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
</html> 