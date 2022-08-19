<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#searchArea, #pdImgArea {
		display: flex;
	}
	
	#searchBtn {
		ont-weight : 900;
		  font-family: "Font Awesome 5 Free";
		  background-color : transparent;
		  border : none;
		  top: 22px;
		  right: 0px;
		  cursor : pointer;
		  position : absolute;
		  transform : translatey(-50%);
	}
	
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
<script type="text/javascript">

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


window.addEventListener("DOMContentLoaded", function() {
	showProductListAjax('all');
	
	// header 버튼 클릭 시 상품 리스트 변경
	let hdNavClass = 'hd-nav-btn';
	let headerBtns = document.getElementsByClassName(hdNavClass);
	for(btn of headerBtns) {
		btn.addEventListener('click', function(e) {
			let thisId = this.id;
			// getProuctListAjax(thisId);
			focusHeaderNavBtn(thisId, hdNavClass);
			showProductListAjax(thisId);
		});
	}
	
});

</script>
<style>
	
	#searchArea {
		display: flex;
	}
	
	#searchBtn {
		ont-weight : 900;
		  font-family: "Font Awesome 5 Free";
		  background-color : transparent;
		  border : none;
		  top: 22px;
		  right: 0px;
		  cursor : pointer;
		  position : absolute;
		  transform : translatey(-50%);
	}
	
</style>

<!-- header -->
<div class="row py-2" id="headerBox">
		<div class="col-2 px-0 pt-2 mx-1" onclick="location.href='../m/main';"><img class="img-fluid" src="../../resources/img/logoA.png"></div>
		<div class="col input-group px-0 mx-1" id="searchArea" onclick="location.href='../m/search';">
			  <input type="text" class="form-control" id="search" onclick="location.href='./m/search';" placeholder="검색어를 입력하세요">
			  <div class="col-2 px-0 text-secondary text-center fs-3" id="searchBtn"><i class="bi bi-search"></i></div>
		</div>
		<div class="col-1 px-0 mx-2 pt-1 text-secondary text-center fs-1" onclick="location.href='../cart/myCart';"><i class="bi bi-cart2"></i></div>
	</div>	
	
	<div class="row text-center pt-1 fs-6">
		<div class="col hd-nav-btn py-2 text-warning fw-bold border-bottom border-warning border-opacity-50 border-3" id="all"><span>전체</span></div>
		<div class="col hd-nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="realtime" ><span>실시간</span></div>
		<div class="col hd-nav-btn py-2 text-secondary border-bottom border-secondary border-opacity-50 border-2" id="hot"><span>HOT</span></div>
	</div>
</div>