<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
</style>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>
<script src="https://code.jquery.com/jquery-3.5.0.js" ></script>

<script type="text/javascript" >


	//주문 전체 페이지 출력 F
	function totalOrder(inputValue){
		
		var Value = inputValue.value;
		console.log(Value);
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
			xhr.onreadystatechange = function(){
			
			
				if(xhr.readyState ==4 && xhr.status ==200){
					var result2 =JSON.parse(xhr.responseText);
					
					
					var resultBox = document.getElementById("resultBox");
					resultBox.innerHTML =""; 
				
					
					for(e of result2.restOrderTotal){
						
						
					var divMainBox = document.createElement('div');
						divMainBox.classList.add('row');
						divMainBox.classList.add('py-2');
						divMainBox.classList.add('my-1');
						
						
					resultBox.appendChild(divMainBox);
					
					divColBox1 = document.createElement('div');
						divColBox1.classList.add('col');
						divColBox1.classList.add('py-2');
						divColBox1.classList.add('my-1');
					divMainBox.appendChild(divColBox1);	
				 	var spanBox1 = document.createElement('span');
					spanBox1.innerText=  e.restarrOrderList.order_no;
					divColBox1.appendChild(spanBox1);
					
					divColBox2 = document.createElement('div');
						divColBox2.classList.add('col');
						divColBox2.classList.add('py-2');
						divColBox2.classList.add('my-1');
					divMainBox.appendChild(divColBox2);	
				
					var col2FormBox =   document.createElement('form');
					col2FormBox.id ="FormBox";
					col2FormBox.name= "FormBox";
					divColBox2.appendChild(col2FormBox);
					var col2InputBox =  document.createElement('input');
					col2InputBox.type= "hidden";
					col2InputBox.value =e.restarrOrderList.order_no;
					col2InputBox.name="col2HiddenValue";
					col2InputBox.id="col2HiddenValue";
					col2FormBox.appendChild(col2InputBox);
					var col2ButtonBox =  document.createElement('button');
					col2ButtonBox.type = "button";
					col2ButtonBox.setAttribute("onclick","detailOrder(col2HiddenValue)");
					col2ButtonBox.classList.add("btn");
					col2ButtonBox.classList.add("btn-outline-warning");
					col2ButtonBox.setAttribute("data-bs-toggle","modal"); 
					col2ButtonBox.setAttribute("data-bs-target","#Backdrop1");
					col2FormBox.appendChild(col2ButtonBox);
					
					var spanBox2 = document.createElement('span');
					spanBox2.innerText=  e.restnick.product_name;
					
					col2ButtonBox.appendChild(spanBox2);
					
					
					
					divColBox3 = document.createElement('div');
						divColBox3.classList.add('col');
						divColBox3.classList.add('py-2');
						divColBox3.classList.add('my-1');
					divMainBox.appendChild(divColBox3);	
					var spanBox3 = document.createElement('span');
					spanBox3.innerText=  e.restarrOrderList.order_delivery_status;
					divColBox3.appendChild(spanBox3);
					 
			
				  	
	                var lineBox = document.createElement("hr");
	                	lineBox.style.outline="1px solid";
	                	lineBox.style.borderTop="1px solid";
	                	lineBox.style.color="pink";
			
	                	divMainBox.appendChild(lineBox);
					}
	
				}

			};


		xhr.open("post" , "../OrderStatus"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("orderStatus=" + Value);
			
			
		}	
	

	
	
	function detailOrder(a){
		
			var value =a.value;
			//var v= document.getElementById('nameValue').value;
			console.log("value",value);
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					
					
					var result =JSON.parse(xhr.responseText);
				
					//상품 이름 출력
			   		var detailOrderName  = document.getElementById("staticBackdropLabel");
			   		detailOrderName.innerHTML ="";
			   		detailOrderName.style.color="pink";
			   		detailOrderName.innerText=result.detail.Product.product_name;
			   		//상품 정보 출력
			   		modalResultBox = document.getElementById("modalResultBox");
			   		modalResultBox.innerHTML ="";
			   		
			   		
			   		modaldetailBox = document.createElement("div");
			   		modaldetailBox.classList.add("row");
			   		modaldetailBox.classList.add("py-2");
			   		modaldetailBox.classList.add("my-1");
			   		modaldetailBox.innerText=" 상세정보"
			   		modaldetailBox.style.color = "pink";
			   		 
			   		modalResultBox.appendChild(modaldetailBox);
			   		
			   		modaldivBox = document.createElement("div");
			   		modaldivBox.classList.add("row");
			   		modaldivBox.classList.add("py-2");
			   		modaldivBox.classList.add("my-1");
			   		
			   		modalResultBox.appendChild(modaldivBox);
			   		
			   		modalspanNameBox = document.createElement("span");
			   		modalspanNameBox.classList.add('fs-6');
			   		modalspanNameBox.classList.add('fw-bold');
			   		modalspanNameBox.innerText="상품 명 : "+result.detail.Product.product_name;
			   	
			   		modaldivBox.appendChild(modalspanNameBox);
			   		
			   		modalspanCountBox = document.createElement("span");
			   		modalspanCountBox.classList.add('fs-6');
			   		modalspanCountBox.classList.add('fw-bold');
			   		modalspanCountBox.innerText="상품 갯수 : "+result.detail.Order.order_product_count;
			   	
			   		modaldivBox.appendChild(modalspanCountBox);
			   		
	                var lineBox = document.createElement("hr");
	                	lineBox.style.outline="1px solid";
	                	lineBox.style.borderTop="1px solid";
	                	lineBox.style.color="pink";
			
	                	modaldivBox.appendChild(lineBox);
			   		
                	modalspanConsumerBox = document.createElement("span");
                	modalspanConsumerBox.classList.add('fs-6');
                	modalspanConsumerBox.classList.add('fw-bold');
                	modalspanConsumerBox.innerText="구매자 : "+ result.detail.consumerAddress.address_name;
			   	
			   		modaldivBox.appendChild(modalspanConsumerBox);
			   		
	                
			   		modalspanAddressBox = document.createElement("span");
			   		modalspanAddressBox.classList.add('fs-6');
			   		modalspanAddressBox.classList.add('fw-bold');
			   		modalspanAddressBox.innerText="배송지  : "+result.detail.consumerAddress.address_street_addr;
			   		 
			   		modaldivBox.appendChild(modalspanAddressBox);
				
			   		modalspanDetailAddressBox = document.createElement("span");
			   		modalspanDetailAddressBox.classList.add('fs-6');
			   		modalspanDetailAddressBox.classList.add('fw-bold');
			   		modalspanDetailAddressBox.innerText="상세주소  : "+result.detail.consumerAddress.address_detail_addr;
			   		 
			   		modaldivBox.appendChild(modalspanDetailAddressBox);

			   		modalspanPhoneBox = document.createElement("span");
			   		modalspanPhoneBox.classList.add('fs-6');
			   		modalspanPhoneBox.classList.add('fw-bold');
			   		modalspanPhoneBox.innerText="연락처  : "+result.detail.consumerAddress.address_phone;
			   		 
			   		modaldivBox.appendChild(modalspanPhoneBox);
			   		
			   		

			   		modalspanMessageBox = document.createElement("span");
			   		modalspanMessageBox.classList.add('fs-6');
			   		modalspanMessageBox.classList.add('fw-bold');
			   		modalspanMessageBox.innerText="남긴 말  : "+result.detail.consumerAddress.address_message;
			   		 
			   		modaldivBox.appendChild(modalspanMessageBox);
			   		
			   		
			   		
	                var lineBox2 = document.createElement("hr");
	                	lineBox2.style.outline="1px solid";
	                	lineBox2.style.borderTop="1px solid";
	                	lineBox2.style.color="pink";
			
	                	modaldivBox.appendChild(lineBox2);
			   		
			 	
	                
                	modalStatusBox = document.createElement("span");
                	modalStatusBox.classList.add('fs-6');
                	modalStatusBox.classList.add('fw-bold');
                	modalStatusBox.innerText="주문 상태 : "+result.detail.Order.order_complete_status;
			   		 
                	modaldivBox.appendChild(modalStatusBox);
					
			  
			   		
			   		
				}
			};
			
	        
			xhr.open("post" , "../detailOrder"); //리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("orderNo=" + value );
			
		
			
		}
	

