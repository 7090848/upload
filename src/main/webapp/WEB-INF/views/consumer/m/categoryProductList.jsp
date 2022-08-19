<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<title>Atelier</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/mainHome.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container-fluid bg-light" id="container">
	
		<!-- header -->
		<div class="row pt-2 border-bottom border-secondary-light" id="headerBox">
			<div class="col-1 px-0 mx-2 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
			<div class="col px-0 mt-1"><span>${category.product_category_name }</span></div>
			<div class="col-1 px-0 mx-2 text-secondary text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
		</div>
		
		<c:if test="${productList != null && fn:length(productList) > 0}">
			<div class="row py-2">
				<div class="col-3 pt-1 px-3 text-small sub-grey"><span>${fn:length(productList)}개 작품</span></div>
			</div>
		</c:if>
		
		<!-- body -->  
		<div class="row px-1 my-2">
			<div class="col">
				<c:choose>
					<c:when test="${consumer != null}">
			 			<div class="row ">
			 			<c:forEach items="${productList }" var="product">
			 				<div class="col-6 mb-3">
			 					<div class="row"></div>
			 					<div class="row px-2">
			 						<div class="col px-0">
			 							
			 							<div class="row my-1" onclick="location.href='../pd/productDetail?product_no=${product.PRODUCT_NO}';"><div class="col"><img class="pd-img" src="/uploadFiles/${product.PI_PATH }"></div></div>
			 							<div class="row mt-1" onclick="location.href='../st/storeDetail?store_no=${product.STORE_NO}';"><div class="col mx-1"><span class="text-small text-secondary">${product.STORE_NAME }</span></div></div>
			 							<div class="row" onclick="location.href='../pd/productDetail?product_no=${product.PRODUCT_NO}';"><div class="col mx-1"><span class="" >${product.PRODUCT_NAME }</span></div></div>
			 							<div class="row mt-1">
			 								<div class="col-1 mx-1 text-warning text-small">
			 									<i class="bi bi-star-fill"></i>
			 								</div>
			 								<div class="col px-0 text-small"><span class="fw-bold">${product.STAR_AVG }</span><span class="text-secondary">(${product.REVIEW_COUNT })</span></div>
			 								<div class="col-2"></div>
			 							</div>
			 						
			 						</div>
			 					</div>
			 				</div>
		 				</c:forEach>
				 		</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>