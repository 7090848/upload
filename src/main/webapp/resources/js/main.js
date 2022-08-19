//최근검색어 개별 삭제
function removeOneSearchLog(searchNo) {
	$.ajax({
		url: './removeOneMySearchLog?product_search_no=' + searchNo,
		method: 'post',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			showSearchTap();
			
		} else {
			console.log('오류 발생');
		}
	}).fail(function(){});
}

//최근검색어 전체 삭제
function removeAllSearchLog() {
	$.ajax({
		url: './removeAllMySearchLog',
		method: 'post',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			showSearchTap();
		}
	})
}


// 검색어 검색
function submitSearch() {
	let frm = document.getElementById('searchFrm');
	frm.submit();
}

// 검색 탭 클릭 시
function showSearchTap() {
	
	let body = document.querySelector('body');	// 바디에 넣기 마지막에
	let header = document.getElementById('header');
	header.innerHTML = '';
	
	document.getElementById('container').innerHTML = '';
	
	let containerBox = document.getElementById('container');
	containerBox.innerHTML = '';
	
	let searchFrm = document.createElement('form');
	searchFrm.setAttribute('action', './prodSearchProcess');
	searchFrm.setAttribute('method', 'post');
	searchFrm.setAttribute('id', 'searchFrm');
	containerBox.appendChild(searchFrm);
	
	let searchBox = document.createElement('div');
	searchBox.classList.add('row');
	searchBox.classList.add('py-2');
	searchFrm.appendChild(searchBox);
	
	let backBtnCol = document.createElement('div');
	backBtnCol.classList.add('col-1');
	backBtnCol.classList.add('px-0');
	backBtnCol.classList.add('mx-2');
	backBtnCol.classList.add('fs-1');
	backBtnCol.classList.add('text-center');
	backBtnCol.setAttribute('onclick', 'location.href = document.referrer');
	searchBox.appendChild(backBtnCol);
	
	let backIcon = document.createElement('i');
	backIcon.classList.add('bi');
	backIcon.classList.add('bi-arrow-left');
	backBtnCol.appendChild(backIcon);
	
	let searchInputCol = document.createElement('div');
	searchInputCol.classList.add('col');
	searchInputCol.classList.add('input-group');
	searchInputCol.classList.add('input-group-sm');
	searchInputCol.classList.add('px-0');
	searchInputCol.setAttribute('id', 'searchArea');
	searchBox.appendChild(searchInputCol);
	
	let searchInputBox = document.createElement('input');
	searchInputBox.setAttribute('type', 'text');
	searchInputBox.setAttribute('class', 'form-control');
	searchInputBox.setAttribute('id', 'search');
	searchInputBox.setAttribute('name', 'searchWord');
	searchInputBox.setAttribute('placeholder', '검색어를 입력해주세요');
	searchInputCol.appendChild(searchInputBox);
	
	let searchBtnCol = document.createElement('div');
	searchBtnCol.classList.add('col-1');
	searchBtnCol.classList.add('px-0');
	searchBtnCol.classList.add('mx-2');
	searchBtnCol.classList.add('text-secondary');
	searchBtnCol.classList.add('text-center');
	searchBtnCol.classList.add('fs-1');
	searchBtnCol.setAttribute('id', 'searchBtn');
	searchBtnCol.setAttribute('onclick', 'submitSearch();');
	searchBox.appendChild(searchBtnCol);
	
	let searchIcon = document.createElement('i');
	searchIcon.classList.add('bi');
	searchIcon.classList.add('bi-search');
	searchBtnCol.appendChild(searchIcon);
	
	/////////////////////////// 여기까지 form 내부 내용
	
	let recentLogBox = document.createElement('div');
	recentLogBox.classList.add('row');
	recentLogBox.classList.add('mb-2');
	recentLogBox.classList.add('border-top');
	recentLogBox.classList.add('border-secondary-light');
	recentLogBox.setAttribute('id', 'recentSearchLogBox');
	containerBox.appendChild(recentLogBox);
	
	let recentLogCol = document.createElement('div');
	recentLogCol.classList.add('col');
	recentLogBox.appendChild(recentLogCol);
	
	let recentLogTitleRow = document.createElement('div');
	recentLogTitleRow.classList.add('row');
	recentLogTitleRow.classList.add('my-3');
	recentLogTitleRow.setAttribute('id', 'recentTitleArea');
	recentLogCol.appendChild(recentLogTitleRow);
	
	let recentLogTitleRowCol = document.createElement('div');
	recentLogTitleRowCol.classList.add('col');
	recentLogTitleRowCol.classList.add('fw-bold');
	recentLogTitleRow.appendChild(recentLogTitleRowCol);
	
	let recentLogTitleSpan = document.createElement('span');
	recentLogTitleSpan.innerText = '최근 검색어';
	recentLogTitleRowCol.appendChild(recentLogTitleSpan);
	
	let recentContentArea = document.createElement('div');
	recentContentArea.classList.add('row');
	recentContentArea.setAttribute('id', 'recentContentArea');
	recentLogCol.appendChild(recentContentArea);
	recentContentArea.innerHTML = '';
	
	$.ajax({
		url: './getRecentSearchLog',
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let logList = obj.data;
			if(logList != null && logList.length > 0) {
				let removeAllCol = document.createElement('div');
				removeAllCol.classList.add('col-3');
				removeAllCol.classList.add('pt-1');
				removeAllCol.classList.add('text-small');
				removeAllCol.classList.add('text-secondary');
				removeAllCol.setAttribute('onclick', 'removeAllSearchLog();');
				removeAllCol.setAttribute('id', 'recentTitleCol');
				
				let recentTitleCol = document.getElementById('recentTitleCol');
				if(recentTitleCol == undefined || recentTitleCol == null) {
					let recentTitleArea = document.getElementById('recentTitleArea');
					let removeAllSpan = document.createElement('span');
					removeAllSpan.innerText = '전체삭제';
					removeAllCol.appendChild(removeAllSpan);
					
					recentTitleArea.appendChild(removeAllCol);
				}
				
				let myRecentLogRow = document.createElement('div');
				myRecentLogRow.classList.add('row');
				myRecentLogRow.classList.add('px-4');
				
				let myRecentLogRowCol = document.createElement('div');
				myRecentLogRowCol.classList.add('col');
				myRecentLogRow.appendChild(myRecentLogRowCol);
				
				let logRow = document.createElement('div');
				logRow.classList.add('row');
				myRecentLogRowCol.appendChild(logRow);
				
				for(log of logList) {
					
					let logRowCol = document.createElement('div');
					logRowCol.classList.add('col-4');
					logRowCol.classList.add('px-0');
					logRowCol.setAttribute('id', 'logBox');
					logRow.appendChild(logRowCol);
					
					let keywordRow = document.createElement('div');
					keywordRow.classList.add('row');
					keywordRow.classList.add('m-1');
					keywordRow.classList.add('p-1');
					keywordRow.classList.add('bg-white');
					keywordRow.classList.add('border');
					keywordRow.classList.add('border-secondary-light');
					keywordRow.classList.add('rounded');
					keywordRow.classList.add('text-small');
					logRowCol.appendChild(keywordRow);
					
					let keywordTextCol = document.createElement('div');
					keywordTextCol.classList.add('col');
					keywordRow.appendChild(keywordTextCol);
					
					let keywordTextSpan = document.createElement('span');
					keywordTextSpan.innerText = log.product_search_keyword;
					keywordTextCol.appendChild(keywordTextSpan);
					
					let keywordDelCol = document.createElement('div');
					keywordDelCol.classList.add('col-2');
					keywordDelCol.classList.add('p-0');
					keywordDelCol.classList.add('text-center');
					keywordDelCol.setAttribute('onclick', 'removeOneSearchLog(' + log.product_search_no + ')');
					keywordRow.appendChild(keywordDelCol);
					
					let xLgIcon = document.createElement('i');
					xLgIcon.classList.add('bi');
					xLgIcon.classList.add('bi-x-lg');
					xLgIcon.classList.add('text-secondary');
					keywordDelCol.appendChild(xLgIcon);
					
					recentContentArea.appendChild(myRecentLogRow);	//요거요거
				}
				
			} else {
				let recentTitleCol = document.getElementById('recentTitleCol');
				if(recentTitleCol != undefined || recentTitleCol != null) {
					recentTitleCol.innerHTML = '';
				}
				
				let isNotTextRow = document.createElement('div');
				isNotTextRow.classList.add('row');
				
				let isNotTextRowCol = document.createElement('div');
				isNotTextRowCol.classList.add('col');
				isNotTextRowCol.classList.add('text-secondary');
				isNotTextRowCol.classList.add('text-small');
				isNotTextRow.appendChild(isNotTextRowCol);
				
				let isNotTextSpan = document.createElement('span');
				isNotTextSpan.innerText = '최근 검색어가 없습니다.';
				isNotTextRowCol.appendChild(isNotTextSpan);
				
				recentContentArea.appendChild(isNotTextRow);
				
			}
			
		}
	})
	
	
	////////////////////////////////////////////////////////////
	
	let popularKeywordBox = document.createElement('div');
	popularKeywordBox.classList.add('row');
	popularKeywordBox.classList.add('my-4');
	containerBox.appendChild(popularKeywordBox);
	
	let popularKeywordCol = document.createElement('div');
	popularKeywordCol.classList.add('col');
	popularKeywordBox.appendChild(popularKeywordCol);
	
	let popularKeywordTitleRow = document.createElement('div');
	popularKeywordTitleRow.classList.add('row');
	popularKeywordTitleRow.classList.add('my-3');
	popularKeywordCol.appendChild(popularKeywordTitleRow);
	
	let popularKeywordTitleRowCol = document.createElement('div');
	popularKeywordTitleRowCol.classList.add('col');
	popularKeywordTitleRowCol.classList.add('fw-bold');
	popularKeywordTitleRow.appendChild(popularKeywordTitleRowCol);
	
	let popularKeywordTitleSpan = document.createElement('span');
	popularKeywordTitleSpan.innerText = '인기 검색어';
	popularKeywordTitleRowCol.appendChild(popularKeywordTitleSpan);
	
	let popularKeywordConRow = document.createElement('div');
	popularKeywordConRow.classList.add('row');
	popularKeywordConRow.classList.add('px-4');
	popularKeywordCol.appendChild(popularKeywordConRow);
	
	
	// 인기 검색어 데이터 조회
	$.ajax({
		url: './getPopularKeywordList',
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let popularKeywordList = obj.data;
			let index = 0;
			for(keyword of popularKeywordList) {
				
				let popularKeywordConRowCol = document.createElement('div');
				popularKeywordConRowCol.classList.add('col-6');
				popularKeywordConRow.appendChild(popularKeywordConRowCol);
				
				let keywordBox = document.createElement('div');
				keywordBox.classList.add('row');
				keywordBox.classList.add('py-2');
				keywordBox.classList.add('border-bottom');
				keywordBox.classList.add('border-secondary-light');
				popularKeywordConRowCol.appendChild(keywordBox);
				
				let keywordIndexCol = document.createElement('div'); 
				keywordIndexCol.classList.add('col-1')
				keywordIndexCol.classList.add('fw-bold')
				keywordIndexCol.innerText = parseInt(index) + 1;
				keywordBox.appendChild(keywordIndexCol);
				
				let keywordCol = document.createElement('div');
				keywordCol.classList.add('col');
				keywordCol.classList.add('text-small');
				keywordCol.innerText = keyword;
				keywordBox.appendChild(keywordCol);
				
				index = parseInt(index) + 1;
			}
		}
	});
	
	body.appendChild(containerBox);
	
	let footer = document.createElement('jsp:include');
	footer.setAttribute('page', './common/footer.jsp');
	body.appendChild(footer);
}

