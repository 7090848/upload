<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
 .centers{
	align-self: center;
}

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<script type="text/javascript">
	
function orderList(){
	var consumerNo = ${consumer.consumer_no}
	var paymentNo = ${address.PAYMENT_NO};
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var commentListBox = document.getElementById("orderList");
				commentListBox.innerHTML = "";
				
				for(orderDataList of jsonObj){
				
					
					
					var rowBox = document.createElement("div");
					rowBox.classList.add("row");
					rowBox.classList.add("mx-3");
					rowBox.classList.add("mb-1");
					rowBox.classList.add("mt-3");
					rowBox.classList.add("py-3");
					rowBox.classList.add("px-3");
					rowBox.classList.add("border");
					rowBox.classList.add("border-dark");
					rowBox.classList.add("border-opacity-25");
					rowBox.classList.add("bg-white");
					
					var rowBox0 = document.createElement("div");
					rowBox0.classList.add("row");
					rowBox0.classList.add("border-bottom");
					rowBox0.classList.add("border-secondary");
					rowBox0.classList.add("border-opacity-25");
					rowBox0.classList.add("mx-0");
					rowBox0.classList.add("mb-3");
					rowBox.appendChild(rowBox0);
					
					var colBox01 = document.createElement("div");
					colBox01.classList.add("col");
					colBox01.classList.add("text-left");
					colBox01.innerText = orderDataList.STORE_NAME + " " +"스토어";
					rowBox0.appendChild(colBox01);
					
					
					var colBox02 = document.createElement("div");
					colBox02.classList.add("col");
					colBox02.classList.add("text-small");
					colBox02.classList.add("sub-grey");
					colBox02.classList.add("text-opacity-50");
					rowBox0.appendChild(colBox02);
					/* 오른쪽정렬 어캐함 */

					var colBox021 = document.createElement("i");
					colBox021.classList.add("bi");
					colBox021.classList.add("bi-truck");
					colBox021.innerText = orderDataList.PRODUCT_POST_PRICE + "" +"선결제";
					colBox02.appendChild(colBox021);
					
					
					
					/* var rowBox001 = document.createElement("hr");
					rowBox001.style.outline="solid 1px darkgrey";
					rowBox001.classList.add("mt-2")
					rowBox.appendChild(rowBox001); */
					
					var rowBox002 = document.createElement("div");
					rowBox002.classList.add("row");
					rowBox002.classList.add("sub-grey");
					rowBox002.classList.add("text-small");
					rowBox002.classList.add("mx-0");
					rowBox002.innerText = "판매자에게 직접 연락하시면 빠른 확인이 가능합니다."
					rowBox.appendChild(rowBox002);
					
					var rowBox003 = document.createElement("a");
					rowBox003.setAttribute("href", "../m/main");
					rowBox003.classList.add("text-decoration-none");
					rowBox003.classList.add("main-yellow");
					rowBox003.classList.add("text-small");
					rowBox003.classList.add("mx-0");
					rowBox003.innerText = "판매자에게 문의하기> ";
					rowBox003.classList.add("mb-2");
					rowBox.appendChild(rowBox003);

					
					//
					var colBox1 = document.createElement("div");
					colBox1.classList.add("col-4");
					rowBox.appendChild(colBox1);
				
					var imgBox = document.createElement("img");
					imgBox.setAttribute("src", "/uploadFiles/"+orderDataList.PI_PATH+"");
					imgBox.classList.add("pd-img");
					colBox1.appendChild(imgBox);
					//
					
					
					var colBox2 = document.createElement("div");
					colBox2.classList.add("col-8");
					rowBox.appendChild(colBox2);
					
					
										
					
					
					var rowBox22 = document.createElement("div");
					rowBox22.classList.add("row");
					rowBox22.classList.add("mb-1");
					colBox2.appendChild(rowBox22);
					
					if(orderDataList.ORDER_DELIVERY_STATUS == "COM"){
						var colBox221 = document.createElement("div");
						colBox221.classList.add("col-3");
						colBox221.classList.add("text-right");
						colBox221.classList.add("text-xsmall");
						colBox221.classList.add("centers");
						colBox221.classList.add("bt-1");
						colBox221.classList.add("bg-warning");
						colBox221.classList.add("bg-opacity-75");
						colBox221.classList.add("text-white");
						colBox221.classList.add("text-center");
						colBox221.classList.add("border");
						colBox221.innerText = "배송완료";
						
						rowBox22.appendChild(colBox221);
						
					}else if(orderDataList.ORDER_DELIVERY_STATUS == "ING"){
						var colBox222 = document.createElement("div");
						colBox222.classList.add("col-3");
						colBox222.classList.add("text-right");
						colBox222.classList.add("text-xsmall");
						colBox222.classList.add("centers");
						colBox222.classList.add("bt-1");
						colBox222.classList.add("bg-warning");
						colBox222.classList.add("bg-opacity-75");
						colBox222.classList.add("text-white");
						colBox222.classList.add("text-center");
						colBox222.classList.add("border");
						colBox222.innerText = "배송중";
						rowBox22.appendChild(colBox222);
					}else{
						var colBox223 = document.createElement("div");
						colBox223.classList.add("col-3");
						colBox223.classList.add("text-right");
						colBox223.classList.add("text-xsmall");
						colBox221.classList.add("centers");
						colBox223.classList.add("bt-1");
						colBox223.classList.add("bg-warning");
						colBox223.classList.add("bg-opacity-50");
						colBox223.classList.add("text-white");
						colBox223.classList.add("border");
						colBox223.classList.add = "배송준비중";
						rowBox22.appendChild(colBox223);
					}
					
					
					var colBox22 = document.createElement("div");
					colBox22.classList.add("col-9");
					rowBox22.appendChild(colBox22);
					
					var colBox221 = document.createElement("a");
					colBox221.setAttribute("href", "../pd/productDetail?product_no='"+orderDataList.PRODUCT_NO+"'");					
					colBox221.classList.add("text-decoration-none");
					colBox221.classList.add("text-black");
					colBox221.innerText = orderDataList.PRODUCT_NAME;
					colBox22.appendChild(colBox221);
					
					
					
					
					var res = orderDataList.PRODUCT_PRICE;
					var ress = res.toLocaleString('en-US');
					var rowBox23 = document.createElement("div");
					rowBox23.classList.add("row");
					rowBox23.classList.add("pb-1");
					rowBox23.innerText = (ress + "원");
					colBox2.appendChild(rowBox23);
					
					
					
					var rowBox24 = document.createElement("div");
					rowBox24.classList.add("row");
					colBox2.appendChild(rowBox24);
					
					var colBox24 = document.createElement("div");
					colBox24.classList.add("sub-grey");
					colBox24.classList.add("col-6");
					colBox24.classList.add("ps-0");
					colBox24.classList.add("text-small");
					colBox24.classList.add("text-left");
					colBox24.innerText = "주문수량 : " +  orderDataList.ORDER_PRODUCT_COUNT + "개";
					rowBox24.appendChild(colBox24);
					
					var rowBox241 = document.createElement("div");
					rowBox241.classList.add("row");
					rowBox241.classList.add("sub-grey");
					rowBox241.classList.add("text-small");
					rowBox241.classList.add("mb-1");
					rowBox241.innerText = orderDataList.PRODUCT_DESCRIPTION;
					colBox2.appendChild(rowBox241);
					
					
					
					var rowBox25 = document.createElement("div");
					rowBox25.classList.add("row");
					colBox2.appendChild(rowBox25);
					
					if(orderDataList.ORDER_COMPLETE_STATUS == "PURCH"){
						var reviewBtn = document.createElement("a");
						
						reviewBtn.setAttribute("href", "../mp/registerReview?order_no=" + orderDataList.ORDER_NO + "&product_no=" + orderDataList.PRODUCT_NO + "&store_no=" + orderDataList.STORE_NO)
						reviewBtn.classList.add("col-5");
						reviewBtn.classList.add("text-center");
						reviewBtn.classList.add("py-1");
						reviewBtn.classList.add("border");
						reviewBtn.classList.add("bg-warning");
						reviewBtn.classList.add("bg-opacity-75");
						reviewBtn.classList.add("text-white");
						reviewBtn.classList.add("me-3");
						reviewBtn.classList.add("mb-1");
						reviewBtn.classList.add("border");
						reviewBtn.innerText = "리뷰쓰기";
						rowBox25.appendChild(reviewBtn);
						
						
					}else{
						var confirmBtn = document.createElement("div");
						confirmBtn.setAttribute("onclick", "orderConfirm("+orderDataList.ORDER_NO+","+orderDataList.PAYMENT_NO+")");
						confirmBtn.classList.add("col-5");
						confirmBtn.classList.add("text-center");
						confirmBtn.classList.add("py-1");
						confirmBtn.classList.add("text-black");
						confirmBtn.classList.add("border");
						confirmBtn.classList.add("me-3");
						confirmBtn.classList.add("mb-1");
						confirmBtn.innerText = "구매확정";
						rowBox25.appendChild(confirmBtn);
					}
					
					var deliveryBtn = document.createElement("div");
					deliveryBtn.classList.add("col-5");
					deliveryBtn.classList.add("text-center");
					deliveryBtn.classList.add("py-1");
					deliveryBtn.classList.add("text-black");
					deliveryBtn.classList.add("border");
					deliveryBtn.classList.add("mb-1");
					deliveryBtn.innerText="배송조회"
					rowBox25.appendChild(deliveryBtn);
					
					var rowBoxTwo = document.createElement("div");
					rowBoxTwo.classList.add("row");
					colBox2.appendChild(rowBoxTwo);
					
					var refund = document.createElement("div");
					refund.classList.add("col-5");
					refund.classList.add("text-center");
					refund.classList.add("py-1");
					refund.classList.add("text-black");
					refund.classList.add("border");
					refund.classList.add("me-3");
					refund.innerText="반품요청";
					rowBoxTwo.appendChild(refund);
					
					var change = document.createElement("div");
					change.classList.add("col-5");
					change.classList.add("text-center");
					change.classList.add("py-1");
					change.classList.add("text-black");
					change.classList.add("border");
					change.innerText="교환요청";
					rowBoxTwo.appendChild(change);
					
					var colBox25 = document.createElement("div");
					colBox25.classList.add("col");
					colBox2.appendChild(colBox25);
					
					
					commentListBox.appendChild(rowBox);
					
				}
				
			}
		}
		
		xhr.open("get" , "../orderList?payment_no=" + paymentNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
		
	}
	
