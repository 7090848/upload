<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>장바구니</title>
<style type="text/css">
		.box {
		margin: 8px;
		padding: 3px;
		border: 2px solid pink;
	}
	.text-center{
		place-content:center;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">

	window.addEventListener("DOMContentLoaded", function(){
		changeMoneyUnit();
	})


</script>
</head>
<body>
<div class="container-fluid bg-secondary bg-opacity-25">
	<c:choose>
		<c:when test="${!empty consumer}">
			<div>
				<div class="row pt-2 bg-white">
					<div class="col-1 px-0 mx-2 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
					<div class="col px-0 mt-1 fs-5" id="searchArea"><span>주문결제</span></div>
				</div>
				
				
					
				
				<div class="row my-2 pb-2 bg-white">
					<div class="col">
						<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1">
							<div class="col text-center fs-3 px-0">주문완료</div>		
						</div>
						<div class="row text-center sub-grey mt-3">atelier을 이용해 주셔서 감사합니다</div>
						<div class="row text-center mx-1 mb-3 mt-2 py-2" style="background-color: #EAEAEA;">
							<c:choose>
								<c:when test="${fn:length(order.cartList) > 1 }">
									<strong>${order.cartList[0].product_name } 외 ${fn:length(order.cartList)-1 } 개 상품이 주문완료 되었습니다.</strong>						
								</c:when>
								<c:otherwise>
									<strong><span class="fs-5">${order.cartList[0].product_name } 제품이 주문완료 되었습니다.</span></strong>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="row text-center sub-grey">주문내역 확인은 배송/마이페이지의</div>
						<div class="row text-center sub-grey">"주문/배송조회"에서 하실 수 있습니다</div>
					</div>
					
				</div>
				
				<div class="row my-2 pb-2 bg-white">
					<div class="col">
							<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1">
								<div class="col fs-5 px-0">
									<span>주소(배송지)</span>
								</div>
								<div class="col text-end" onclick="updateAddr();"><span class="border border-secondary border-opacity-50 px-2 py-1 bg-light">변경</span></div>
							</div>

						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>받는분</span></div>
							<div class="col"><span>${consumer.address.address_name }</span></div>
						</div>
						
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>전화</span></div>
							<div class="col"><span>${consumer.address.address_phone }</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>주소</span></div>
							<div class="col"><span>${consumer.address.address_street_addr }</span>
								<input type="hidden" name="addrNo" value="${consumer.address.address_no }">
							</div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>상세주소</span></div>
							<div class="col">
								<span>${consumer.address.address_detail_addr }(${consumer.address.address_postcd })</span>
							</div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>배송메세지</span></div>
							<div class="col"><span>${consumer.address.address_message }</span></div>
						</div>
					</div>
				</div>
				
				<div class="row my-2 pb-2 bg-white">
					<div class="col">
						<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1">
							<div class="col fs-5 px-0"><span>주문번호</span></div>
							<div class="col text-end"></div>
						</div>

						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>${order.orderNumber}</span></div>
							<div class="col text-end"><a href="../mp/orderList" class=" border border-secondary border-opacity-50 text-decoration-none text-black px-2 py-1 bg-light">구매내역</a></div>
						</div>
					</div>
				</div>
				
				<div class="row my-2 pb-2 bg-white">
					<div class="col">
						<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1">
							<div class="col fs-5 px-0"><span>주문금액</span></div>
							<div class="col text-end"></div>
						</div>

						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>주문금액</span></div>
							<div class="col"><span class="money">${order.totalOrderPrice }원</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>상품 금액</span></div>
							<div class="col"><span class="money">${order.totalProductPrice }원</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>배송비</span></div>
							<div class="col"><span class="money">${order.totalPostPrice}원</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>적립금</span></div>
							<div class="col"><span class="money">${order.savePoint }원</span></div>
						</div>
					</div>
				</div>
				
				
				<div class="row my-2 pb-2 bg-white">
					<div class="col">
						<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1">
							<div class="col fs-5 px-0"><span>결제상세</span></div>
							<div class="col text-end"></div>
						</div>

						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>카드 간편결제</span></div>
							<div class="col"><span class="money">${order.totalOrderPrice}원</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="cols px-0 text-secondary"><span>국민 2373**-**-****** | 일시불</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-3 px-0 text-secondary"><span>승인 일시</span></div>
							<div class="col"><span>${order.order_date }</span></div>
						</div>
					</div>
				</div>
				
				
				<!-- 배송지 지우고 그때부터 시작해야됨  -->
				
				<%-- <div class="box">
					<h3>주문번호</h3>
					${order.orderNumber} <button>구매내역</button>
				</div> --%>
				
				<%-- <div class="box">
					<h3>주문금액</h3>
					주문 금액 ${order.totalOrderPrice }원<br>
					상품 금액 ${order.totalProductPrice }원<br>
					배송비 ${order.totalPostPrice}원<br>
					적립금 ${order.savePoint }원
				</div> --%>
				<!-- <div class="box">
					<h3>결제상세</h3>
					결제상세 영역...
				</div> -->
				<a href="../m/main">메인 화면으로</a>
			</div>
		</c:when>
		<c:otherwise>
			주문 정보를 찾을 수 없습니다.
		</c:otherwise>
	</c:choose>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>