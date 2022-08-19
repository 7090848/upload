
// 선택한 탭 UI 변경 함수
function focusHeaderNavBtn(thisId, targetClassName)	{
	let select = document.getElementById(thisId);
	let navBtns = document.getElementsByClassName(targetClassName);
	for(e of navBtns) {
		e.classList.remove('border-warning');
		e.classList.remove('border-3');
		e.classList.remove('text-warning');
		e.classList.remove('fw-bold');
		e.classList.add('border-secondary');
		e.classList.add('border-opacity-50');
		e.classList.add('text-secondary');
		e.classList.add('border-2');
	}
	select.classList.add('border-warning');
	select.classList.add('border-3');
	select.classList.add('text-warning');
	select.classList.add('fw-bold');
}


/////////////////////////////////////      ajax 렌더링     //////////////////////////////////////////////


function showProductInfo() {
	$.ajax({
		url: './getInfo?product_no=' + productNo,
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let product = obj.data;
			
			let contentAreaRow = document.getElementById('content-area-row');
			contentAreaRow.innerHTML = '';

			let contentCol = document.createElement('div');
			contentCol.classList.add('col');
			contentCol.classList.add('text-center');
			contentCol.classList.add('py-3');
			contentCol.innerText = product.PRODUCT_DESCRIPTION;
			contentAreaRow.appendChild(contentCol);
		}
		
	}).fail(function() {
		alert('알 수 없는 오류가 발생하였습니다.');
		history.back();
	});
}

	
function showReviewList() {
	$.ajax({
		url: './getReview?product_no=' + productNo,
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let reviewList = obj.data;
			let reviewCnt = reviewList.length;
			
			let contentAreaRow = document.getElementById('content-area-row');
			contentAreaRow.innerHTML = '';
			
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
					contentRow.classList.add('border-bottom');
					contentRow.classList.add('border-secondary');
					contentRow.classList.add('border-opacity-25');
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
					contentAreaRow.appendChild(reviewCol);
				}
				
			} else {
				let emptyRevCol = document.createElement('div');
				emptyRevCol.classList.add('col');
				emptyRevCol.classList.add('py-2');
				emptyRevCol.classList.add('my-1');
				emptyRevCol.classList.add('mx-2');
				emptyRevCol.classList.add('border');
				emptyRevCol.classList.add('border-warning');
				emptyRevCol.classList.add('text-warning');
				emptyRevCol.classList.add('text-center');
				//emptyRevCol.setAttribute('onClick', 'location.href="../st/storeDetail?store_no=" + "'+storeNO+'"');
				revConRow.appendChild(emptyRevCol)
				
				let emptyText = document.createElement('span');
				emptyText.innerText = '작가님의 다른 작품 구매후기 더보기';
				emptyRevCol.appendChild(emptyText);
				
				contentAreaRow.appendChild(emptyRevCol);
			}
			
		}
	}).fail(function() {
		
	})
}