function insertReview(orderNo, productNo, storeNo){
	
	var orderNo = document.getElement
	
	var reviewStar = document.getElementById("insstar").value;
	var reviewContent = document.getElementById("inscontent").value;
	var reviewPhoto = document.getElementById("insphoto").value;
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			document.setAttribute("data-bs-toggle","modal");
			document.setAttribute("data-bs-target", "#exampleModal");
			orderList();
			
		}
	}
	
	xhr.open("post" , "../insertReview?order_no=" + orderNo + "&product_no=" + productNo + "&store_no=" + storeNo); //리퀘스트 세팅..
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send("review_star=" + reviewStar + "review_content=" +reviewContent+ "review_img_path" + reviewPhoto); //AJAX로 리퀘스트함..		
}


function mul(orderNo, productNo, storeNo){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			var input = document.getAttribute(orderNo, productNo, storeNo);
		/* 	input = 
			
		var nameInputBox = document.createElement("input");	
         	nameInputBox.id = "nameValue";
         	nameInputBox.name = "nameValue1";
         	nameInputBox.value= e.product_no;
         	nameInputBox.type="hidden";
			orderList(); */
			
		}
	}
	xhr.open("get","");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
}

/* function test(){
	
	insertReview();
}
 */

function orderConfirm(orderNo, paymentNo){
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			orderList();
		}
	}
	
	xhr.open("get" , "../orderConfirm?order_no=" + orderNo + "&payment_no=" + paymentNo); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..		
}



	
	window.addEventListener("DOMContentLoaded" , function (){
		orderList();
		
	});
	
