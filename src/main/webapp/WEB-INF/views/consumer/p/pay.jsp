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

</style>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	let totalPrice = '${order.totalOrderPrice}';
	window.addEventListener("DOMContentLoaded", function() {
		document.getElementById('totalPrice').value = totalPrice;
		document.getElementById('totalPrice2').innerText = totalPrice;		
		
	});

	
	// 배송지 변경
	function updateAddr(){
		
	}
	
	// 포인트 사용
	function usePoint() {
		let myPoint = document.getElementById('mypoint');
		let usePoint = document.getElementById('use_point');
		let discountPrice = document.getElementById('discountPrice');

		if(usePoint.value > myPoint.value) {
			alert("보유한 포인트보다 많습니다.");
			usePoint.value = '';
			usePoint.focus();
		} else {
			
			let totalPrice = document.getElementById('totalPrice');
			let totalPrice2 = document.getElementById('totalPrice2');
			totalPrice = totalPrice.value - usePoint.value;
			
			document.getElementById('totalPrice').value = totalPrice;
			document.getElementById('totalPrice2').innerHTML = totalPrice;
			myPoint.value = myPoint.value - usePoint.value;
			discountPrice.value = parseInt(discountPrice.value) + parseInt(usePoint.value);
		}
	}
	
	// 쿠폰 적용
	function myCoupon() {
		// 내 쿠폰보기 창 이동
	}
	
	function frmSubmit() {
		
		/*
		console.log($("#productPrice").val());
		console.log($("#postPrice").val());
		console.log($("#discountPrice").val());
		console.log($("#totalPrice").val());
		console.log($("#savePoint").val());
		*/
		
		//$("input[name='postPrice']").val($("#postPrice").val());
		$("input[name='discountPrice']").val($("#discountPrice").text());
		$("input[name='totalPrice']").val($("#totalPrice").text());
		
		/*
		console.log("productPrice : " + $("input[name='productPrice']").val());
		console.log("postPrice : " + $("input[name='postPrice']").val());
		console.log("discountPrice : " + $("input[name='discountPrice']").val());
		console.log("totalPrice : " + $("input[name='totalPrice']").val());
		*/
		
		$("#payFrm").submit();
		
	}

	window.addEventListener("DOMContentLoaded", function() {
		changeMoneyUnit();
		
	})
	