function showAskList() {
	$.ajax({
		url: './getAsk?product_no=' + productNo,
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			
			let askList = obj.data;
			let askCnt = askList.length;
			
			let contentAreaRow = document.getElementById('content-area-row');
			contentAreaRow.innerHTML = '';
			
			// askCol 이걸 마지막에 넣기
			let askCol = document.createElement('div');
			askCol.classList.add('col');
			
			let titleRow = document.createElement('div');
			titleRow.classList.add('row');
			askCol.appendChild(titleRow);
			
			let titleRowCol = document.createElement('div');
			titleRowCol.classList.add('col');
			titleRowCol.classList.add('my-1');
			titleRow.appendChild(titleRowCol);
			
			let titleSpan = document.createElement('span');
			titleSpan.classList.add('fw-bold');
			titleSpan.classList.add('fs-5');
			titleSpan.innerText = '작품문의';
			titleRowCol.appendChild(titleSpan);
			
			let contentRow = document.createElement('div');
			contentRow.classList.add('row');
			contentRow.classList.add('py-1');
			contentRow.classList.add('border-top');
			contentRow.classList.add('border-secondary');
			contentRow.classList.add('border-opacity-50');
			askCol.appendChild(contentRow);
			
			if(askCnt > 0) {
				let askBoxCol = document.createElement('div');
				askBoxCol.classList.add('col');
				contentRow.appendChild(askBoxCol);
				
				for(ask of askList) {
					let askContentRow = document.createElement('div');
					askContentRow.classList.add('row');
					askContentRow.classList.add('py-2');
					askContentRow.classList.add('border-bottom');
					askContentRow.classList.add('border-secondary');
					askContentRow.classList.add('border-opacity-25');
					askBoxCol.appendChild(askContentRow);
					
					let askContentRowCol = document.createElement('div');
					askContentRowCol.classList.add('col');
					askContentRow.appendChild(askContentRowCol);
					
					let nickAndDateRow = document.createElement('div');
					nickAndDateRow.classList.add('row');
					askContentRowCol.appendChild(nickAndDateRow);
					
					let nickCol = document.createElement('div');
					nickCol.classList.add('col-3');
					nickCol.classList.add('fw-bold');
					nickAndDateRow.appendChild(nickCol);
					
					let nickSpan = document.createElement('span');
					nickSpan.innerText = ask.CONSUMER_NICKNAME;
					nickCol.appendChild(nickSpan);
					
					let askTextRow = document.createElement('div');
					askTextRow.classList.add('row');
					askTextRow.classList.add('my-1');
					askTextRow.classList.add('mx-2');
					askTextRow.classList.add('p-2');
					askTextRow.classList.add('border');
					askTextRow.classList.add('border-secondary');
					askTextRow.classList.add('border-opacity-50');
					askContentRowCol.appendChild(askTextRow);
					
					let askTextRowCol = document.createElement('div');
					askTextRowCol.classList.add('col');
					askTextRow.appendChild(askTextRowCol);
					
					let askText = document.createElement('p');
					askText.classList.add('m-0');
					askText.innerText = ask.PRODUCT_ASK_CONTENT;
					askTextRowCol.appendChild(askText);
					
					// 작가가 답변 달았을 경우 렌더링
					if(ask.PRODUCT_ASK_COMMENT_CONTENT != null) {
						let commentRow = document.createElement('div');
						commentRow.classList.add('row');
						commentRow.classList.add('mx-1');
						askContentRowCol.appendChild(commentRow);
						
						let commentRowCol = document.createElement('div');
						commentRowCol.classList.add('col');
						commentRow.appendChild(commentRowCol);
						
						let storeProfileRow = document.createElement('div');
						storeProfileRow.classList.add('row');
						storeProfileRow.classList.add('my-1');
						commentRowCol.appendChild(storeProfileRow);
						
						let storeImgCol = document.createElement('div');
						storeImgCol.classList.add('col-1');
						storeImgCol.classList.add('px-0');
						storeProfileRow.appendChild(storeImgCol);
						
						let storeImg = document.createElement('img');
						storeImg.classList.add('img-fluid');
						storeImg.classList.add('rounded-circle');
						storeImg.src = '/uploadFiles/' + storeImgPath;
						storeImgCol.appendChild(storeImg);
						
						let storeNameCol = document.createElement('div');
						storeNameCol.classList.add('col-3');
						storeNameCol.classList.add('mt-1');
						storeNameCol.classList.add('fw-bold');
						storeNameCol.classList.add('text-small');
						storeProfileRow.appendChild(storeNameCol);
						
						let storeNameSpan = document.createElement('span');
						storeNameSpan.innerText = storeName;
						storeNameCol.appendChild(storeNameSpan);
						
						let commContentRow = document.createElement('div');
						commContentRow.classList.add('row');
						commContentRow.classList.add('my-1');
						commContentRow.classList.add('p-2');
						commContentRow.classList.add('border');
						commContentRow.classList.add('border-warning');
						commContentRow.classList.add('border-opacity-50');
						commentRowCol.appendChild(commContentRow);
						
						let commContentRowCol = document.createElement('div');
						commContentRowCol.classList.add('col');
						commContentRow.appendChild(commContentRowCol);
						
						let commContentText = document.createElement('p');
						commContentText.classList.add('my-0');
						commContentText.classList.add('text-secondary');
						commContentText.innerText = ask.PRODUCT_ASK_COMMENT_CONTENT
						commContentRowCol.appendChild(commContentText);
						
						contentAreaRow.appendChild(askCol);
					}
				}
				
			} else {
				let emptyAskCol = document.createElement('div');
				emptyAskCol.classList.add('col');
				emptyAskCol.classList.add('text-warning');
				
				let emptyAskSpan = document.createElement('span');
				emptyAskSpan.innerText = '문의 내역이 없습니다';
				emptyAskCol.appendChild(emptyAskSpan);
				
				contentAreaRow.appendChild(emptyAskCol);
			}
		}
	}).fail(function() {})
}

