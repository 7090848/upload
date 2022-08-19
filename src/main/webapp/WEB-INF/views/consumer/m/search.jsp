<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<!-- 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
 -->
<title>Atelier</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/mainHome.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">

// 최근검색어 개별 삭제
function removeOneSearchLog(searchNo) {
	$.ajax({
		url: './removeOneMySearchLog?product_search_no=' + searchNo,
		method: 'post',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			refreshRecentSearchLog();
			
		} else {
			console.log('오류 발생');
		}
	}).fail(function(){});
	
	
}

// 최근검색어 전체 삭제
function removeAllSearchLog() {
	$.ajax({
		url: './removeAllMySearchLog',
		method: 'post',
		dataType: 'json',
	}).done(function(obj) {
		if(obj.result == 'success') {
			refreshRecentSearchLog();
		}
	})
}

function refreshRecentSearchLog() {
	$.ajax({
		url: './getRecentSearchLog',
		method: 'get',
		dataType: 'json'
	}).done(function(obj) {
		if(obj.result == 'success') {
			const sessionConsumer = '${consumer}';
			
			let recentSearchLogList = obj.data;
			let recentSearchLogBox = document.getElementById('recentSearchLogBox');
			let recentContentArea = document.getElementById('recentContentArea');
			recentContentArea.innerHTML = '';
			//console.log(recentSearchLogList);
			if(sessionConsumer != null && recentSearchLogList != null && recentSearchLogList.length > 0) {
				
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
				
				for(log of recentSearchLogList) {
					
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
					keywordTextCol.setAttribute('onclick', 'goSearchListByKeyword("'+log.product_search_keyword+'");');
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
				
				console.log('위조건')
			} else {
				
				console.log('삭제해라')
				let recentTitleCol = document.getElementById('recentTitleCol');
				if(recentTitleCol != undefined || recentTitleCol != null) {
					recentTitleCol.innerHTML = '';
				}
				
				let isNotConCol = document.createElement('div');
				isNotConCol.classList.add('col');
				
				let isNotTextRow = document.createElement('div');
				isNotTextRow.classList.add('row');
				isNotConCol.appendChild(isNotTextRow);
				
				let isNotTextRowCol = document.createElement('div');
				isNotTextRowCol.classList.add('col');
				isNotTextRowCol.classList.add('text-secondary');
				isNotTextRowCol.classList.add('text-small');
				isNotTextRow.appendChild(isNotTextRowCol);
				
				let isNotTextSpan = document.createElement('span');
				isNotTextSpan.innerText = '최근 검색어가 없습니다.';
				isNotTextRowCol.appendChild(isNotTextSpan);
				
				recentContentArea.appendChild(isNotConCol);
				
			}
		}
	})
}

function goSearchListByKeyword(keyword) {
	location.href='./searchProduct?searchWord=' + keyword;
}

function submitSearch() {
	let frm = document.getElementById('searchFrm');
	frm.submit();
}

window.addEventListener("DOMContentLoaded", function() {
	refreshRecentSearchLog();
	
});

</script>
</head>
<body>
	<div class="container-fluid">
		<form action="./searchProduct" id="searchFrm">
			<div class="row my-2">
				<div class="col-1 pt-1 px-0 mx-2 fs-1 text-center" onclick="history.back();"><i class="bi bi-arrow-left"></i></div>
				<div class="col input-group input-group-sm px-0" id="searchArea">
					  <input type="text" class="form-control" id="search" name="searchWord" placeholder="검색어를 입력하세요" >
				</div>
				  <div class="col-1 px-0 pt-1 mx-2 text-secondary text-center fs-1" id="searchBtn" onclick="submitSearch();"><i class="bi bi-search"></i></div>
			</div>
		</form>
		
		<div class="row my-2 border-top border-secondary-light" id="recentSearchLogBox">
			<div class="col">
				<div class="row my-3" id="recentTitleArea">
					<div class="col fw-bold"><span>최근 검색어</span></div>
				</div>
				<div class="row" id="recentContentArea"></div>
			</div>
		</div>		

		<div class="row my-4">
			<div class="row my-3"><div class="col fw-bold"><span>인기 검색어</span></div></div>
			<div class="row px-4">
				<c:set var="i" value="0" />
				<c:forEach items="${popularKeywordList }" var="popularKeyword">
					<div class="col-6">
						<div class="row py-2 border-bottom border-secondary-light" onclick="goSearchListByKeyword('${popularKeyword}');">
							<div class="col-1 fw-bold">${i+1}</div>
							<div class="col text-small" style="color: #424242;">${popularKeyword }</div>
						</div>
					</div>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</div>		
		</div>
		
	</div>
	
		<div class="row pt-1 text-center text-secondary bg-light border boder-top border-secondary border-opacity-50 fixed-bottom">
		
			<div class="col ft-nav-btn" id="pd-tap" onclick="location.href='../m/main';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-house"></i></div></div>
				<div class="row text-small"><div class="col"><span>작품</span></div></div>
			</div>
			<div class="col ft-nav-btn fw-bold main-yellow" id="search-tap" onclick="location.href='../m/search';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-search"></i></div></div>
				<div class="row text-small"><div class="col"><span>검색</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="cate-tap" onclick="location.href='../m/category';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-list"></i></div></div>
				<div class="row text-small"><div class="col"><span>카테고리</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="my-tap" onclick="location.href='../mp/myPage';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-person"></i></div></div>
				<div class="row text-small"><div class="col"><span>내정보</span></div></div>
			</div>
			
		</div> 
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>