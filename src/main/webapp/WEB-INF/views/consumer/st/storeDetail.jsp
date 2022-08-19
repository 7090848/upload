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
<style type="text/css">
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
<title>Atelier</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/productDetail.js"></script>
<script type="text/javascript">

function printStarAvgIcon() {
	let starAvg = '${store.STAR_AVG}';
	let starAvgIconArea = document.getElementById('star_avg_icon');
	
	for(let i=0; i<starAvg; i++) {
			
		let starIcon = document.createElement('i');
		starIcon.classList.add('bi');
		starIcon.classList.add('bi-star-fill');
		starIcon.classList.add('text-warning');
		starAvgIconArea.appendChild(starIcon);
	}
	
	let starVal = document.createElement('span');
	starVal.innerText = starAvg;
	starVal.classList.add('text-secondary');
	starVal.classList.add('text-opacity-50');
	starVal.classList.add('mx-2');
	starAvgIconArea.appendChild(starVal);
	
	
}

function showProductList() {
	$.ajax({
		url: 'getProductByStoreNo?store_no=' + '${store.STORE_NO}',
		method: 'get',
		dataType: 'json'
	}).done(function(obj) {
		if(obj.result == 'success') {
			let productList = obj.data;
			
			let area = document.getElementById('tapArea');
			area.innerHTML = '';
			
			let colBox = document.createElement('div');
			colBox.classList.add('col');
			area.appendChild(colBox);
			
			let pdRow = document.createElement('div');
			pdRow.classList.add('row');
			colBox.appendChild(pdRow);
			
			for(product of productList) {
				productNo = product.PRODUCT_NO;
			
				let pdRowCol = document.createElement('div');
				pdRowCol.classList.add('col-6');
				pdRowCol.classList.add('mb-3');
				pdRow.appendChild(pdRowCol);
				
				let emptyRow = document.createElement('div');
				emptyRow.classList.add('row');
				pdRowCol.appendChild(emptyRow);
				
				let contentRow = document.createElement('div');
				contentRow.classList.add('row');
				contentRow.classList.add('px-2');
				pdRowCol.appendChild(contentRow);
				
				let contentRowCol = document.createElement('div');
				contentRowCol.classList.add('col');
				contentRowCol.classList.add('px-0');
				contentRow.appendChild(contentRowCol);
				
				let pdImgRow = document.createElement('div');
				pdImgRow.classList.add('row');
				pdImgRow.classList.add('my-1');
				//pdImgRow.setAttribute('onclick', 'location.href="../pd/productDetail?product_no=" + "'+productNo+'"');
				contentRowCol.appendChild(pdImgRow);
				
				let pdImgRowCol = document.createElement('div');
				pdImgRowCol.classList.add('col');
				pdImgRowCol.classList.add('position-relative');
				pdImgRowCol.classList.add('fs-3');
				pdImgRowCol.setAttribute('id', 'pdImgArea');
				pdImgRow.appendChild(pdImgRowCol);
				
				let pdImgBox = document.createElement('img');
				pdImgBox.classList.add('pd-img');
				pdImgBox.setAttribute('src', '/uploadFiles/' + product.PI_PATH);
				pdImgBox.setAttribute('onclick', 'location.href="../pd/productDetail?product_no=" + "'+productNo+'"');
				pdImgRowCol.appendChild(pdImgBox);
				
				let pdLikeBtn = document.createElement('span');
				pdLikeBtn.classList.add('badge');
				pdLikeBtn.setAttribute('id', 'likeBtn');
				pdLikeBtn.setAttribute('onclick', 'addWish("'+productNo+'");');
				pdImgRowCol.appendChild(pdLikeBtn);
				
				let pdLikeBtnIcon = document.createElement('i');
				pdLikeBtnIcon.classList.add('bi');
				pdLikeBtnIcon.classList.add('wishIcon');
				pdLikeBtnIcon.classList.add('text-danger');
				pdLikeBtnIcon.classList.add('fw-bold');
				pdLikeBtnIcon.classList.add('fs-1');
				
				if(product.isWish) {
					pdLikeBtnIcon.classList.add('bi-heart-fill');
				} else {
					pdLikeBtnIcon.classList.add('bi-heart');
				}
				
				pdLikeBtn.appendChild(pdLikeBtnIcon);
				
				let storeNameRow = document.createElement('div');
				storeNameRow.classList.add('row');
				storeNameRow.classList.add('mt-1');
				storeNameRow.setAttribute('onclick', 'location.href="../st/storeDetail?store_no=" + "'+product.STORE_NO+'"');
				pdRowCol.appendChild(storeNameRow);
				
				let storeNameRowCol = document.createElement('div');
				storeNameRowCol.classList.add('col');
				storeNameRowCol.classList.add('mx-1');
				storeNameRow.appendChild(storeNameRowCol);
				
				let storeNameSpan = document.createElement('span');
				storeNameSpan.classList.add('text-small');
				storeNameSpan.classList.add('sub-grey');
				storeNameSpan.innerText = product.STORE_NAME;
				storeNameRowCol.appendChild(storeNameSpan);
				
				let pdNameRow = document.createElement('div');
				pdNameRow.classList.add('row');
				pdNameRow.setAttribute('onclick', 'location.href="../pd/productDetail?product_no=" + "'+productNo+'"');
				pdRowCol.appendChild(pdNameRow);
				
				let pdNameRowCol = document.createElement('div');
				pdNameRowCol.classList.add('col');
				pdNameRowCol.classList.add('mx-1');
				pdNameRow.appendChild(pdNameRowCol);
				
				let pdNameSpan = document.createElement('span');
				pdNameSpan.innerText = product.PRODUCT_NAME;
				pdNameRowCol.appendChild(pdNameSpan);
				
				let reviewRow = document.createElement('div');
				reviewRow.classList.add('row');
				reviewRow.classList.add('mt-1');
				pdRowCol.appendChild(reviewRow);
				
				let starIconCol = document.createElement('div');
				starIconCol.classList.add('col-1');
				starIconCol.classList.add('mx-1');
				starIconCol.classList.add('text-warning');
				starIconCol.classList.add('text-small');
				reviewRow.appendChild(starIconCol);
				
				let starIcon = document.createElement('i');
				starIcon.classList.add('bi');
				starIcon.classList.add('bi-star-fill');
				starIconCol.appendChild(starIcon);
				
				let starAvgCol = document.createElement('div');
				starAvgCol.classList.add('col');
				starAvgCol.classList.add('px-0');
				starAvgCol.classList.add('text-small');
				reviewRow.appendChild(starAvgCol);
				
				let starAvgSpan = document.createElement('span');
				starAvgSpan.classList.add('fw-bold');
				
				let starAvg = product.STAR_AVG;
				if(starAvg == undefined || starAvg == null) {
					starAvg = 0;
				}
				
				starAvgSpan.innerText = starAvg;
				starAvgCol.appendChild(starAvgSpan);
				
				let reviewCountSpan = document.createElement('span');
				reviewCountSpan.classList.add('sub-grey');
				reviewCountSpan.innerText = " (" + product.REVIEW_COUNT + ")";
				starAvgCol.appendChild(reviewCountSpan);
				
				let emptyCol = document.createElement('div');
				emptyCol.classList.add('col');
				reviewRow.appendChild(emptyCol);
			}
			
		}
		
	})
	
	
	
}