function showStoreInfo() {
	$.ajax({
		url: './getStore?product_no=' + productNo,
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let store = obj.data;
			
			let contentAreaRow = document.getElementById('content-area-row');
			contentAreaRow.innerHTML = '';
			
			let storeCol = document.createElement('div');
			storeCol.classList.add('col');
			
			let infoRow = document.createElement('div');
			infoRow.classList.add('row');
			storeCol.appendChild(infoRow);
			
			let infoRowCol1 = document.createElement('div');
			infoRowCol1.classList.add('col-4');
			infoRowCol1.classList.add('py-2');
			infoRow.appendChild(infoRowCol1);
			
			let storeImg = document.createElement('img');
			storeImg.classList.add('img-fluid');
			storeImg.classList.add('rounded-circle');
			storeImg.src = '/uploadFiles/' + store.STORE_IMG;
			infoRowCol1.appendChild(storeImg);
			
			let infoRowCol2 = document.createElement('div');
			infoRowCol2.classList.add('col');
			infoRowCol2.classList.add('my-2');
			infoRow.appendChild(infoRowCol2);
			
			let nameAndStarRow = document.createElement('div');
			nameAndStarRow.classList.add('row');
			infoRowCol2.appendChild(nameAndStarRow);
			
			let nameAndStarRowCol = document.createElement('div');
			nameAndStarRowCol.classList.add('col');
			nameAndStarRowCol.classList.add('pt-1');
			nameAndStarRowCol.classList.add('pb-2');
			nameAndStarRow.appendChild(nameAndStarRowCol);
			
			let storeNameRow = document.createElement('div');
			storeNameRow.classList.add('row');
			nameAndStarRowCol.appendChild(storeNameRow);
			
			let storeNameRowCol = document.createElement('div');
			storeNameRowCol.classList.add('col');
			storeNameRowCol.classList.add('fw-bold');
			storeNameRowCol.classList.add('store-name');
			storeNameRowCol.setAttribute('onClick', 'location.href="../st/storeDetail?store_no=" + "'+ store.STORE_NO+'" ');
			storeNameRow.appendChild(storeNameRowCol);
			
			let storeNameSpan = document.createElement('span');
			storeNameSpan.innerText = store.STORE_NAME;
			storeNameRowCol.appendChild(storeNameSpan);
			
			let storeNameSpan2 = document.createElement('span');
			storeNameSpan2.classList.add('text-secondary');
			storeNameSpan2.classList.add('text-opacity-75');
			storeNameSpan2.innerText = ' >';
			storeNameRowCol.appendChild(storeNameSpan2);
			
			let storeStarRow = document.createElement('div');
			storeStarRow.classList.add('row');
			storeStarRow.classList.add('mt-1');
			storeStarRow.classList.add('mb-2');
			nameAndStarRowCol.appendChild(storeStarRow);
			
			let storeStarRowCol = document.createElement('div');
			storeStarRowCol.classList.add('col');
			storeStarRowCol.classList.add('text-small');
			storeStarRow.appendChild(storeStarRowCol);
			
			let starSpan = document.createElement('span');
			starSpan.innerText = store.STAR_AVG;
			storeStarRowCol.appendChild(starSpan);
			
			let storeInfoRow = document.createElement('div');
			storeInfoRow.classList.add('row');
			nameAndStarRowCol.appendChild(storeInfoRow);
			
			let storeInfoRowCol = document.createElement('div');
			storeInfoRowCol.classList.add('col');
			storeInfoRow.appendChild(storeInfoRowCol);
			
			let cntRow = document.createElement('div');
			cntRow.classList.add('row');
			cntRow.classList.add('text-secondary');
			cntRow.classList.add('text-center');
			cntRow.classList.add('text-small');
			storeInfoRowCol.appendChild(cntRow);
			
			let pdCnt = document.createElement('div');
			pdCnt.classList.add('col');
			cntRow.appendChild(pdCnt);
			
			let pdCntTextRow = document.createElement('div');
			pdCntTextRow.classList.add('row');
			pdCnt.appendChild(pdCntTextRow);
			
			let pdCntTextRowCol = document.createElement('div');
			pdCntTextRowCol.classList.add('col');
			pdCntTextRow.appendChild(pdCntTextRowCol);
			
			let pdCntTextSpan = document.createElement('span');
			pdCntTextSpan.innerText = '판매상품';
			pdCntTextRowCol.appendChild(pdCntTextSpan);
			
			let pdCntRow = document.createElement('div');
			pdCntRow.classList.add('row');
			pdCnt.appendChild(pdCntRow);
			
			let pdCntRowCol = document.createElement('div');
			pdCntRowCol.classList.add('col');
			pdCntRow.appendChild(pdCntRowCol);
			
			let pdCntValSpan = document.createElement('span');
			pdCntValSpan.innerText = store.PRODUCT_CNT;
			pdCntRowCol.appendChild(pdCntValSpan);
			
			let wishCnt = document.createElement('div');
			wishCnt.classList.add('col');
			cntRow.appendChild(wishCnt);
			
			let wishCntTextRow = document.createElement('div');
			wishCntTextRow.classList.add('row');
			wishCnt.appendChild(wishCntTextRow);
			
			let wishCntTextRowCol = document.createElement('div');
			wishCntTextRowCol.classList.add('col');
			wishCntTextRow.appendChild(wishCntTextRowCol);
			
			let wishCntTextSpan = document.createElement('span');
			wishCntTextSpan.innerText = '작품 찜';
			wishCntTextRowCol.appendChild(wishCntTextSpan);
			
			let wishCntValRow = document.createElement('div');
			wishCntValRow.classList.add('row');
			wishCnt.appendChild(wishCntValRow);
			
			let wishCntValRowCol = document.createElement('div');
			wishCntValRowCol.classList.add('col');
			wishCntValRow.appendChild(wishCntValRowCol);
			
			let wishCntValSpan = document.createElement('span');
			wishCntValSpan.innerText = store.WISH_CNT;
			wishCntValRowCol.appendChild(wishCntValSpan);
			
			let orderCnt = document.createElement('div');
			orderCnt.classList.add('col');
			cntRow.appendChild(orderCnt);
			
			let orderCntTextRow = document.createElement('div');
			orderCntTextRow.classList.add('row');
			orderCnt.appendChild(orderCntTextRow);
			
			let orderCntTextRowCol = document.createElement('div');
			orderCntTextRowCol.classList.add('col');
			orderCntTextRow.appendChild(orderCntTextRowCol);
			
			let orderCntTextSpan = document.createElement('span');
			orderCntTextSpan.innerText = '판매수';
			orderCntTextRowCol.appendChild(orderCntTextSpan);
			
			let orderCntValRow = document.createElement('div');
			orderCntValRow.classList.add('row');
			orderCnt.appendChild(orderCntValRow);
			
			let orderCntValRowCol = document.createElement('div');
			orderCntValRowCol.classList.add('col');
			orderCntValRow.appendChild(orderCntValRowCol);
			
			let orderCntValSpan = document.createElement('span');
			orderCntValSpan.innerText = store.ORDER_CNT;
			orderCntValRowCol.appendChild(orderCntValSpan);
		
			let infoRow2 = document.createElement('div');
			infoRow2.classList.add('row');
			infoRow2.classList.add('mt-3');
			infoRow2.classList.add('mx-1');
			storeCol.appendChild(infoRow2);
			
			let profileCol = document.createElement('div');
			profileCol.classList.add('col');
			infoRow2.appendChild(profileCol);
			
			let profileText = document.createElement('p');
			profileText.innerText = store.STORE_PROFILE;
			profileCol.appendChild(profileText);
			
			contentAreaRow.appendChild(storeCol);
		}
		
	}).fail(function() {})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function addWish(productNo) {
	$.ajax({
		url: '../pd/addWish?product_no=' + productNo,
		method: 'post',
		dataType: 'json',
	}).done(function(obj) {
		// console.log(obj.result);
		if(obj.result == 'success') {
			refreshWishIcon(productNo);
		} else {
			if(obj.msg == 'consumerIsNulsl') {
				alert("로그인이 필요합니다.");
				location.href='../lg/login';
			}
		}
	}).fail(function() {});
}