</script>
	
<title>주문 상세정보</title>
</head>
<body>
	<div class="row mt-4  mx-3 bg-white py-3 border">
		<div class="col-3 text-left" style="text-align:center;">
			<a href="../m/main" class="text-decoration-none text-black">
				<img class="pd-img" src="/uploadFiles/atelier/logoA.png">
			</a>
		</div>
		<div class="col-6" style="text-align:center;">주문 상세정보</div>
		<div class="col-3 text-decoration-none" style=" text-align: end;"><a href="javascript:history.back();"><i class="bi bi-backspace-reverse"></i></a></div>
	</div>
	
	<div class="row">
		
	</div>
	
	
	
	
	
<!-- 댓글 -->
	<div class="row">
			<div id="orderList" class="col"></div>
	</div> 	
	<!-- 모달 시작 -->
	
	
	
	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰쓰기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="modalForm" name="modalForm">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">상품은 만족하셨나요?</label>
            <input type="text" class="form-control" id="insstar">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">어떤 점이 좋았나요?</label>
            <textarea class="form-control"name = "product_description" placeholder="최소 10자 이상 입력해주세요!" id="inscontent" rows="10"></textarea>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">사진/동영상 첨부하기</label>
            <input type="file" class="form-control" name="files" id="insphoto" multiple accept="image/*">
          </div>
		<input type="hidden" id="test" value="">
        </form>
      </div>
	      <div class="modal-footer">
	       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <div class="row mb-3"><input type="button" onclick="insertReview()" class="btn btn-primary" value="등록" data-bs-dismiss="modal" aria-labal="Close"></div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 모달끝 -->
	
	<div class="row mx-1 mb-1">
		<img src="/uploadFiles/atelier/광고1.jpg">
	</div>
	
	<!--배송지 -->