</script>
</head>
<body>
	<div class="container-fluid bg-secondary bg-opacity-25">
	
		<div class="row pt-2 bg-white">
			<div class="col-1 px-0 mx-2 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
			<div class="col px-0 mt-1 fs-5" id="searchArea"><span>주문결제</span></div>
		</div>
	 
		<div class="row border-top border-secondary border-opacity-25" id="payArea">
			<div class="col">
			
			<form action="../p/payProcess" method="post" id="payFrm">
				<div class="row mb-2 pb-2 bg-white">
					<div class="col">
						
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1"><div class="col fs-5 px-0"><span>주문고객</span></div></div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-2 text-secondary px-0"><span>이름</span></div>
							<div class="col"><span>${consumer.consumer_name }</span></div>
						</div>
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1">
							<div class="col-2 text-secondary px-0"><span>연락처</span></div>
							<div class="col"><span>${consumer.consumer_phone }</span></div>
						</div>
						<div class="row">
							<div class="col text-secondary text-opacity-50 text-small"><span>주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</span></div>
						</div>
					</div>
				</div>
				
				<div class="row my-2 bg-light">
					<div class="col">
						<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1"><div class="col fs-5 px-0"><span>주문작품 정보</span></div></div>
						
						<c:forEach items="${order.cartList }" var="cart">
							<div class="row bg-white mb-2">
								<div class="col">
									
									<div class="row mx-1 mb-3 mt-2 py-2" style="background-color: #EAEAEA;">
										<div class="col"><span>${cart.store_name}</span></div>
										<div class="col"></div>
									</div>
									<div class="row px-1 my-3">
										<div class="col-2"><img class="img-fluid" src="/uploadFiles/atelier/aa.jpg"></div>
										<div class="col">
											<div class="row">
												<div class="col"><span>${cart.product_name }</span></div>
											</div>
											<div class="row">
												<div class="col"><span class="text-small text-secondary text-opacity-50">주문시 제작</span></div>
											</div>
										</div>
									</div>
										<div class="row px-1 mx-1">
											<div class="col-3 px-0 text-secondary"><span>작품금액</span></div>
											<div class="col text-end">
												<span class="money">${cart.product_price }</span>
											</div>
										</div>
										<div class="row px-1 mx-1 border-bottom border-secondary border-opacity-25 py-1">
											<div class="col-3 px-0 text-secondary"><span>수량</span></div>
											<div class="col text-end">
												<span>${cart.cart_product_count }개</span>
											</div>
										</div>
										<div class="row px-1 mx-1 my-2">
										<div class="col-3 px-0 text-secondary"><span>배송비</span></div>
										<div class="col"></div>
										<div class="col text-secondary text-end">
											<span class="money">
											<c:choose>
												<c:when test="${cart.product_post_price > 0 }">
													${cart.product_post_price }원
												</c:when>
												<c:otherwise>
													무료배송
												</c:otherwise>
											</c:choose>
											</span>
										
										</div>
									</div>
								
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="row my-2 bg-white">
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
							<div class="col">
								<span>
								${consumer.address.address_postcd }<br>
								${consumer.address.address_street_addr }&nbsp;${consumer.address.address_detail_addr }
								&nbsp;${consumer.address.address_message }
								</span>
								<input type="hidden" name="addrNo" value="${consumer.address.address_no }">
							</div>
						</div>
					
					</div>
				</div>
				
				<div class="row my-2 bg-white py-2">
					<div class="col">
					
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1"><div class="col fs-5 px-0"><span>할인 및 포인트</span></div></div>
						
						<div class="row mx-1 fw-bold"><div class="col"><span>쿠폰</span></div></div>
						<div class="row mb-3 mx-1">
							<div class="col text-secondary"><span>상품쿠폰</span></div>
							<div class="col text-end"><span class="money" id="use_coupon">0</span></div>
							<div class="col-3 border border-warning border-opacity-75 text-center text-warning" onclick="myCoupon();"><span>쿠폰적용</span></div>
							<input type="hidden" name="use_coupon" id="use_coupon" value="0">
						</div>
						

						<div class="row mx-1 fw-bold"><div class="col"><span>포인트</span></div></div>
						<div class="row mx-1">
							<div class="col text-secondary"><span>보유 포인트</span></div>
							<div class="col text-end"><span id="mypoint" class="money">${consumer.consumer_totalpoint }</span></div>
							<input type="hidden" name="use_point" id="use_point" value="0">
						</div>
						<div class="row mx-1">
							<div class="col"><span class="money" id="use_point">0</span></div>
							<div class="col"></div>
							<div class="col-3 border border-warning border-opacity-75 text-center text-warning" onclick="usePoint();"><span>사용</span></div>
						</div>

					</div>
				</div>
				
				<div class="row my-2 bg-white ">
					<div class="col">
					
						<div class="row border-bottom border-secondary border-opacity-25 py-2 mx-1 my-1"><div class="col fs-5 px-0"><span>결제수단</span></div></div>
						<div class="row mx-1 py-2"><div class="col"><input type="radio" name="payType" value="kakaopay"><span class="mx-1">카카오페이</span></div></div>
						<div class="row mx-1 pb-3"><div class="col"><input type="radio" name="payType" value="bankDeposit"><span class="mx-1">무통장입금</span></div></div>
					
					
						<div class="row mx-1 fw-bold"><div class="co text-secondaryl"><span>결제정보</span></div></div>
						<div class="row mx-1">
							<div class="col text-secondary"><span>작품금액</span></div>
							<div class="col text-end"><span class="money" id="productPrice">${order.totalProductPrice}</span></div>
						</div>
						<div class="row mx-1">
							<div class="col text-secondary"><span>배송비</span></div>
							<div class="col text-end"><span id="postPrice" class="money">${order.totalPostPrice }</span></div>
						</div>
						<div class="row mx-1">
							<div class="col text-secondary"><span>할인금액</span></div>
							<div class="col text-end"><span id="discountPrice" class="">0</span></div>
						</div>
						<div class="row mx-1">
							<div class="col text-secondary"><span>최종 결제 금액</span></div>
							<div class="col text-end"><span id="totalPrice" class="">0</span></div>
						</div>
						<div class="row mx-1">
							<div class="col"><span>결제 시 개인정보 제공에 동의합니다.</span></div>
							<div class="col"><input type="checkbox" class=""></div>
						</div>
					</div>
				</div>
				
				<div class="row my-5"></div>
				<input type="hidden" name="productPrice" value="${order.totalProductPrice}">
				<input type="hidden" name="postPrice" value="${order.totalPostPrice }">
				<input type="hidden" name="discountPrice">
				<input type="hidden" name="totalPrice">
				<input type="hidden" name="savePoint" value="${order.savePoint }">
				
				<div class="row fixed-bottom text-center text-light py-1 mx-2 my-2 rounded" style="background-color: #ffc107;" id="submitBtn" onclick="frmSubmit();">
					<div class="col">
						<div class="row"><div class="col fs-5"><span><span class="money" id="totalPrice2">${order.totalOrderPrice }</span> 결제하기</span></div></div>
						<div class="row"><div class="col"><span>예상적립금 : <span class="money">${order.savePoint }</span></span></div></div>
					</div>
				
				</div>
				
				</form>
			</div>
		</div>
		
	</div>
					
					
					
					
					<!-- 
			<c:choose>
				<c:when test="${empty order.cartList || fn:length(cartList) == 0}">
					<div class="col text-center">
						<span>주문할 상품이 존재하지 않습니다.<br> 다시 진행해 주세요.</span>
					</div>
				</c:when>
				
				<c:otherwise>
				
					<div class="col">
							
							<div class="row"><div class="col"><span>주문고객</span></div></div>
							<div class="row">
								<div class="col-3"><span>이름</span></div>
								<div class="col"><span>${consumer.consumer_name }</span></div>
							</div>
							<div class="row">
								<div class="col-3"><span>연락처</span></div>
								<div class="col"><span>${consumer.consumer_phone }</span></div>
							</div>
						
						</div>
					</div>
				
				
			
				</c:otherwise>
			</c:choose>
 			-->		




<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>