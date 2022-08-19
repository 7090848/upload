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
<title>내 포인트 기록</title>
</head>

<body>
	<div class="row mt-4 mx-0 mb-2">
		<div class="col-1 ms-2"><a href="javascript:history.back();"><i class="bi bi-arrow-left"></i></a></div>
		<div class="col-8">적립금</div>
		
	</div>
	<div class="row me-0">
		<hr style="outline : solid auto;"/>
			<div class="col ms-3 sub-grey">사용가능한 적립금</div>
			<div class="col main-yellow" style="text-align-last: right;">${consumer.consumer_totalpoint} Point</div>
	
	</div>
		<hr style="outline : solid 1px auto;"/>
	
	
	<div class="row ms-3 sub-grey">적립금 이용 내역</div>
	<hr style="outline : solid 1px auto;"/>
	<div class="row mx-0" style="text-align: center;">
		
			<div class="col-3 sub-grey">적립 예정</div>
			<div class="col-3 border-end border-secondary border-opacity-50">0P</div>
			<div class="col-3 sub-grey">7일이내 만료</div>
			<div class="col-3">84P</div>
		
	</div>
	<hr style="outline : solid 1px auto;"/>
	
	<c:forEach items="${list}" var="list">
	<div class="row ms-3">
		<div class="row text-secondary text-opacity-50" style="font-size: smaller;font-family: emoji;">
			<div class="col-3 pe-0">
				<fmt:formatDate value="${list.point_date}" pattern="YYYY.MM.dd"/>
			</div>
			<div class="col-9 ps-0">
				도라미치킨 도라미치킨 도라미치킨 구현중
			</div>
		</div>
		<div class="row">
			<div class="col pb-2" style="justify-content: right;">만료예정</div>
			<div class="col text-secondary text-opacity-75 main-yellow" style="text-align: end;">${list.point_price} Point</div>
		</div>
	</div>
	<hr style="outline : solid 1px auto;"/>
	</c:forEach>
	
	 <nav aria-label="Page navigation example ">
				  <ul class="pagination " style="justify-content: center;">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true" style="color: black;">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">1</a></li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
				    <li class="page-item" style="color: black;">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true" style="color: black;">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			
			<div class="row text-secondary text-opacity-75 mx-3 mt-2" style="font-size: xx-small; font-family: system-ui; margin-left: 0px;">
	            <div class="col">
	            <div class="row" >itelier 광고&포인트</div>
	            <div class="row">itelier은 전자결제서비스 제공자 및 통신판매중개자이며 </div>
	            <div class="row">통신판매의 당사자가 아닙니다 상품, 상품정보 및 거래에 관한 </div>
	            <div class="row">의무와 책임은 판매자에게 있습니다<br><br></div>
	            <div class="row">itelier 사업자 정보</div>
	            <div class="row">(주) WHM</div>
				<div class="row">대표이사 : 신혜진</div>
				<div class="row">서울특별시 특별구 특별로 특별길 12</div>
				<div class="row">사업자 등록번호 : 107-99-99999</div>
				<div class="row">통신판매업신고 : 2022-서울마포-9999</div>
				<div class="row">atelier는 통신판매중개자이며 통신판매의 당사자가 아닙니다.</div>
				<div class="row">따라서 atelier는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.<br><br><br></div>
				<div class="row">Copyright @ 2022Baxkpaxkr All right reserved.</div>
				</div>
            </div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>