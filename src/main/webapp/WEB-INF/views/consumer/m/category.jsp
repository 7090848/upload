<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container-fluid bg-light">
	<div class="row pt-2">
		<div class="col-1 px-0 mx-2 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
		<div class="col px-0 mt-1 fs-5" id="searchArea"><span>카테고리</span></div>
		<div class="col-1 px-0 mx-2 text-secondary text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
	</div>
		
		<div class="row mb-1 px-1 border-top border-secondary-light">
			<c:choose>
				<c:when test="${categoryList != null}">
					<c:forEach items="${categoryList }" var="category">
					<div class="col-4">
						<div class="row my-2">
							<div class="col my-3" onclick="location.href='./categoryProductList?category_no=${category.product_category_no}';">
								<div class="row px-2 my-2"><div class="col img-wrapper"><img class="rounded-circle" src="/uploadFiles/${category.product_category_image_path }"></div></div>
								<div class="row fw-bold text-center text-small"><div class="col"><span>${category.product_category_name }</span></div></div>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					카테고리가 존재하지 않습니다.
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="row my-4"><div class="col"></div></div>
	
	</div>
	
	
		<div class="row pt-1 text-center text-secondary bg-light border boder-top border-secondary border-opacity-50 fixed-bottom">
		
			<div class="col ft-nav-btn" id="pd-tap" onclick="location.href='../m/main';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-house"></i></div></div>
				<div class="row text-small"><div class="col"><span>작품</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="search-tap" onclick="location.href='../m/search';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-search"></i></div></div>
				<div class="row text-small"><div class="col"><span>검색</span></div></div>
			</div>
			<div class="col ft-nav-btn fw-bold main-yellow" id="cate-tap" onclick="location.href='../m/category';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-list"></i></div></div>
				<div class="row text-small"><div class="col"><span>카테고리</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="my-tap" onclick="location.href='../mp/myPage';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-person"></i></div></div>
				<div class="row text-small"><div class="col"><span>내정보</span></div></div>
			</div>
			
		</div> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>