function showReviewList() {
	$.ajax({
		url: 'getReviewByStoreNo?store_no=' + '${store.STORE_NO}',
		method: 'get',
		dataType: 'json',
		
	}).done(function(obj) {
		if(obj.result == 'success') {
			let reviewList = obj.data;
			let reviewCnt = reviewList.length;
			
			let area = document.getElementById('tapArea');
			area.innerHTML = '';
			
			let reviewCol = document.createElement('div');
			reviewCol.classList.add('col');
			
			let titleRow = document.createElement('div');
			titleRow.classList.add('row');
			reviewCol.appendChild(titleRow);
			
			let titleRowCol = document.createElement('div');
			titleRowCol.classList.add('col');
			titleRow.appendChild(titleRowCol);
			
			let titleAreaRow = document.createElement('div');
			titleAreaRow.classList.add('row');
			titleAreaRow.classList.add('my-1');
			titleRowCol.appendChild(titleAreaRow);
			
			let titleAreaRowCol = document.createElement('div');
			titleAreaRowCol.classList.add('col');
			titleAreaRow.appendChild(titleAreaRowCol);
			
			let titleSpan = document.createElement('span');
			titleSpan.classList.add('fw-bold');
			titleSpan.classList.add('fs-5');
			titleSpan.classList.add('pb-2');
			titleSpan.innerText = '구매후기 (' + reviewCnt + ")";
			titleAreaRowCol.appendChild(titleSpan);
			
			let revConRow = document.createElement('div');
			revConRow.classList.add('row');
			revConRow.classList.add('py-1');
			revConRow.classList.add('border-top');
			revConRow.classList.add('border-secondary');
			revConRow.classList.add('border-opacity-50');
			titleRowCol.appendChild(revConRow);
			
			if(reviewCnt > 0) {
				let revConRowCol = document.createElement('div');
				revConRowCol.classList.add('col');
				revConRow.appendChild(revConRowCol);
				
				for(review of reviewList) {
					
					// 후기 작성자 정보 Row
					let writerRow = document.createElement('div');
					writerRow.classList.add('row');
					writerRow.classList.add('my-2');
					writerRow.classList.add('pb-3');
					writerRow.classList.add('border-bottom');
					writerRow.classList.add('border-secondary');
					writerRow.classList.add('border-opacity-25');
					revConRowCol.appendChild(writerRow);
					
					let writerRowCol = document.createElement('div');
					writerRowCol.classList.add('col');
					writerRow.appendChild(writerRowCol);
					
					let nickRow = document.createElement('div');
					nickRow.classList.add('row');
					writerRowCol.appendChild(nickRow);
					
					let nickRowCol = document.createElement('div');
					nickRowCol.classList.add('col');
					nickRowCol.classList.add('fw-bold');
					nickRow.appendChild(nickRowCol);
					
					let nickSpan = document.createElement('span');
					nickSpan.innerText = review.CONSUMER_NICKNAME;
					nickRowCol.appendChild(nickSpan);
					
					let starAndDateRow = document.createElement('div');
					starAndDateRow.classList.add('row');
					writerRowCol.appendChild(starAndDateRow);
					
					let starCol = document.createElement('div');
					starCol.classList.add('col-4');
					starAndDateRow.appendChild(starCol);

					// 별점 아이콘					
					let starFillCnt = review.REVIEW_STAR;
					let starEmptyCnt = 5 - parseInt(starFillCnt);
					
					for(let i=0; i<starFillCnt; i++) {
						let starIcon = document.createElement('i');
						starIcon.classList.add('bi');
						starIcon.classList.add('bi-star-fill');
						starIcon.classList.add('text-warning');
						starCol.appendChild(starIcon);
					}
					
					if(starEmptyCnt > 0) {
						for(let i=0; i<starEmptyCnt; i++) {
							let starIcon = document.createElement('i');
							starIcon.classList.add('bi');
							starIcon.classList.add('bi-star');
							starIcon.classList.add('text-warning');
							starCol.appendChild(starIcon);
						}
					}
					
					let writeDateCol = document.createElement('div');
					writeDateCol.classList.add('col-5');
					writeDateCol.classList.add('text-secondary');
					writeDateCol.classList.add('text-small');
					starAndDateRow.appendChild(writeDateCol);
					
					let writeDateSpan = document.createElement('span');
					writeDateSpan.innerText = formatDate(review.REVIEW_WRITEDATE);
					writeDateCol.appendChild(writeDateSpan);
					
					let etcCol = document.createElement('div');	// 크기 맞추기용 빈 col
					etcCol.classList.add('col');
					starAndDateRow.appendChild(etcCol);
					
					// 후기 이미지 / 내용 Row
					let contentRow = document.createElement('div');
					contentRow.classList.add('row');
					writerRowCol.appendChild(contentRow);
					
					let contentRowCol = document.createElement('div');
					contentRowCol.classList.add('col');
					contentRowCol.classList.add('my-2');
					contentRow.appendChild(contentRowCol);
					
					if(review.REVIEW_IMG_PATH != null) {
						let imgRow = document.createElement('div');
						imgRow.classList.add('row');
						imgRow.classList.add('my-1');
						contentRowCol.appendChild(imgRow);

						let imgRowCol1 = document.createElement('div');
						imgRowCol1.classList.add('col-5');
						imgRow.appendChild(imgRowCol1);
						
						let imgBox = document.createElement('img');
						imgBox.classList.add('img-fluid');
						imgBox.src = '/uploadFiles/' + review.REVIEW_IMG_PATH;
						imgRowCol1.appendChild(imgBox);
						
						let imgRowCol2 = document.createElement('div');
						imgRowCol2.classList.add('col-7');
						imgRow.appendChild(imgRowCol2);
						
						let contentText = document.createElement('p');
						contentText.innerText = review.REVIEW_CONTENT;
						imgRowCol2.appendChild(contentText);
					} else {
						let conRow = document.createElement('div');
						conRow.classList.add('row');
						contentRowCol.appendChild(conRow);
						
						let conRowCol = document.createElement('div');
						conRowCol.classList.add('col');
						conRow.appendChild(conRowCol);
						
						let contentText = document.createElement('p');
						contentText.innerText = review.REVIEW_CONTENT;
						conRowCol.appendChild(contentText);
					}
					
					// 구매제품 정보				
					let pdInfoRow = document.createElement('div');
					pdInfoRow.classList.add('row');
					pdInfoRow.classList.add('bg-secondary');
					pdInfoRow.classList.add('bg-opacity-25');
					pdInfoRow.classList.add('mx-2');
					pdInfoRow.classList.add('py-2');
					writerRowCol.appendChild(pdInfoRow);
					
					// 이미지
					let pdImgCol = document.createElement('div');
					pdImgCol.classList.add('col-3');
					pdInfoRow.appendChild(pdImgCol);
					
					let pdImg = document.createElement('img');
					pdImg.classList.add('img-fluid');
					pdImg.setAttribute('src', '/uploadFiles/' + review.PI_PATH);
					pdImgCol.appendChild(pdImg);
					
					// 부가정보
					let pdInfoCol = document.createElement('div');
					pdInfoCol.classList.add('col');
					pdInfoRow.appendChild(pdInfoCol);
					
					let stNameRow = document.createElement('div');
					stNameRow.classList.add('row');
					stNameRow.classList.add('text-secondary');
					stNameRow.classList.add('text-small');
					pdInfoCol.appendChild(stNameRow);
					
					let stNameRowCol = document.createElement('div');
					stNameRowCol.classList.add('col');
					stNameRow.appendChild(stNameRowCol);
					
					let stNameSpan = document.createElement('span');
					stNameSpan.innerText = review.STORE_NAME;
					stNameRowCol.appendChild(stNameSpan);
					
					
					let pdNameRow = document.createElement('div');
					pdNameRow.classList.add('row');
					pdInfoCol.appendChild(pdNameRow);
					
					let pdNameRowCol = document.createElement('div');
					pdNameRowCol.classList.add('col');
					pdNameRow.appendChild(pdNameRowCol);
					
					let pdNameSpan = document.createElement('span');
					pdNameSpan.innerText = review.PRODUCT_NAME;
					pdNameRowCol.appendChild(pdNameSpan);
					
					
					let pdPriceRow = document.createElement('div');
					pdPriceRow.classList.add('row');
					pdInfoCol.appendChild(pdPriceRow);
					
					let pdPriceRowCol = document.createElement('div');
					pdPriceRowCol.classList.add('col');
					pdPriceRow.appendChild(pdPriceRowCol);
					
					let pdPriceSpan = document.createElement('span');
					pdPriceSpan.classList.add('money');
					pdPriceSpan.innerText = review.PRODUCT_PRICE + '원';
					pdPriceRowCol.appendChild(pdPriceSpan);
					
					area.appendChild(reviewCol);
				}
				
			} else {
				let emptyRevCol = document.createElement('div');
				emptyRevCol.classList.add('col');
				emptyRevCol.classList.add('py-2');
				emptyRevCol.classList.add('my-1');
				emptyRevCol.classList.add('mx-2');
				emptyRevCol.classList.add('text-secondary');
				emptyRevCol.classList.add('text-center');
				//emptyRevCol.setAttribute('onClick', 'location.href="../"');
				revConRow.appendChild(emptyRevCol)
				
				let emptyText = document.createElement('span');
				emptyText.innerText = '작가님의 구매후기가 없습니다.';
				emptyRevCol.appendChild(emptyText);
				
				area.appendChild(emptyRevCol);
			}
			
		}
		
	}).fail(function() {})
}

