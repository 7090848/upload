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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
	
window.addEventListener("DOMContentLoaded", function() {
	changeMoneyUnit();
	
	
	 
	//   변경 버튼 클릭이벤트
	let btns = document.getElementsByClassName('change-count-btn');
	for(btn of btns) {
		btn.addEventListener('click', function(e) {
			
			
			let pdCntSpan = document.getElementById('pdCnt');
			let id = this.id;
			let cnt = pdCntSpan.innerText;
			let changeCnt;
			if(id == 'pdCntMinus') {
				changeCnt = parseInt(pdCntSpan.innerText) - 1;
				if(changeCnt < 1) {
					//this.setAttribute('disabled', disabled);
					pdCntSpan.innerText = '1';
				} else {
					pdCntSpan.innerText = changeCnt;
					cart_product_count.value = changeCnt;
				}
				
			} else if(id == 'pdCntPlus') {
				changeCnt = parseInt(pdCntSpan.innerText) + 1;
				if(changeCnt > 99) {
					//this.setAttribute('disabled', disabled);
					pdCntSpan.innerText = '99';
				} else {
					pdCntSpan.innerText = changeCnt;
					cart_product_count.value = changeCnt;
				}
			}
		});
	}
	
	
	
	
});




// 장바구니 상품 삭제
function removeOne(cart_no) {
	location.href = "./removeProductProcess?cart_no=" + cart_no;
}

// 장바구니 수량 수정
function modifyCnt(obj) {
	let cartNo = $(obj).siblings("#cart_no").val();
	let count = $(obj).val();
	location.href = "./modifyProductCntProcess?cart_no=" + cartNo + "&cart_product_count=" + count;
}	
	
	
</script>
</head>
<body>
	<div class="container-fluid bg-light">
		<div class="row pt-2 bg-white">
			<div class="col-1 px-0 mx-2 fs-1 text-center" onclick="location.href = document.referrer;"><i class="bi bi-arrow-left"></i></div>
			<div class="col px-0 mt-1 fs-5" id="searchArea"><span>장바구니</span></div>
		</div>
		
		<c:choose>
			<c:when test="${!empty consumer && fn:length(cartList) > 0}">
				<div class="row border-top border-secondary border-opacity-25" id="cartArea">
					<div class="col">
						<!--<div class="row bg-white border-bottom border-secondary border-opacity-25 py-2 px-2 text-secondary">
							 <div class="col-1"><input type="checkBox" class="form-check-input" id="selectCartAllBtn" checked></div>
							<div class="col-3"><span>전체선택</span></div>
							<div class="col"></div>
							<div class="col-2 mx-2 px-1 border border-secondary border-opacity-50 text-center"><span>선택삭제</span></div>
						</div> -->
						
						
						<c:forEach items="${order.cartList }" var="cart">
							<div class="row bg-white my-2 py-2 border-bottom border-secondary border-opacity-25" id="pdInfoBox">
								<div class="col">
								<form id="cartFrm" action="../p/consumerPay" method="get">
	
									<div class="row rounded mx-1 mb-3 py-3" onclick="location.href='../st/storeDetail?store_no=${cart.store_no}'" style="background-color: #EAEAEA;">
										<div class="col"><span>${cart.store_name}</span></div>
										<div class="col"></div>
										<div class="col-1 text-secondary">></div>
									</div>
												
									<div class="row">
										<!-- <div class="col-1 mt-4"><input type="checkbox" class="form-check-input text-warning" value="${cart.product_no }" checked></div> -->
										<div class="col mx-3">
											<div class="row my-1">
												<div class="col-3"><img class="img-fluid" src="/uploadFiles/atelier/aa.jpg"></div>
												<div class="col">
													<div class="row">
														<div class="col"><span>${cart.product_name }</span></div>
														<div class="col-3 rounded border border-danger border-opacity-25 bg-light text-center text-danger text-opacity-75 mx-3"
															id="removeBtn" onclick="removeOne('${cart.cart_no}');"><span>삭제</span></div>
													</div>
													<div class="row"><div class="col text-dark text-opacity-75"><span class="money">${cart.product_price }원</span></div></div>
													<div class="row">
														<div class="col-3 text-dark text-opacity-75"><span>수량</span></div>
														<div class="col-3"></div>
														<div class="col text-center text-warning fs-4"><i class="bi bi-dash-circle-fill change-count-btn" id="pdCntMinus"></i></div>
														<div class="col text-center"><span id="pdCnt">1</span></div>
														<div class="col text-center text-warning fs-4"><i class="bi bi-plus-circle-fill change-count-btn" id="pdCntPlus"></i></div>
													</div>
												</div>
											</div>		
											
											<div class="row py-2 border-top">
												<div class="col"><span>작품금액</span></div>
												<div class="col"></div>
												<div class="col text-end"><span class="money" id="totalPrice">${order.totalProductPrice }원</span></div>
											</div>			

											<div class="row py-2 border-top">
												<div class="col"><span>배송비</span></div>
												<div class="col"></div>
												<div class="col text-end"><span class="money">${cart.product_post_price }원</span></div>
											</div>

											<input type="hidden" name="product_no" value="${cart.product_no }">
											<input type="hidden" name="store_no" value="${cart.store_no }">
											<input type="hidden" name="product_name" value="${cart.product_name }">
											<input type="hidden" name="product_image_path" value="${cart.product_image_path }">
											<input type="hidden" name="product_price" value="${cart.product_price }">
											<input type="hidden" name="product_post_price" value="${cart.product_post_price}">
											<input type="hidden" name="cart_product_count" id="cart_product_count" value="">
										</div>
									</div>
								</form>
								</div>
							</div>
						</c:forEach>
							
							
					</div>
				</div>
				<div class="row my-5"></div>
				
				<div class="row py-2 fixed-bottom bg-light border-top border-secondary border-opacity-25 border-2 text-center">
					<div class="col">
						
						<div class="row">
							<div class="col">
								<span>작품 금액 </span><span class="fs-5 money" id="ft_total_price">${order.totalProductPrice }원</span><span> + 배송비 </span><span class="fs-5 money" id="ft_post_price">${order.totalPostPrice }원</span>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<span>총 금액 </span><span class=" fw-bold fs-5 money">${order.totalOrderPrice }원</span>
							</div>
						</div>
						<div class="row my-3 " onclick="location.href='../p/pay'">
							<div class="col"><span class="py-3 px-5 fs-5 border border-1 border-light bg-warning text-white ">작품주문</span></div>
						</div>
						
						
					</div>
					
				</div>
				
			</c:when>
			
			<c:otherwise>
				<div class="row" id="cartArea" style="height: 100vh;">
					<div class="col text-center text-secondary mt-3">
						<span>장바구니에 담긴 작품이 없습니다.</span>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>