<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/productDetail.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
let storeName = '${product.STORE_NAME}';
let storeImgPath = '${product.STORE_IMG}';
let productNo = '${product.PRODUCT_NO}'; 


window.addEventListener("DOMContentLoaded", function() {
	showProductInfo();
	refreshWishIcon(productNo); 
	changeMoneyUnit();
	
	
	// 특정 탭 클릭시 화면 UI 변경
	let targetClassName = 'nav-btn';
	let navBtn = document.getElementsByClassName(targetClassName);
	for(btn of navBtn) {
		btn.addEventListener('click', function(e) {
			let thisId = this.id;
			
			focusHeaderNavBtn(thisId, targetClassName);
			switch(thisId) {
				case 'pd-desc-tap' :
					showProductInfo();
					break;
				case 'pd-review-tap' :
					showReviewList();
					break;
				case 'pd-ask-btn' :
					showAskList();
					break;
				case 'store-info-tap' :
					showStoreInfo();
					break;
			}
		});
	}
	
	
	// 수량 변경 버튼 클릭이벤트
	let btns = document.getElementsByClassName('change-count-btn');
	for(btn of btns) {
		btn.addEventListener('click', function(e) {
			let pdCntSpan = document.getElementById('pdCnt');
			let id = this.id;
			let cnt = pdCntSpan.innerText;
			if(id == 'pdCntMinus') {
				changeCnt = parseInt(pdCntSpan.innerText) - 1;
				if(changeCnt < 1) {
					//this.setAttribute('disabled', disabled);
					pdCntSpan.innerText = '1';
				} else {
					pdCntSpan.innerText = changeCnt;
				}
				
			} else if(id == 'pdCntPlus') {
				changeCnt = parseInt(pdCntSpan.innerText) + 1;
				if(changeCnt > 99) {
					//this.setAttribute('disabled', disabled);
					pdCntSpan.innerText = '99';
				} else {
					pdCntSpan.innerText = changeCnt;
				}
			}
		});
	}
	
	
	
});


</script>
</head>
<body>
	<header>
		<div class="container-fluid fixed-top bg-secondary bg-opacity-25">
			<div class="row">
				<div class="col-1 text-light fs-1 px-3" onclick="history.back();"><i class="bi bi-arrow-left"></i></div>
				<div class="col-6"></div>
				<div class="col-1 px-0 mx-2 text-light text-center fs-1" onclick="location.href='../m/searchProd';"><i class="bi bi-search"></i></div>
				<div class="col-1 px-0 mx-2 text-light text-center fs-1" onclick="location.href='../m/main';"><i class="bi bi-house"></i></div>
				<div class="col-1 px-0 mx-2  text-light text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
			
			</div>
		</div>
	</header>
	
	<!-- Modal -->
	<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body" id="modal-text"></div>
	      <div class="modal-footer">
	        <button type="button" id="modalBtn1" class="btn btn-warning text-light"></button>
	        <button type="button" id="modalBtn2" class="btn btn-secondary btn-opacity-25" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col bg-secondary bg-opacity-10">
			
				<div class="row mb-2 bg-white"><!-- 상단 작품정보 -->
					<div class="col">

						<div class="row"><!-- Img Area -->
							<div class="col">
								<div class="row"><!-- 대표 이미지 -->
									<div class="col px-0">
										<img class="pd-img" id="represImg" src="/uploadFiles/${imgList[0].pi_path}">
									</div>
								</div>
								
								<div class="row my-1 px-1"><!-- 서브 이미지 -->
									<c:forEach var="i" begin="0" end="4">
										<div class="col sub-img px-1" onclick="showTargetImg(this);">
											<c:choose>
												<c:when test="${imgList[i] != null }">
													<img class="pd-img border border-2 border-secondary border-opacity-25" id="show_pd_img" src="/uploadFiles/${imgList[i].pi_path }">
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
										</div>
									</c:forEach>
								</div>
							</div>
						</div><!-- ./Ima Area -->
						
						<div class="row my-2 mx-1 store-name"><!-- 상점이름 및 리뷰버튼 -->
							<div class="col-1 px-0"><img class="img-fluid rounded-circle" src="/uploadFiles/${product.STORE_IMG }"></div>
							<div class="col-4 px-1 py-1 fw-bold store-name" onclick="location.href='../st/storeDetail?store_no=${product.STORE_NO}';" style="font-size: small;"><span>${product.STORE_NAME}></span></div>
						</div>
						<div class="row mt-3 px-1"><!-- 상품이름 -->
							<div class="col"><span class="fs-5">${product.PRODUCT_NAME }</span></div>
						</div>
						<div class="row my-2 px-1"><!-- 가격정보 -->
							<div class="col"><span class="fs-4 fw-bold money">${product.PRODUCT_PRICE }</span></div>
						</div>
					</div>	
				</div>
				
				<div class="row my-2 bg-white"><!-- 배송비/배송시작/수량 Area -->
					<div class="col">
						<div class="row my-1"><!-- 기타 -->
							<div class="col">
								<div class="row border-bottom border-secondary border-opacity-25 py-1">
									<div class="col-3"><span>배송비</span></div>
									<div class="col"><span class="money">${product.PRODUCT_POST_PRICE }</span></div>
									<div class="col-3"></div>
								</div>
								<div class="row border-bottom border-secondary border-opacity-25 py-1">
									<div class="col-3"><span>배송시작</span></div>
									<div class="col"><span>3일 이내</span></div>
									<div class="col-3"></div>
								</div>
								<div class="row py-1">
									<div class="col-3"><span>수량</span></div>
									<div class="col"><span>주문 시 제작</span></div>
									<div class="col-3"></div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- ./배송비/배송시작/수량 Area -->
				
				<div class="row my-2 bg-white"><!-- navbar / 상세 -->
					<div class="col mb-5">
						
						<div class="row my-1 fs-6"><!-- navbar -->
							<div class="col nav-btn py-2 text-warning fw-bold border-bottom border-warning border-opacity-50 border-3" id="pd-desc-tap"><span>작품정보</span></div>
							<div class="col nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="pd-review-tap"><span>구매후기</span></div>
							<div class="col nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="pd-ask-btn"><span>작품문의</span></div>
							<div class="col nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="store-info-tap"><span>작가정보</span></div>
						</div>
						
						<div class="row my-3"><!-- 상세Tap -->
							<div class="col">
								<div class="row" id="content-area-row"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<footer>
		<div class="container-fluid fixed-bottom">
			<div class="row bg-light border border-top border-secondary border-opacity-50">
			 	<div class="col">
			 	
			 		<div class="row my-1">
			 			<div class="col-2 text-danger fw-bold fs-1 mx-2" onclick="addWish('${product.PRODUCT_NO}');"><i class="bi bi-heart" id="wishIcon"></i></div>
						<div class="col-3">
							<div class="row text-center">
								<div class="col p-0"><i class="bi bi-dash-circle fs-1 text-secondary text-opacity-75 change-count-btn" id="pdCntMinus"></i></div>
								<div class="col px-0 py-1"><span class="fw-bold fs-5" id="pdCnt">1</span></div>
								<div class="col p-0"><i class="bi bi-plus-circle fs-1 text-secondary text-opacity-75 change-count-btn" id="pdCntPlus"></i></div>
							</div>
						</div>
						<div class="col d-grid ">
							<button type="button" class="btn btn-warning text-white" onclick="addCart();">
							  <i class="bi bi-cart2"></i> 장바구니
							</button>
						</div>
			 		</div>
			 	
			 	</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>