function refreshWishIcon(productNo){
	$.ajax({
		url: '../pd/isWish?product_no=' + productNo,
		method: 'get',
		dataType: 'json',
		
	}).done(function(obj) {
		if(obj.result == 'success') {
			wishIcon(obj.isWish);	// 아이콘 fill 변경
		}
	}).fail(function() {})
}

function addCart() {
	let count = parseInt(document.getElementById('pdCnt').innerText);	// 상품갯수
	
	const param = {
		'product_no' : productNo,
		'count' : count
	}
	
	$.ajax({
		url: './addCart',
		method: 'post',
		data: param,
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			// alert("성공");
				$("#modal-text").text('장바구니에 작품이 담겼습니다.');
				$("#modalBtn1").text('장바구니로 이동').attr('onclick', 'location.href="../cart/myCart"');
				$("#cartModal").modal("show");
				
				document.getElementById('pdCnt').innerText = '1';
				
		} else {
			if(obj.msg == 'consumerIsNull') {
				$("#modal-text").text('로그인이 필요합니다. \n로그인 하시겠습니까?');
				$("#modalBtn1").text('로그인').attr('onclick', 'location.href="../lg/login"');
				$("#cartModal").modal("show");
				
			} else {
				alert("알 수 없는 오류 발생");
			}
		}
	}).fail(function() {})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function wishIcon(type) {
/*
	let icons = document.getElementsByClassName('wishIcon');
	
	for(icon of icons) {
	
		icon.addEventListener('click', function() {
		
			if(type) {	
				icon.classList.remove('bi-heart');
				icon.classList.add('bi-heart-fill');
			} else {
				icon.classList.remove('bi-heart-fill');		
				icon.classList.add('bi-heart');		
			}
		});
	}
*/

	let icon = document.getElementById('wishIcon');
	if(type) {	
			icon.classList.remove('bi-heart');
			icon.classList.add('bi-heart-fill');
		} else {
			icon.classList.remove('bi-heart-fill');		
			icon.classList.add('bi-heart');		
		}
}	


function showTargetImg(id) {
	const selectImg = id.children[0];
	const selectImgSrc = selectImg.src;
	const repreImg = document.getElementById('represImg');
	
	repreImg.classList.remove('border-secondary');
	repreImg.classList.remove('border-opacity-25');
	repreImg.classList.add('border-warning');
	repreImg.classList.add('border-opacity-25');
	
	repreImg.src = selectImgSrc;

	const subImgs = document.getElementsByClassName('sub-img');
	for(img of subImgs) {
		//img.style.border = 'none';
		imgBox = img.children[0];
		imgBox.classList.remove('border-warning');
		imgBox.classList.remove('border-opacity-50');
		imgBox.classList.add('border-secondary');
		imgBox.classList.add('border-opacity-25');
	}
	selectImg.classList.add('border-warning');
	selectImg.classList.add('border-opacity-50');
	selectImg.classList.remove('border-opacity-25');
}	















