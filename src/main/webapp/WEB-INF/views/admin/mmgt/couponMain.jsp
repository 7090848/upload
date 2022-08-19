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
<title>쿠폰 현황</title>

</head>
<body>
	<c:choose>
		<c:when test="${admin != null}">
		<!--status의 값이 null인 경우  -->
		
		<!-- 시작 -->

	<div class="container-fluid px-4">
            
            <div class="row mx-0 bg-secondary bg-opacity-25 mt-3">
                <div class="col-3 text-decoration-none text-black" style="font-size: x-large;" onclick="history.back();"><i class="bi bi-arrow-left"></i></div>
                <div class="col-6" style="text-align: center;font-size: larger;font-weight: bold;">전체 쿠폰 리스트</div>
                <div class="col-3" style="text-align: end; font-size: x-large;"><a href="../m/main" class="text-decoration-none text-black"><i class="bi bi-house-door-fill"></i></a></div>
            </div>
            
            <table class="table">
                <tbody class="text-center ">
                  <tr>
                    <th  scope="row" class="table-secondary" >쿠폰일자</th>
                    <td ><input type="text" style="width: 7em;"></td>
                    <td>~</td>
                    <td><input type="text" style="width: 7em;"></td>
                  </tr>
                  <tr>
                    <th scope="row" class="table-secondary">쿠폰명</th>
                    <td><input type="text" style="width: 7em;"></td>
                    <td></td>
                    <td class="d-gird" style="text-align-last: end;"><button class="btn btn-warning btn-lg">검색</button></td>
                  </tr>
                </tbody>
              </table>

              <div class="row mx-0 mb-3">총 30건</div>
            
              <table class="table" style="font-size: x-small;">
                <thead class="table-light">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">쿠폰명</th>
                    <th scope="col">할인율</th>
                    <th scope="col">총수량</th>
                    <th scope="col">시작일</th>
                    <th scope="col">만료일</th>
                    <td scope="col">삭제</td>
                  </tr>
                </thead>
                  <!-- 여기 반복문 돌릴꺼 -->
				<c:forEach items="${dataList }" var="data">
                <tbody>
                  <tr>
                    <th scope="row">${data.coupon_no }</th>
                    <td>${data.coupon_name}</td>
                    <td>${data.coupon_saleprice}</td>
                    <td>${data.coupon_count }</td>
                    <td><fmt:formatDate value="${data.coupon_startdate}" pattern="yy.MM.dd"/></td>
                    <td><fmt:formatDate value="${data.coupon_lastdate}" pattern="yy.MM.dd"/></td>
                    <td><a href="../mmgt/deleteCouponProcess?coupon_no=${data.coupon_no }">삭제</a></td>
                  </tr>
                </tbody>
                </c:forEach>
                <!-- 여기까지 -->
              </table>

			<div class="row">
				<div class="col"></div>
				<div class="col">
					<nav aria-label="Page navigation example">
		               <ul class="pagination pt-3" style="place-content: center;">
							<li class="page-item">
			                   <a class="page-link" href="#" aria-label="Previous">
			                     <span aria-hidden="true">&laquo;</span>
			                   </a>
							</li>
			                 <li class="page-item"><a class="page-link" href="#">1</a></li>
			                 <li class="page-item"><a class="page-link" href="#">2</a></li>
			                 <li class="page-item"><a class="page-link" href="#">3</a></li>
			                 <li class="page-item">
			                   <a class="page-link" href="#" aria-label="Next">
			                     <span aria-hidden="true">&raquo;</span>
			                   </a>
							</li>
	               		</ul>
	             	</nav>
				</div>
				<div class="col mt-3">
					<a href="../mmgt/createCoupon" class="btn btn-warning btn-lg" style="font-size: small;">쿠폰 생성</a>
				</div>
			</div>
</div>
	             
       
        
	 
<!-- 		    <div class="row py-3 border border-2"> -->
<!-- 				<div class="col"> -->
<!-- 					<h1>만료된 쿠폰</h1> -->
<!-- 					<a>쿠폰 번호 : </a><br> -->
<!-- 					<a>쿠폰 이름 : </a><br> -->
<!-- 					<a>할인 금액 : </a><br> -->
<!-- 					<a>잔여량 : </a><br> -->
<!-- 					<a>쿠폰 생성일 ~ </a> <a> 쿠폰 만료일</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			
		</c:when>
		<c:otherwise>
			비회원입니다.
			<a href="../login">로그인하기</a>
		</c:otherwise>
	</c:choose>

       


		
		<!-- 이제 끝 -->	
				
				
		
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>