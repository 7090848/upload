<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<title>할인쿠폰 받기</title>
</head>
<body>
	<!-- 여기부터가 시작 -->
	<body>
        <div class="container-fluid px-4">
            <div class="row mt-4 mb-2">
                <div class="col-5"><div class="row  mx-2 fw-bold fs-5">쿠폰발급 </div></div>
            </div>
            <div class="row mb-3" style="margin-left: 0; margin-right: 0;"> <hr class="my-1"><h1 class="display-1"></h1></div>
            
        <!-- 여기다가 쿠폰 -->
	        <c:forEach items="${dataList}" var="data">
	            <div class="row px-4 pb-3 fw-bold fs-5">
	                <span class="border border-warning">
	                    <div class="row">
	                        <div class="row bg-warning bg-opacity-25" style="font-size: large;  font-style:bolder;margin-left: 0em;">전체 상품 쿠폰</div>
	                            <div class="col">
	                                    <div class="row mt-2">
	                                        <div class="col"></div>
	                                        <div class="col-11"><p style="font-size: inherit;font-weight: lighter;">${data.coupon_name }</p></div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="row">
	                                            <div class="col"></div>
	                                            <div class="col-10"><p class="text-warning" style="font-size: x-large;font-weight: bolder;">${data.coupon_saleprice }원 할인</div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col"></div>
	                                            <div class="col-10"><p class="text-warning text-opacity-75" style="font-size: small;font-weight: bolder;"><fmt:formatDate value="${data.coupon_startdate}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${data.coupon_lastdate}" pattern="yy.MM.dd"/>까지</p></div>
	                                        </div>
	                                        <div class="row"></div>
	                                    </div>
	                            </div>
	                            <div class="col-3 border-3  border-warning" style="border-radius: 1em;border-left: outset;">
	                                <div class="row text-center" style="margin-top: 1em;"><a href="../mp/throwingCouponProcess?consumer_no=${consumer.consumer_no }&coupon_no=${data.coupon_no}" class="text-decoration-none" style="color: coral;"><i class="bi bi-box-arrow-in-down" style="font-size:xxx-large;"></i></a></div>
	                            </div>
	                    </div>
	                </span>
	            </div>
	      	</c:forEach>
	            
             <div class="row mt-3"> 
            		<div class="d-grid gap-2 text-center">
             			 <a href="../mp/coupon?consumer_no=${consumer.consumer_no}" class="btn btn-warning btn-lg" style="font-size: larger; margin-left: 0em; margin-right:0em;" type="button">쿠폰함으로</a>
           		 	</div>
			</div>

           <div class="row mt-5 text-center" style="margin-left: 0em; margin-right:0em; ">
	            <div class="row" style="font-size: 2em; ">
	                <div class="col"><a href="../m/main" class="text-decoration-none text-black"><i class="bi bi-house-door-fill"></i></a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-black"><i class="bi bi-search"></i></a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-black"><i class="bi bi-list-ul"></i></a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-warning text-opacity-75"><i class="bi bi-person-lines-fill"></i></a></div>
	            </div>
	            <div class="row" style="font-weight: bolder;">
	                <div class="col "><a href="../m/main" class="text-decoration-none text-black">홈</a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-black">검색</a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-black">카테고리</a></div>
	                <div class="col"><a href="#" class="text-decoration-none text-warning  text-opacity-75">내정보</a></div>
	            </div>
        	</div>
            
            
            
		</div>
	<!-- 여기가 끝 -->

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>