// 카테고리 탭 클릭 시 렌더링
function showCategoryTap() {
	let body = document.querySelector('body');	// 바디에 넣기 마지막에
	let header = document.getElementById('header');
	header.innerHTML = '';
	
	let containerBox = document.getElementById('container');
	containerBox.innerHTML = '';
	
	let headerRow = document.createElement('div');
	headerRow.classList.add('row');
	headerRow.classList.add('py-2');
	containerBox.appendChild(headerRow);
	
	let backCol = document.createElement('div');
	backCol.classList.add('col-1');
	backCol.classList.add('px-0');
	backCol.classList.add('mx-2');
	backCol.classList.add('fs-1');
	backCol.classList.add('text-center');
	backCol.setAttribute('onclick', 'location.href = document.referrer');
	headerRow.appendChild(backCol);
	
	let backIcon = document.createElement('i');
	backIcon.classList.add('bi');
	backIcon.classList.add('bi-arrow-left');
	backCol.appendChild(backIcon);
	
	let cateTextCol = document.createElement('div');
	cateTextCol.classList.add('col');
	cateTextCol.classList.add('fw-bold');
	cateTextCol.classList.add('fs-5');
	cateTextCol.classList.add('my-1');
	cateTextCol.classList.add('px-0');
	cateTextCol.setAttribute('id', 'searchArea');
	headerRow.appendChild(cateTextCol);
	
	let cateTextSpan = document.createElement('span');
	cateTextSpan.innerText = '카테고리';
	cateTextCol.appendChild(cateTextSpan);
	
	let cartCol = document.createElement('div');
	cartCol.classList.add('col-1');
	cartCol.classList.add('px-0');
	cartCol.classList.add('mx-2');
	cartCol.classList.add('text-secondary');
	cartCol.classList.add('text-center');
	cartCol.classList.add('fs-1');
	cartCol.setAttribute('onclick', 'location.href="../cart/myCart";');
	headerRow.appendChild(cartCol);
	
	let cartIcon = document.createElement('i');
	cartIcon.classList.add('bi');
	cartIcon.classList.add('bi-cart2');
	cartCol.appendChild(cartIcon);
	
	let categoryListRow = document.createElement('div');
	categoryListRow.classList.add('row');
	categoryListRow.classList.add('mb-1');
	categoryListRow.classList.add('px-1');
	categoryListRow.classList.add('border-top');
	categoryListRow.classList.add('border-secondary-light');
	containerBox.appendChild(categoryListRow);
	
	$.ajax({
		url: './getCategory',
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			let categoryList = obj.data;
			if(categoryList != null && categoryList.length > 0) {
				for(category of categoryList) {
					
					let categoryListRowCol = document.createElement('div');
					categoryListRowCol.classList.add('col-4');
					categoryListRow.appendChild(categoryListRowCol);
					
					let categorySelectRow = document.createElement('div');
					categorySelectRow.classList.add('row');
					categorySelectRow.classList.add('my-2');
					categoryListRowCol.appendChild(categorySelectRow);
					
					let categorySelectRowCol = document.createElement('div');
					categorySelectRowCol.classList.add('col');
					categorySelectRowCol.classList.add('my-3');
					categorySelectRowCol.setAttribute('onclick', 'location.href="./categoryProductList?category_no=" + "'+category.product_category_no+'"');
					categorySelectRow.appendChild(categorySelectRowCol);
					
					let cateImgRow = document.createElement('div');
					cateImgRow.classList.add('row');
					cateImgRow.classList.add('px-2');
					categorySelectRowCol.appendChild(cateImgRow);
					
					let cateImgRowCol = document.createElement('div');
					cateImgRowCol.classList.add('col');
					cateImgRowCol.classList.add('img-wrapper');
					cateImgRow.appendChild(cateImgRowCol);
					
					let cateImg = document.createElement('img');
					cateImg.classList.add('rounded-circle');
					cateImg.setAttribute('src', '/uploadFiles/'+category.product_category_image_path);
					cateImgRowCol.appendChild(cateImg);
					
					let cateNameAreaCol = document.createElement('div');
					cateNameAreaCol.classList.add('col');
					categorySelectRow.appendChild(cateNameAreaCol);
					
					let cateNameRow = document.createElement('div');
					cateNameRow.classList.add('row');
					cateNameRow.classList.add('fw-bold');
					cateNameRow.classList.add('text-small');
					cateNameRow.classList.add('text-center');
					cateNameAreaCol.appendChild(cateNameRow);
					
					let cateNameRowCol = document.createElement('div');
					cateNameRowCol.classList.add('col');
					cateNameRow.appendChild(cateNameRowCol);
					
					let cateNameSpan = document.createElement('span');
					cateNameSpan.innerText = category.product_category_name;
					cateNameRowCol.appendChild(cateNameSpan);
				}
				body.appendChild(containerBox);
			} else {
				
			}
		}
	})
	
	body.appendChild(footer);
}

let productNo = '';
// header 탭 클릭 시 리스트 렌더링 (전체/실시간/HOT)
function showProductListAjax(id) {
	$.ajax({
		url: './getProductList?listType=' + id,
		method: 'get',
		dataType: 'json',
	}).done(function(obj) {
		const consumer = '${consumer}';
		
		if(obj.result == 'success') {
			let productList = obj.data;
			
			let bodyBox = document.getElementById('bodyBox');
			bodyBox.innerHTML = '';
			
			let colBox = document.createElement('div');
			colBox.classList.add('col');
			bodyBox.appendChild(colBox);
			
			if(consumer != null && consumer != undefined) {
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
			
		}
		
	})
	
}




