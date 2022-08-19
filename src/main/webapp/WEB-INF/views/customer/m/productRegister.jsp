<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
	
		<form action="./productRegisterProcess" method="post">	
			<div class="row py-3">	
				<div class="mb-3">
		    	<input type="text" class="form-control" name = "product_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="상품 이름을 입력해주세요">
				</div>
			</div>
			<div class="row py-2 border border-1"> 
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_price" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="가격">
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">		
					 <textarea class="form-control"name = "product_description" placeholder="상세 설명" id="floatingTextarea" rows="10"></textarea>
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_post_price" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="배송비입력">
					</div>
				</div>	
				<div class="row mb-4">
					<button class="btn btn-outline-warning dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"style="color:pink;">상품분류</button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">디저트</a></li>
							    <li><a class="dropdown-item" href="#">의류</a></li>
							    <li><a class="dropdown-item" href="#">장난감</a></li>
							    <li><a class="dropdown-item" href="#">가구</a></li>
							    <li><a class="dropdown-item" href="#">등등</a></li>
							 </ul>
				</div>
				<div class="row mb-3"><input type="submit" value="등록요청" class="btn btn-outline-warning"></div>
			</div>	
		</form>
			
		<div class="row" style="height:300px;"></div>				
	</div>
				

	
	<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
	</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> --%>