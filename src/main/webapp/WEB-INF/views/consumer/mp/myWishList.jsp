<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<title>내찜 목록</title>
</head>
<body>
	
	<div class="row mt-4 mx-0" ">
		<div class="col-2" style="text-align:start;"><i class="bi bi-arrow-left"></i></div>
		<div class="col-3" style="text-align:start;">찜목록</div>
		<div class="col-7" style="text-align:end; letter-spacing: 0.3em;"><a href="#"><i class="bi bi-search text-decoration-none text-black"></i></a> <a href="../m/main"><i class="bi bi-house text-decoration-none text-black"></i></a> <a href="../cart/myCart"><i class="bi bi-cart text-decoration-none text-black"></i></a></div>
	</div>
	
	
	<div class="row mt-3">
		<div class="col-4 text-center"><a href="#" class="text-decoration-none main-yellow">작품</a></div>
		<div class="col-4 text-center"><a href="#" class="text-decoration-none sub-grey">온라인 클래스</a></div>
		<div class="col-4 text-center"><a href="#" class="text-decoration-none sub-grey">오프라인 클래스</a></div>
	</div>
	
	  <div class="row mb-4">
                <div class="col"> <hr class="my-1"><h1 class="display-1"></h1></div>
                <div class="col"> </div>
                <div class="col"> </div>
      </div>
	
	
	<div class="container-fluid bg-light">
	<c:choose>
		<c:when test="${consumer != null}">
			 <div class="row"><div class="col"></div></div>
			 <div class="row mb-3">
			 	<div class="col my-1 mx-1">
		 			<c:set var="i" value="0" />
		 			<c:set var="j" value="2" />
		 			<c:forEach items="${wish }" var="data">
				 		<c:if test="${i%j == 0}">
				 			<div class="row ">
	 			 		</c:if>
		 				<div class="col mb-3">
		 					<div class="row"></div>
		 					<div class="row px-2">
		 						<div class="col px-0">
		 							
		 							<div class="row my-1" onclick="location.href='../pd/productDetail?product_no=${data.PRODUCT_NO}';"><div class="col"><img class="pd-img " src="/uploadFiles/${data.PI_PATH }"></div></div>
		 							<div class="row mt-1" onclick="location.href='../st/storeDetail?store_no=${data.STORE_NO}';"><div class="col mx-1"><span class="text-small text-secondary">${data.STORE_NAME }</span></div></div>
		 							<div class="row" onclick="location.href='../pd/productDetail?product_no=${data.PRODUCT_NO}';"><div class="col mx-1"><span class="" >${data.PRODUCT_NAME }</span></div></div>
		 							
		 							
		 							<div class="row mt-1">
		 								<div class="col-7 mx-1 text-warning text-small">
			 								<c:forEach var="rating" items="${ratingOptions }" varStatus="status" begin="1" end="${data.STAR_AVG }">
			 									<i class="bi bi-star-fill"></i>
			 								</c:forEach>
		 								</div>
		 								<div class="col px-0 text-small"><span class="fw-bold">${data.STAR_AVG }</span><span class="text-secondary">(${data.REVIEW_COUNT })</span></div>
		 								<div class="col-2"></div>
		 							</div>
		 						</div>
		 					</div>
		 				</div>
		 				<c:if test="${i%j == j-1}">
		 				</div>
		 				</c:if>	
		 				<c:set var="i" value = "${i+1}" />	
	 				</c:forEach>
			 		</div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>