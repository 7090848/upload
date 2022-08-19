<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  response.setHeader("Pragma","no-cache"); 
  response.setDateHeader("Expires",0); 
  response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Atelier</title>
<style type="text/css">
		
	#searchArea {
		display: flex;
	}
	
	#inputRefreshBtn {
		ont-weight : 900;
		  font-family: "Font Awesome 5 Free";
		  background-color : transparent;
		  border : none;
		  top: 22px;
		  right: 0px;
		  cursor : pointer;
		  position : absolute;
		  transform : translatey(-50%);
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/mainHome.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
	
window.addEventListener("DOMContentLoaded", function() {
});

</script>
</head>
<body>
	<div class="container-fluid fixed-top bg-light" id="container">
		<!-- 검색창 -->
		<div class="row py-2 border-bottom border-secondary-light" id="headerBox">
		
			<div class="col-1 px-0 mx-2 pt-1 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
			<div class="col input-group px-0" id="searchArea" onclick="location.href='./search';">
				  <input type="text" class="form-control" id="search" value="${searchWord }">
				  <div class="col-2 px-0 text-secondary text-opacity-50 text-center fs-6" id="inputRefreshBtn"><i class="bi bi-x-circle-fill"></i></div>
			</div>
			
			<div class="col-1 px-0 mx-1 pt-1 text-secondary text-center fs-1" id="searchBtn" onclick="location.href='../m/main';"><i class="bi bi-house"></i></div>
			<div class="col-1 px-0 mx-1 pt-1 text-secondary text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
		</div>
		<!-- ./검색창 -->
		
		<!-- 결과내용 시작 -->
		<c:if test="${productList != null && fn:length(productList) > 0}">
			<div class="row py-2">
				<div class="col-3 pt-1 px-3 text-small sub-grey"><span>${fn:length(productList)}개 작품</span></div>
			</div>
		</c:if>
	
		<!-- body -->
		 <div class="row px-1">
		 	<div class="col">
				<c:choose>
					<c:when test="${consumer != null}">
						<c:choose>
							<c:when test="${productList != null && fn:length(productList) > 0 }">
					 			<div class="row">
					 			<c:forEach items="${productList }" var="product">
						 				<div class="col-6 mb-3">
						 					<div class="row"></div>
						 					<div class="row px-2">
						 						<div class="col px-0">
						 							
						 							<div class="row my-1" onclick="location.href='../pd/productDetail?product_no=${product.PRODUCT_NO}';"><div class="col"><img class="pd-img" src="/uploadFiles/${product.PI_PATH }"></div></div>
						 							<div class="row mt-1" onclick="location.href='../st/storeDetail?store_no=${product.STORE_NO}';"><div class="col mx-1"><span class="text-small text-secondary">${product.STORE_NAME }</span></div></div>
						 							<div class="row" onclick="location.href='../pd/productDetail?product_no=${product.PRODUCT_NO}';"><div class="col mx-1"><span class="" >${product.PRODUCT_NAME }</span></div></div>
						 							<div class="row mt-1">
						 								<div class="col-1 mx-1 text-warning text-small"><i class="bi bi-star-fill"></i></div>
						 								<div class="col px-0 text-small"><span class="fw-bold">${product.STAR_AVG }</span><span class="text-secondary">(${product.REVIEW_COUNT })</span></div>
						 								<div class="col-2"></div>
						 							</div>
						 						
						 						</div>
						 					</div>
						 				</div>
					 				</c:forEach>
					 				</div>
								 </div>
							</c:when>
							<c:otherwise>
								<div class="row my-5 text-center">
									<div class="col">
										<div class="row ">
											<div class="col"><span style="color: #FFAB00;">'${searchWord }'</span><span class="sub-grey">에 대한<br>검색 결과가 없습니다.</span></div>
										</div>
										<div class="row">
											<div class="col-4"></div>
											<div class="col my-3 p-2 border border-secondary border-opacity-25 bg-white" onclick="location.href='./search';"><span>다시 검색하기</span></div>
											<div class="col-4"></div>
										</div>
										
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					
				</c:choose>
			</div>
		</div>		 
	</div>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>