<div class="row ms-6 mx-3 mb-2 bg-white">
  <div class="border border-dark border-opacity-25 px-4 py-2">
	<div class="row ms-0 mt-2 border-bottom border-secondary  border-opacity-25 mb-3">배송지정보</div>
	<div class="row ms-0 mb-1">
		<div class="col-3 ps-0 sub-grey text-opacity-50">수령인</div>
		<div class="col-9 ps-0">${address.ADDRESS_NAME }</div>
	</div>

	<div class="row ms-0 mb-1">
		<div class="col-3 ps-0 sub-grey">연락처</div>
		<div class="col-9 ps-0">${address.ADDRESS_PHONE }</div>
	</div>
	<div class="row ms-0 mb-2">
		<div class="col-3  ps-0 sub-grey">배송지</div>
		<div class="col-9  ps-0">
			<div class="row ms-0">${address.ADDRESS_POSTCD }</div>
			<div class="row ms-0">${address.ADDRESS_STREET_ADDR }</div>
			<div class="row ms-0">${address.ADDRESS_DETAIL_ADDR }</div>
		</div>
	</div>
	<div class="row ms-0">
		<div class="col-3  ps-0 sub-grey">배송메모</div>
		<div class="col-9  ps-0">${address.ADDRESS_MESSAGE }</div>
	</div>
  </div>
</div>
	
	
<div class="row ms-6 mx-3 mb-3 bg-white">
  <div class="border border-dark border-opacity-25 px-4 py-2">
	<div class="row ms-0 mt-2 border-bottom border-secondary  border-opacity-25 mb-3">주문 금액</div>
	<div class="row ms-0">
		<div class="col-5 ps-0" >최종 주문 금액</div>
		<div class="col-7 ps-0 main-yellow" style="text-align: end;">${address.PAYMENT_TOTAL_PRICE }원</div>
	</div>
	<div class="row ms-0">
		<div class="col-5 ps-0 sub-grey" >상품금액</div>
		<div class="col-7 ps-0" style="text-align: end;">${address.PAYMENT_ORIGIN_PRICE }원</div>
	</div>
	<div class="row ms-0">
		<div class="col-5 ps-0 sub-grey" >쿠폰할인</div>
		<div class="col-7 ps-0" style="text-align: end;">${address.PAYMENT_USE_COUPON }원</div>
	</div>
	<div class="row ms-0">
		<div class="col-5 ps-0 sub-grey" >포인트 사용</div>
		<div class="col-7 ps-0" style="text-align: end;">${address.PAYMENT_USE_POINT }원</div>
	</div>
	<div class="row ms-0">
		<div class="col-5 ps-0 sub-grey">포인트 적립</div>
		<div class="col-7 ps-0" style="text-align: end;">${address.PAYMENT_SAVEPOINT }원</div>
	</div>
  </div>
</div>
	
	


	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>