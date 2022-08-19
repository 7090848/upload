<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="../../resources/css/common.css">
<title>내정보 이동</title>
</head>
<body>

	
 
    <jsp:include page="./common/header.jsp"></jsp:include>	
    
   
	
        
        <div class="container-fluid">
            <div class="fixed-top">
               
            </div>
            <div class="row" style="height:5;"></div>
            <div class="row py-3 border-bottom border-secondery  border-opacity-25">
                <div class="col-3"></div>            
                <div class="col-9 ">
                    <div class="row"  style="margin :auto;"> <span class="">환영합니다!</span></div>
                    <div class="row">
                        <div class="col">
                            <span class="align-bottom fs-5 fw-bold">${consumer.consumer_nickname } 님</span>
                        </div>
                    </div>
                    <div class="row"><a href="#" class="text-decoration-none main-yellow text-opacity-75">등급 : ${tier.CONSUMER_TIER_NAME }</a></div>
                </div>
            </div>
            <div class="row my-3 border-bottom border-secondery  border-opacity-25 pb-3" style="text-align: center; align-items: center;">
                <div class="col">
                	<div class="row  text-decoration-none text-dark fs-6" style="justify-content: center;">현재 보유 포인트</div>
                	<div class="row">
                		<p class=" mb-0"><a href="../mp/conPointLog" class="text-decoration-none text-dark mb-0 fs-6">${consumer.consumer_totalpoint } point</a></p>
                	</div>
                </div>
                <div class="col">
                	<div class="row text-decoration-none text-dark fs-6" style="justify-content: center;">현재 쿠폰 보유</div>
                	<div class="row">
                		<p class=" mb-0"><a href="../mp/coupon?consumer_no=${consumer.consumer_no }" class="text-decoration-none text-dark fs-6"> 쿠폰 : ${con} </a></p>
                	</div>
                </div>
            </div>
                                
           

            <div class="row border-bottom border-secondery  border-opacity-25 mb-3 pb-3" style="text-align: center; align-items: center;">
                <div class="col"><a href="#" class="text-decoration-none text-dark">배송현황</a></div>
                <div class="col"><a href="../mp/myWishList" class="text-decoration-none text-dark">내 찜 목록</a></div>
                <div class="col"> <a href="../mp/myReview" class="text-decoration-none text-dark">내 구매후기</a></div>
            </div>
            

            <div class="row">
                <span class="fs-6 fw-bold text-secondary ">마이페이지</span>
            </div>			
            <div class="row  p-2" style="margin-left: 0px;">
                <div class="col"><a href="../mp/orderList" class="text-decoration-none text-dark fs-6">내 주문 목록</a></div>
            </div>
            <div class="row  p-2 my-2" style="margin-left: 0px;">
                <div class="col ">
                    <a href="../mp/conPointLog" class="text-decoration-none text-dark fs-6">적립금 이용 내역</a>
                </div>
            </div>
            <div class="row  p-2 my-2" style="margin-left: 0px;">
                <div class="col">
                    <a href="#" class="text-decoration-none text-dark fs-6">쿠폰 이용 내역</a>
                </div>
            </div>
        
            <div class="row  p-2 my-2" style="margin-left: 0px;">
                <div class="col">
                    <a href="#" class="text-decoration-none text-dark fs-6">내 문의 내역</a>
                </div>
            </div>
            <div class="row  p-2 my-2" style="margin-left: 0px;">
                <div class="col">
                    <a href="#" class="text-decoration-none text-dark fs-6">고객센터</a>
                </div>
            </div>
            
           
             
            <div class="row"><a href="#">맨위로</a></div>
            <div class="row" style="height:80px;"></div>
        </div>
		
    <jsp:include page="./common/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>