function showProfile() {
	let area = document.getElementById('tapArea');
	area.innerHTML = '';
	
	let profileCol = document.createElement('div');
	profileCol.classList.add('col');
	profileCol.classList.add('py-5');
	profileCol.classList.add('text-secondary');
	profileCol.classList.add('text-opacity-50');
	profileCol.classList.add('text-center');
	
	let storeProfile = '${store.STORE_PROFILE}';
	if(storeProfile != null && storeProfile != undefined) {
		let profileP = document.createElement('p');
		profileP.classList.add('text-opacity-100');
		profileP.innerText = storeProfile;
		profileCol.appendChild(profileP);
	} else {
		let emptyText = document.createElement('span');
		emptyText.innerText = '작가님의 프로필이 없습니다.';
		profileCol.appendChild(emptyText);
	}
	
	area.appendChild(profileCol);
	
	
}


window.addEventListener("DOMContentLoaded", function() {
	printStarAvgIcon();	
	changeMoneyUnit();
	showProductList();
	
	
	
	let targetClassName = 'store-nav-btn';
	let navBar = document.getElementsByClassName(targetClassName);
	
	for(btn of navBar) {
		
		btn.addEventListener('click', function() {
		let thisId = this.id;
		
		focusHeaderNavBtn(thisId, targetClassName);
		switch(thisId) {
			case 'pd-tap' :
				showProductList();
				break;
			case 'review-tap' :
				showReviewList();
				break;
			case 'profile-tap' :
				showProfile();
				break;
		}
		
		
			
		});
	}
	
	
});


