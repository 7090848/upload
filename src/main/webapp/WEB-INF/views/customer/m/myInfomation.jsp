<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">


		//내 결제화면 modal로 구현.
	function payPage(){
	
		var customerNo = document.getElementById("customerNo").value;
	
		console.log("customerNo",customerNo);
		//AJAX : 자바스크립트로 리퀘스트한다...
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				//client side rendering => hell...
				//AJAX는 restapi를 호출한다뿐 ... 단 필연적으로 client side rendering이 필요함..
				var payPageResultBox = document.getElementById("payPageResultBox");
				payPageResultBox.innerHTML = "";
				
				
				console.log("시작");
			 	var titleBox = document.createElement("div");
				titleBox.classList.add("row");
				titleBox.classList.add("py-2");
				titleBox.classList.add("my-1");
				payPageResultBox.appendChild(titleBox);
				
				var titleSpanBox = document.createElement("span");
				titleSpanBox.classList.add("fs-5");
				titleSpanBox.classList.add("fw-bold");
				titleSpanBox.style.color="pink";
				if(result.customerWallet ==null){
					titleSpanBox.innerText = "입금 예정 : " + result.fail;
				}else{
					titleSpanBox.innerText="입급 예정 : " + result.centerBank.center_bank_saving_money;
				}
				titleBox.appendChild(titleSpanBox);
				
				var accountBox = document.createElement("div");
				titleBox.classList.add("row");
				titleBox.classList.add("py-2");
				titleBox.classList.add("my-1");
				payPageResultBox.appendChild(accountBox);
				

				var accountSpanBox = document.createElement("span");
				accountSpanBox.classList.add("fw-bold");
				if(result.customerWallet ==null){
					accountSpanBox.innerText = "주 통장 : " +result.fail;
				}else{
					accountSpanBox.innerText = "주 통장 : " + result.customerWallet.customer_wallet_bank_name + " " + result.customerWallet.customer_wallet_account;
				}
				accountBox.appendChild(accountSpanBox);
				
				
				var accountButtonBox = document.createElement("button");
				accountButtonBox.classList.add("btn");
				accountButtonBox.classList.add("btn-primary");
				accountButtonBox.type = "button";
				accountButtonBox.setAttribute("data-bs-toggle","collapse"); 
				accountButtonBox.setAttribute("data-bs-target","#accountCollapse");
				accountButtonBox.innerText = "계좌 설정";
				accountButtonBox.ariaExpanded="false";
				accountButtonBox.ariaControls="accountCollapse";
				
				accountBox.appendChild(accountButtonBox);
				
				
				
				
				var collapseResultBox = document.getElementById("collapseResultBox");
				collapseResultBox.innerHTML="";
				
				var inputNameRowBox = document.createElement("div");
				inputNameRowBox.classList.add("row");
				inputNameRowBox.classList.add("py-2");
				inputNameRowBox.classList.add("my-2");
				
				collapseResultBox.appendChild(inputNameRowBox);
				
				var formNameRowBox = document.createElement("form");
				formNameRowBox.name ="formBox";
				formNameRowBox.id = "formBox";
				
				inputNameRowBox.appendChild(formNameRowBox);
				
				var inputSelectColBox1 = document.createElement("select");
				inputSelectColBox1.classList.add("form-select");
				inputSelectColBox1.ariaLabel="Default select example";
				inputSelectColBox1.id = "selectInput";
				inputSelectColBox1.name = "selectInput";
				formNameRowBox.appendChild(inputSelectColBox1);
				
				
				var optionBox1 =  document.createElement("option");
				
				optionBox1.selected;
				optionBox1.innerText = "은행";
				inputSelectColBox1.appendChild(optionBox1);
				
				var optionBox2 =  document.createElement("option");
				
				optionBox2.value="신한";
				optionBox2.innerText ="신한";
				inputSelectColBox1.appendChild(optionBox2);
				
				var optionBox3 =  document.createElement("option");
				
				optionBox3.value="우리";
				optionBox3.innerText = "우리";
				inputSelectColBox1.appendChild(optionBox3);
				
				
				

				var inputNameRowBox2 = document.createElement("div");
				inputNameRowBox2.classList.add("row");
				inputNameRowBox2.classList.add("py-2");
				
				
				formNameRowBox.appendChild(inputNameRowBox2);
				
				var inputBox = document.createElement("input");
				inputBox.type="text";
				inputBox.id="accountId";
				inputBox.name="accountId";
				inputBox.setAttribute("placeholder","계좌번호를 입력해주세요");
				inputNameRowBox2.appendChild(inputBox);
				
				var inputHiddenBox = document.createElement("input");
				inputHiddenBox.type="hidden";
				inputHiddenBox.id="customerId";
				inputHiddenBox.name="customerId";
				inputHiddenBox.value = ${customer.customer_no};
				inputNameRowBox2.appendChild(inputHiddenBox);
				
				var inputButtonBox = document.createElement("button");
				
				if(result.customerWallet == null){
					inputButtonBox.type="button";
					inputButtonBox.setAttribute("onclick","insertAccount()");
					inputButtonBox.innerText="등록";
					inputButtonBox.setAttribute("data-bs-dismiss","modal");
					inputButtonBox.ariaLabel="Close";
					
					
				}else{
					inputButtonBox.type="button";
					inputButtonBox.setAttribute("onclick","updateAccount()");
					inputButtonBox.innerText="수정";
					inputButtonBox.setAttribute("data-bs-dismiss","modal");
					inputButtonBox.ariaLabel="Close";
				}
				
				inputNameRowBox2.appendChild(inputButtonBox);
				
				
				/* 
				var nicknameBox = document.createElement("span");
				nicknameBox.innerText = result.data.memberVo.member_nick;
				nicknameBox.style.color = "red";
				resultBox.appendChild(nicknameBox);
				
				
				
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
				  </div>
				</div> */ 
			}
		};
	

		xhr.open("post" , "../payPage"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo);
		

	
	}

		
	function insertAccount(){
		var customerNo = document.getElementById("customerId").value;
		var account = document.getElementById("accountId").value;
		var bank = document.getElementById("selectInput").value;
		
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				insertBank(result.wallet.customer_wallet_no);
				console.log("result.wallet.customer_wallet_no",result.wallet.customer_wallet_no)
			}
		};
		xhr.open("post" , "../insertAccount"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo + "&account=" + account + "&bank=" + bank);
		
		
	}
	
	
	
	function updateAccount(){
		var customerNo = document.getElementById("customerId").value;
		var account = document.getElementById("accountId").value;
		var bank = document.getElementById("selectInput").value;
		console.log(customerNo,account, bank );
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				payPage();
			}
		};
		xhr.open("post" , "../updateAccount"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo + "&account=" + account + "&bank=" + bank);
		
		
	}
	
	
	function insertBank(a){
		console.log("아예 안되나?");
		var walletNo = a;
		console.log("walletNo",walletNo);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				payPage();
			}
		};
		xhr.open("post" , "../insertBank"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("walletNo=" +walletNo);
		
		
	}

	

	
	
	
	
	
	
