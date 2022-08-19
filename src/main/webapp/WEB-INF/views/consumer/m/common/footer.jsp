<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

// 1 작품
// 2 검색
// 3 카테고리
// 4 내정보
let selectTapId = '';


/*
// 하단 탭 클릭 시 탭 UI 컬러 변경
function focusFooterBtn(thisId, targetClassName) {
	let select = document.getElementById(thisId);
	let navBtns = document.getElementsByClassName(targetClassName);
	for(e of navBtns) {
		e.classList.remove('text-warning');
		e.classList.remove('fw-bold');
		e.classList.add('text-secondary');
	}
	select.classList.add('fw-bold');
	select.classList.add('text-warning');
}

// 탭 클릭 시 함수 호출(렌더링)
function showTap(thisId) {
	switch(thisId) {
		case 'pd-tap':
			showProductTap();
			break;
			
		case 'search-tap':
			showSearchTap();
			break;
			
		case 'cate-tap':
			showCategoryTap();
			break;
			
		case 'my-tap':
			showMyPageTap();
			break;
	}
}

window.addEventListener("DOMContentLoaded", function() {
	let ftNavClass = 'ft-nav-btn';
	let footerBtns = document.getElementsByClassName(ftNavClass);
	for(btn of footerBtns) {
		btn.addEventListener('click', function(e) {
			let thisId = this.id;
			focusFooterBtn(thisId, ftNavClass);
		});
	}
});
*/

</script>

		<div class="row mt-2 mb-1 bg-light border boder-top border-secondary border-opacity-50 fixed-bottom text-center text-secondary">
		
			<div class="col ft-nav-btn main-yellow fw-bold" id="pd-tap" onclick="location.href='./main';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-house"></i></div></div>
				<div class="row text-small"><div class="col"><span>작품</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="search-tap" onclick="location.href='./search';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-search"></i></div></div>
				<div class="row text-small"><div class="col"><span>검색</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="cate-tap" onclick="location.href='./category';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-list"></i></div></div>
				<div class="row text-small"><div class="col"><span>카테고리</span></div></div>
			</div>
			<div class="col ft-nav-btn" id="my-tap" onclick="location.href='./myPage';">
				<div class="row fs-4 fw-bold"><div class="col"><i class="bi bi-person"></i></div></div>
				<div class="row text-small"><div class="col"><span>내정보</span></div></div>
			</div>
			
		</div> 
