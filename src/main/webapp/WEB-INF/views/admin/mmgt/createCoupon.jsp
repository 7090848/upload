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
<title>쿠폰 생성</title>
</head>
<body>
	<c:choose>
		<c:when test="${admin != null}">
	
	<!-- 시작 -->
		 <div class="container-fluid px-4">
            
            <div class="row mx-0 bg-secondary bg-opacity-25 py-2 mt-3">
                <div class="col-3" style="font-size: x-large;"><a href="../mmgt/couponMain" class="text-decoration-none text-black"><i class="bi bi-arrow-left"></i></a></div>
                <div class="col-6" style="text-align: center;font-size: larger;font-weight: bold;">쿠폰 생성</div>
                <div class="col-3" style="text-align: end; font-size: x-large;"><a href="../main" class="text-decoration-none text-black"><i class="bi bi-house-door-fill"></i></a></div>
            </div>
            
            <form action="./createCouponProcess" method="post" enctype="multipart/form-data">
            <table class="table">
                <tbody class="text-center ">
                  
                  <tr>
                    <th scope="row" class="table-secondary">사진</th>
                    <td><input name="coupon_img" type="text"></td>
                  </tr>
                  <tr>
                    <th scope="row" class="table-secondary">쿠폰이름</th>
                    <td><input name="coupon_name" type="text"></td>
                  </tr>
                  <tr>
                    <th scope="row" class="table-secondary">쿠폰 할인 금액</th>
                    <td><input name="coupon_saleprice" type="number"></td>
                  </tr>
                  <tr>
                    <th scope="row" class="table-secondary">사용 종료일</th>
                    <td><input name="coupon_lastdate" type="date"></td>
                  </tr>
                  <tr>
                    <th scope="row" class="table-secondary">쿠폰 수량</th>
                    <td><input name="coupon_count" type="number"></td>
                  </tr>
                </tbody>               
              </table>
              <div class="row">
                  <div class="col"></div>
                  <div class="col text-end">
                    <input type="submit" value="쿠폰 생성" class="btn bg-secondary bg-opacity-25" style="font-size: large; font-weight: bold;">
                  </div>
              </div>
              </form>
		</div>
	<!-- 끝 -->
	
		
		</c:when>
		<c:otherwise>
			비회원입니다.
			<a href="../login">로그인하기</a>
		</c:otherwise>
	</c:choose>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>