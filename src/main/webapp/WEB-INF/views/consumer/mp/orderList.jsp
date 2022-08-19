<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function printName(){
		var amt = document.getElementById('amt').value;
		document.getElementById("result").innerText = currencyChg(amt);
	}
	
	function currencyChg(data){
		return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>

<body>

<div class="container-fluid">
	<div class="row my-3">
		 
	 	<div class="row mt-2"></div>
		 	<div class="row ms-0 mb-4">
		 		 <div class="col-2" ><a href="javascript:history.back();"><i class="bi bi-arrow-left text-decoration-none"></i></a></div>
	             <div class="col-10"><a href="../m/main" class="text-decoration-none text-black">주문 배송</a></div>
	         </div>
	 		<div class="row ms-0 mb-2" style="text-align: center;">
		 		<span class="border border-dark border-opacity-25" style="background-color: white;">
	            <div class="row ms-0 my-2" style="text-align: center;">
	                <div class="col border-end border-secondary"><a href="../m/main" class="text-decoration-none text-black ">작품</a></div>
	                <div class="col border-end border-secondary"><a href="../cart/myCart" class="text-decoration-none text-black ">장바구니</a></div>
	                <div class="col"><a href="../mp/myWishList" class="text-decoration-none text-black">찜 목록</a></div>
	            </div>
				</span>
			</div>
			
		
			<c:forEach items="${data}" var="data">
            <div class="row ms-0 mb-2 pt-2 ">
	            <div class="border border-dark border-opacity-25" style="background-color: white;">
	            <div class="row border-bottom border-secondary  border-opacity-25 mt-1 mb-2">
	            	<div class="col sub-grey text-small"> 
                       	<fmt:formatDate value="${data.ORDER_DATE}" pattern="yyyy.MM.dd"/>
	                </div>
	            	<div class="col"style="text-align:end">${data.PRODUCT_PRICE } 원<i class="bi bi-chevron-right"></i></div>
	            </div>
	            
	           
	            
	            
	                <div class="row">
	                    <div class="col-2"><img class="pd-img" src="/uploadFiles/${data.PI_PATH }"></div>
	                    <div class="col-7">
	                        <div class="row "><a class="text-decoration-none text-black" href="../mp/orderDetailList?payment_no=${data.PAYMENT_NO }&order_no=${data.ORDER_NO}"> ${data.PRODUCT_NAME }</a></div>
	                        <div class="row"><a class="text-decoration-none text-secondary text-opacity-50" href="../mp/orderDetailList?payment_no=${data.PAYMENT_NO }&order_no=${data.ORDER_NO}">${data.PRODUCT_DESCRIPTION }</a></div>
	                    </div>
	                    <div class="col-3" style="align-self: center;">
	                    	 <c:choose>
			            		<c:when test="${data.ORDER_COMPLETE_STATUS eq 'PAY'}">	
			                		<a href="#" class="text-decoration-none  text-black">결제완료</a>
			                	</c:when>
			                	<c:otherwise>
			                		<a href="#"  class="text-decoration-none text-black">구매확정</a>
			                	</c:otherwise>
			           		 </c:choose>
	                    </div>
	                    
	                </div>
	                
	            </div>
	            
	            
            </div>
          	</c:forEach>
        
	       	  <nav aria-label="Page navigation example ">
				  <ul class="pagination " style="justify-content: center;">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true" style="color: black;">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">1</a></li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
				    <li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
				    <li class="page-item" style="color: black;">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true" style="color: black;">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			
			<div class="row text-secondary text-opacity-75" style="font-size: xx-small; font-family: system-ui; margin-left: 0px;">
	            <div class="row" >itelier 광고&포인트</div>
	            <div class="row">itelier은 전자결제서비스 제공자 및 통신판매중개자이며 </div>
	            <div class="row">통신판매의 당사자가 아닙니다 상품, 상품정보 및 거래에 관한 </div>
	            <div class="row">의무와 책임은 판매자에게 있습니다<br><br></div>
	            <div class="row">itelier 사업자 정보</div>
	            <div class="row">(주) WHM</div>
				<div class="row">대표이사 : 신혜진</div>
				<div class="row">서울특별시 특별구 특별로 특별길 12</div>
				<div class="row">사업자 등록번호 : 107-99-99999</div>
				<div class="row">통신판매업신고 : 2022-서울마포-9999</div>
				</span>
				<span  class="text-sm text-secondary opacity-50">
				<div class="row">atelier는 통신판매중개자이며 통신판매의 당사자가 아닙니다.</div>
				<div class="row">따라서 atelier는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.<br><br><br></div>
				<div class="row">Copyright @ 2022Baxkpaxkr All right reserved.</div>
            </div>
    </div>          	
</div>
	
 
  
  
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>