</script>
<style type="text/css">
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

</head>
<body>	
	
	
	
	
	
	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
		
		
	
		
		
		<div class="row py-3">
			<div class="col-3"><img src="../../resources/img/storemain.jpg" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
			width="75" height="75"></div>
			<div class="col ">
				<div class="row"  style="margin :auto;"> <span class="">환영합니다!</span></div>
				<div class="row"><span class="align-bottom fs-5 fw-bold">${temp.store_name}</span></div>
			</div>
		</div>
		<hr style="outline : solid 1px pink;"/>
		<div class="row my-3 ">
					<div class="col">
						<c:choose>
							<c:when test="${temp.store_tier_no==1 }">
							 <a class="navbar-brand" href="./myRank">
     						 <img src="../../resources/img/bronze.JPG"  alt="..." width="30" height="30">
   							 </a>	    현재 포인트: ${temp.store_total_sales_amount}		  
							</c:when>
							<c:when test="${temp.store_tier_no==2 }">
							 <a class="navbar-brand" href="./myRank">
     						 <img src="../../resources/img/silver.JPG"  alt="..." width="30" height="30">
   							 </a>	    현재 포인트: ${temp.store_total_sales_amount}	
							</c:when>
							<c:when test="${temp.store_tier_no ==3}">
							 <a class="navbar-brand" href="./myRank">
     						 <img src="../../resources/img/gold.JPG"  alt="..." width="30" height="30">
   							 </a>	    현재 포인트: ${temp.store_total_sales_amount}	
							</c:when><c:otherwise>
							 <a class="navbar-brand" href="./myRank">
     						 <img src="../../resources/img/pla.JPG"  alt="..." width="30" height="30">
   							 </a>	    현재 포인트: ${temp.store_total_sales_amount}	
							</c:otherwise>
						</c:choose>
					</div>
					
			</div>
							
	<hr style="outline : solid 1px pink;"/>
	
	<div class="row">
		<span class="fs-6 fw-bold text-secondary ">상점 관리</span>
	</div>			
	<div class="row  p-2">
		
		<div class="col"><a href="./profileModify?customerNo=${customer.customer_no}" class="text-decoration-none text-dark fw-bold fs-6">상점 수정하기</a></div>
	
	</div>
	<div class="row  p-2 my-2">
		
		<div class="col">
			<a href="./myProductReviewAllList?storeNo=${temp.store_no}" class="text-decoration-none text-dark fw-bold fs-6">전체상품 문의</a>
		</div>
	</div>
	<div class="row  p-2 my-2">
		
		<div class="col">
			<a href="./myProductAskAllList?storeNo=${temp.store_no}" class="text-decoration-none text-dark fw-bold fs-6">전체상품 후기</a>
		</div>
	</div>
	<div class="row  p-2 my-1">
		
		<div class="col">
			<a href="./myAskCenter?storeNo=${temp.store_no}" class="text-decoration-none text-dark fw-bold fs-6">고객센터</a>
		</div>
	</div>