</script>

</head>
<body>	
	

	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
		
		<div class="row py-2">
				<div class="col-4 " style="  text-align: center; border-right: solid; border-right-color:pink;"></div>
				<div class="col-4 " style="  border-right: solid; border-right-color:pink; margin:auto;">
					<div class="btn-group"  style="margin:auto;">
			  <button type="button" class="btn btn-outline-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="color:pink;">배송상태</button>
			  <ul class="dropdown-menu">
			  
			    <li><input type ="hidden" id ="readyValue" value="READY"><button type="button" class="dropdown-item" onclick="totalOrder(readyValue)">배송준비</button></li>
			    <li><input type ="hidden" id ="ingValue" value="ING"><button type="button" class="dropdown-item" onclick="totalOrder(ingValue)">배송중</button></li>
			    <li><input type ="hidden" id ="comValue" value="COM"><button type="button" class="dropdown-item" onclick="totalOrder(comValue)">배송완료</button></li>
			    
			  </ul>
			</div></div>
				<div class="col-4"></div>
		</div>
		 	<hr style="outline:1px solid; borderTop:1px solid; color:pink;">
				<!-- TABLE을 출력하기 위한 DIV -->
				
		
				<div id ="resultBox">
				
				
				<c:forEach  items="${orderTotal}" var="order">
				<div class ="row py-2 my-1 ">
				
					<div class="col py-2 my-1"><span>번호 : ${order.arrOrderList.order_no}</span></div> 
					<div class="col py-2 my-1">
					<form name="formName" id="formId">
					<input type="hidden" value="${order.arrOrderList.order_no}" id = "hiddenValue">
					<button type="button" onclick="detailOrder(hiddenValue)" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#Backdrop1">
					<span>${order.nick.product_name}</span></button>
					</form>
					</div>
					
					<div class="col py-2 my-1"><span>${order.arrOrderList.order_delivery_status}</span></div>
				
				
					
					
					
				</div>
				<hr style="outline:1px solid; borderTop:1px solid; color:pink;">
				
				</c:forEach>
				
				
				</div>
		
	
			
<div class="row" style="height:110px;"></div>
</div>
<!-- Navi foot -->
	<footer class="fixed-bottom">
		<div class="container-fluid">
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
</footer>

<!-- Modal -->
<div class="modal fade" id="Backdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
           <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


	
		<div class="container-fluid">
			<div id="modalResultBox"></div>
							
		</div>
		
			</div>	
	</div>
      </div>
    </div>




	 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>