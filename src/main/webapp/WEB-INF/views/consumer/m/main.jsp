<%
  response.setHeader("Pragma","no-cache"); 
  response.setDateHeader("Expires",0); 
  response.setHeader("Cache-Control", "no-cache");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
	#searchArea, #pdImgArea {
		display: flex;
	}
	
	#searchBtn {
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
	
	#likeBtn {
		ont-weight : 900;
		  font-family: "Font Awesome 5 Free";
		  background-color : transparent;
		  border : none;
		  cursor : pointer;
		  position : absolute;
		  transform : translatey(-50%);
		  top: 20px;
		  right: 5px;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/main.js"></script>
<script type="text/javascript" src="../../resources/js/productDetail.js"></script>
<script type="text/javascript">

window.addEventListener("DOMContentLoaded", function() {
	//showProductTap();
	refreshWishIcon();
});



</script>
</head>
<body>
	<div class="container-fluid bg-light" id="container">
		<!-- header -->
	 	<jsp:include page="./common/header.jsp" />
	 	
		<!-- body Ajax -->
		 <div class="row mx-1 my-1" id="bodyBox"></div>
		
		<!-- footer -->	
		<div class="row pt-1 text-center text-secondary bg-light border boder-top border-secondary border-opacity-50 fixed-bottom" id="footerBox">
		
			<div class="col ft-nav-btn fw-bold main-yellow" id="pd-tap" onclick="location.href='../m/main';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-house"></i></div></div>
				<div class="row text-small"><div class="col"><span>작품</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="search-tap" onclick="location.href='../m/search';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-search"></i></div></div>
				<div class="row text-small"><div class="col"><span>검색</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="cate-tap" onclick="location.href='../m/category';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-list"></i></div></div>
				<div class="row text-small"><div class="col"><span>카테고리</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="my-tap" onclick="location.href='../m/myPage';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-person"></i></div></div>
				<div class="row text-small"><div class="col"><span>내정보</span></div></div>
			</div>
			
		</div> 
	</div>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>