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
				<p>임시 상점 프로필 메인화면</p>
				
				<div class="row py-3 border border-2">
				<div class="col-7">${customer.customer_id} 님 안녕하세요 </div>
			</div>	
			<div> ${customer.customer_no}입니다.</div>
			
			
			<div class="row py-3 border border-2">
				<div class="col">
				

					<form action="./profileModifyProcess" method="post">
				상점 이름 : <input name = "store_name" type = "text">
				상점 프로필 : <input name = "store_profile" type = "text">
				<input name ="customer_no" type ="hidden" value="${customer.customer_no}">
				여긴 수정페이지...
				
				<input type="submit" value="수정하기" class="btn btn-primary">				
				
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