<hr style="outline : solid 1px pink;"/>	


	<div class="row">
		<span class="fs-6 fw-bold text-secondary ">기타 관리</span>
	</div>			
	<div class="row  p-2">
		<input type ="hidden" value ="${customer.customer_no}" id = "customerNo">
		<button type = "button" onclick ="payPage()" data-bs-toggle="modal" data-bs-target="#payModal">내 계좌관리</button>
		
	</div>
	<div class="row  p-2 my-2">
		
		<div class="col">
			<a href="./myProductReviewAllList?storeNo=${temp.store_no}" class="text-decoration-none text-dark fw-bold fs-6">출금 관리</a>
		</div>
	</div>

	<div class="row  p-2 my-1">
		
		<div class="col">
			<a href="./myAskCenter?storeNo=${temp.store_no}" class="text-decoration-none text-dark fw-bold fs-6">고객센터</a>
		</div>
	</div>




	<div class="row">
		
		<a class="btn btn-outline-warning" href="../lg/logoutProcess" role="button" style="color:PINK;">로그아웃</a>
	</div>
	
	<div class="row" style="height:80px;"></div>
</div>




	<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
		</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>




<!-- payPage Modal -->
<div class="modal fade" id="payModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
           <h5 class="modal-title" id="staticBackdropLabel" style="text:pink;">내 결제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


	
		<div class="container-fluid">
			<div id="payPageResultBox"></div>
					
				
			<div class="collapse" id="accountCollapse">
			  <div class="card card-body">
			   <div class="container-fluid">
			   	<div id="collapseResultBox"></div>
			   	<div class = "row" style="height:40px;"></div>
			   </div>
			  </div>
			</div>
			
				<div class = "row" style="height:180px;"></div>			
		</div>
		
			</div>	
	</div>
      </div>
    </div>







</body>
</html>