</script>
</head>
<body>
	 
	<div class="container-fluid bg-secondary bg-opacity-10">
	
		<!-- header -->
		<div class="row pt-1">
			<div class="col-1 text-light fs-1 px-3" onclick="history.back();"><i class="bi bi-arrow-left"></i></div>
			<div class="col-6"></div>
			<div class="col-1 px-0 mx-2 text-light text-center fs-1" onclick="location.href='../m/searchProd';"><i class="bi bi-search"></i></div>
			<div class="col-1 px-0 mx-2 text-light text-center fs-1" onclick="location.href='../m/main';"><i class="bi bi-house"></i></div>
			<div class="col-1 px-0 mx-2  text-light text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
		
		</div>
	
		<div class="row bg-white mb-2" id="content-area-row">
			<div class="col">
				<div class="row">
					<div class="col-3 py-2"><img class="img-fluid rounded-circle" src="/uploadFiles/${store.STORE_IMG }"></div>
					<div class="col my-2">
						<div class="row">
						
							<div class="col pt-1 pb-2">
								<div class="row">
									<div class="col fw-bold store-name"><span>${store.STORE_NAME }</span></div>
								</div>
								
								<div class="row mt-1 mb-2">
									<div class="col text-warning" id="star_avg_icon"></div>
									<div class="col-7"></div>
								</div>
								
								<div class="row py-1">
									<div class="col px-0">
										<div class="row text-secondary text-center text-small">
											<div class="col">
												<div class="row text-opacity-75"><div class="col"><span>판매상품</span></div></div>
												<div class="row fs-6 fw-bold"><div class="col"><span>${store.PRODUCT_CNT}</span></div></div>
											</div>
											<div class="col">
												<div class="row text-opacity-75"><div class="col"><span>작품 찜</span></div></div>
												<div class="row fs-6 fw-bold"><div class="col"><span>${store.WISH_CNT}</span></div></div>
											</div>
											<div class="col">
												<div class="row text-opacity-75"><div class="col"><span>판매 수</span></div></div>
												<div class="row fs-6 fw-bold"><div class="col"><span>${store.ORDER_CNT}</span></div></div>
											</div>
										</div>
									</div>	
								</div>
								
							</div>
						
						</div>
					</div>
				
				</div>
			</div>
		</div>
		
		<div class="row my-2 bg-white">
			<div class="col">
				
				<div class="row my-2"><!-- navbar / 상세 -->
					<div class="col">
						<div class="row my-1 fs-6 text-center"><!-- navbar -->
							<div class="col store-nav-btn py-2 text-warning fw-bold border-bottom border-warning border-opacity-50 border-3" id="pd-tap"><span>판매작품</span></div>
							<div class="col store-nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="review-tap"><span>구매후기</span></div>
							<div class="col store-nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="profile-tap"><span>프로필</span></div>
						</div>
						
						<div class="row my-3 bg-white" id="tapArea"><!-- 상세Tap -->
							
						</div>
						
					</div>
				</div>
				
				
			
			</div>
		</div>
		
	
	</div>
			 	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>