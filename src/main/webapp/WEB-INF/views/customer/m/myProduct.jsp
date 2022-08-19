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



//<button type="button" onclick="productList1(typeTime,typeTimeE,typeTimeN)"
	//판매중 확인하기
	function productList1(abc,def,ghiYn){
		
	if(def===undefined){
		var	testType="";
	}else{
		
		var testType = def.value;
	}

	
	if(ghiYn===undefined){
		var	typeYn="";
	}else{
		
		var typeYn =ghiYn.value;
	}

	
		
		var typeNumber = abc.value;
	
		var formData = new FormData();
		//	formData.append('username', 'Chris');
		//formData.get('username');
		

		console.log('test:',typeNumber);
		console.log('testType:',testType);
		console.log('typeYn:',typeYn);
		
		//alert(customerNo);
		
		//AJAX : 자바스크립트로 리퀘스트한다...
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function(){
		
		
			
			if(xhr.readyState ==4 && xhr.status ==200){
				var result =JSON.parse(xhr.responseText); // = 응답 결과 텍스트(JSON)
				
				//AJAX는 restapi를 호출한다뿐... 단 필연적으로 client side rendering이 필요함.
				
	

				//상품 출력
				
				
				var resultBox = document.getElementById("resultBox");
				resultBox.innerHTML =""; 
				//검색창
		
				

				
				
				var divSearch = document.createElement("div");
					divSearch.classList.add('sticky-top');
					divSearch.classList.add('row');
					divSearch.classList.add('py-3');
					divSearch.classList.add('bg-warning');
					divSearch.classList.add('bg-opacity-25');
					
				
				var divSearchContainer = document.createElement("div");	
					divSearchContainer.classList.add('container-fluid');
					
					var FormdivinputBox  = document.createElement("form");
					FormdivinputBox.name = "searchW";
				
					var divinputBox = document.createElement("input");
					divinputBox.id = "dib";
					divinputBox.name = "dib";
					divinputBox.type="text";
					divinputBox.value="";
					
					FormdivinputBox.appendChild(divinputBox);		
					
					var divinputBox2 = document.createElement("input");
					
					divinputBox2.id = "dib2";
					divinputBox2.name = "dib2";
					divinputBox2.type="hidden";
					divinputBox2.value=result.number;
					
					
					FormdivinputBox.appendChild(divinputBox2);
					
					
					var divinputBox3 = document.createElement("input");
					
					divinputBox3.id = "dib3";
					divinputBox3.name = "dib3";
					divinputBox3.type="hidden";
					divinputBox3.value=result.Yn;
					
					
					FormdivinputBox.appendChild(divinputBox3);
					
					var textButtonBox = document.createElement("button");
					textButtonBox.classList.add("text-decoration-none");
					textButtonBox.classList.add("text-dark");
					textButtonBox.classList.add("fw-bold");
					textButtonBox.classList.add("fs-6");
					textButtonBox.type ="button";
					textButtonBox.innerText="검색";
					textButtonBox.style="pink";
					textButtonBox.setAttribute("onclick","productList1(dib2,dib,dib3)");	
					
					FormdivinputBox.appendChild(textButtonBox);
			
					
				divSearchContainer.appendChild(FormdivinputBox);	
				divSearch.appendChild(divSearchContainer);	
				resultBox.appendChild(divSearch);
					for(e of result.data){
						
					 	var rowBox = document.createElement("div");
					 		rowBox.classList.add('row');
					 		rowBox.classList.add('py-2');
					 		
					 	
					 	var colBox = document.createElement("div");
					 		colBox.classList.add('col-2');	
					 		rowBox.appendChild(colBox);
					 		
					 	var colBox2 = document.createElement("div");
					 		colBox2.classList.add('col-6');	
					 		colBox2.classList.add('text-decoration-none');
					 		colBox2.classList.add('text-dark');
					 		colBox2.classList.add('fw-bold');
					 		colBox2.classList.add('fs-6');
					 		
					 		
					 	var colBox3 = document.createElement("div");
					 		colBox3.classList.add('col');	
					 		colBox3.classList.add('py-2');
					 		
					 		colBox3.style.margin="auto";
					 		
					
		               	
		           		var nameFormBox =  document.createElement("form");
		           			nameFormBox.id ="formValue";
		           			nameFormBox.name ="formValue1";
		           			colBox2.appendChild(nameFormBox);
		           			
		                var nameInputBox = document.createElement("input");	
		                	nameInputBox.id = "nameValue";
		                	nameInputBox.name = "nameValue1";
		                	nameInputBox.value= e.product_no;
		                	nameInputBox.type="hidden";
		                	
		                	nameFormBox.appendChild(nameInputBox);
		                	
		                    var nameButtonBox =  document.createElement("button");
					 		nameButtonBox.classList.add("btn");
					 		nameButtonBox.classList.add("btn-link");
					 		nameButtonBox.classList.add("text-dark");
					 		nameButtonBox.classList.add("text-decoration-none");
					 		nameButtonBox.type = "button";
					 		nameButtonBox.setAttribute("onclick","detailProduct(nameValue1)");
					 		nameButtonBox.id = "nameButton";
					 		nameButtonBox.name = "nameButton";
					 		nameButtonBox.setAttribute("data-bs-toggle","modal"); 
					 		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2");
					 	
		 		
					 		nameFormBox.appendChild(nameButtonBox);		
					 		
							 
						 	
							 var nameBox =  document.createElement("span");
							 	
								
			                	nameBox.innerText ="이름 : " + e.product_name;     		                
			                	
			                	nameButtonBox.appendChild(nameBox);	
		                var brBox =  document.createElement("br"); 	
		               		colBox2.appendChild(brBox);
		                		
		                var priceBox =  document.createElement("span");
		                
		               		priceBox.innerText ="가격 : " + e.product_price;     	
		                	colBox2.appendChild(priceBox);
		                	
		                	rowBox.appendChild(colBox2);
		                	
		             if(result.number ==4) {
		                var buttonBox = document.createElement("button");
		                	//
		               	    buttonBox.classList.add("btn");
		                	buttonBox.classList.add("btn-outline-warning");
		                	buttonBox.classList.add("dropdown-toggle");
		                	buttonBox.type = "button";
		                	buttonBox.style.color="pink";
		                	
		                	buttonBox.dataset.bsToggle = "dropdown";
		                	buttonBox.innerText="상태";
		              
		                	
		                	
				
		         		var ulBox = document.createElement("ul");	
		         		
		         			ulBox.classList.add("dropdown-menu");	         			
		         			
		         		
		         		
		         		
			         		
						var liBox = document.createElement("li");
				         	
				         	liBox.classList.add("droptown-item");
				         	liBox.classList.add("text-dark");
				         	liBox.classList.add("fw-bold");
			         		liBox.classList.add("fs-6");
			         	
		
			         		
			         		ulBox.appendChild(liBox);
			         			
			         	var formBox =document.createElement("form");
			         		
			           		formBox.id = "productStatus";
			         		formBox.name= "productStatus"
			         			liBox.appendChild(formBox);
			         		
			         		
		         		var inputBox = document.createElement("input");
		         			inputBox.id = "product_confirm_s2";
		         			inputBox.name = "product_confirm_status_no2";
		         			inputBox.type="hidden";
		         			inputBox.value=4;
		         			
		         			formBox.appendChild(inputBox);
		         		
		         			
	
		         		var inputBoxH =	document.createElement("input");
		         			inputBoxH.id = "product_n2";
		         			inputBoxH.name = "product_no2";
		         			inputBoxH.type="hidden";
		         			inputBoxH.value =e.product_no;
		         			
		         			formBox.appendChild(inputBoxH);
						var inputBoxHH =document.createElement("input");
							inputBoxHH.id = "product_c2";
		         			inputBoxHH.name = "product_confirm2";
		         			inputBoxHH.type="hidden";
		         			inputBoxHH.value ='n';
		         			
		         			formBox.appendChild(inputBoxHH);
		         		
		         		var inputBoxHHH =	document.createElement("input");
			         		inputBoxHHH.id = "product_yn2";
			         		inputBoxHHH.name = "product_Yn2";
			         		inputBoxHHH.type="hidden";
			         		inputBoxHHH.value =result.Yn;
		         			
			         		formBox.appendChild(inputBoxHHH);		
		         			
			         	var buttonBox1 = document.createElement("button");
			         		buttonBox1.id="smBtn"
			         		buttonBox1.type="button";
			         		buttonBox1.innerText="일시정지";
			         		buttonBox1.setAttribute("onclick","test(product_no2,product_confirm2,product_confirm_status_no2,product_Yn2)");
			         		
			         		
		         			formBox.appendChild(buttonBox1);
		         			
	       		///////////
			         	var liBox2 = document.createElement("li");
				         	
				         	liBox2.classList.add("droptown-item");
				         	liBox2.classList.add("text-dark");
				         	liBox2.classList.add("fw-bold");
			         		liBox2.classList.add("fs-6");
			         	
		
			         		
			         		ulBox.appendChild(liBox2);
			         			
			         	var formBox2 =document.createElement("form");
			         		
			           		formBox2.id = "productStatus2";
			         		formBox2.name= "productStatus2"
			         			liBox2.appendChild(formBox2);
			         		
			         		
		         		var inputBox2 = document.createElement("input");
		         			inputBox2.id = "product_confirm_s";
		         			inputBox2.name = "product_confirm_status_no";
		         			inputBox2.type="hidden";
		         			inputBox2.value=4;
		         			
		         			formBox2.appendChild(inputBox2);
		         			
	
		         		var inputBoxH2 =	document.createElement("input");
		         			inputBoxH2.id = "product_n";
		         			inputBoxH2.name = "product_no";
		         			inputBoxH2.type="hidden";
		         			inputBoxH2.value =e.product_no;
		         			
		         			formBox2.appendChild(inputBoxH2);
						var inputBoxHH2 =	document.createElement("input");
							inputBoxHH2.id = "product_c";
		         			inputBoxHH2.name = "product_confirm";
		         			inputBoxHH2.type="hidden";
		         			inputBoxHH2.value ='y';
		         			
		         			formBox2.appendChild(inputBoxHH2);
		         		
		         		var inputBoxHHH2 =	document.createElement("input");
			         		inputBoxHHH2.id = "product_yn";
			         		inputBoxHHH2.name = "product_Yn";
			         		inputBoxHHH2.type="hidden";
			         		inputBoxHHH2.value =result.Yn;
		         			
		         			formBox2.appendChild(inputBoxHHH2);	
		         			
			         	var buttonBox2 = document.createElement("button");
			         		buttonBox2.id="smBtn2"
			         		buttonBox2.type="button";
			         		buttonBox2.innerText="판매중";
			         		buttonBox2.setAttribute("onclick","test(product_no,product_confirm,product_confirm_status_no,product_Yn)");
			         		
			         		
		         			formBox2.appendChild(buttonBox2);
		         			
		         			colBox3.appendChild(buttonBox); 
		         			colBox3.appendChild(ulBox);     
		             }
		                	rowBox.appendChild(colBox3);
		                	
		                //일단 여기까지가 세팅
		                	 
		                	
		                var lineBox = document.createElement("hr");
		                	lineBox.style.outline="1px solid";
		                	lineBox.style.borderTop="1px solid";
		                	lineBox.style.color="pink";
		                	
		                	
		                	resultBox.appendChild(rowBox);
		                	resultBox.appendChild(lineBox);
		                	

					 }
					 
			}
		};
		
		
		xhr.open("post" , "../productTable"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("type=" + typeNumber + "&productName=" + testType +"&productYn=" + typeYn);
	}
	

	
	function test(a, b,c,d){
	
		var aa = a.value;
		var bb= b.value;
		var cc=c;
		var dd= d;
		var xhr = new XMLHttpRequest();
	
		
		console.log("aa의 값 ",aa);
		console.log("bb의 값 ",bb);
		console.log("cc의 값 ",cc);
		console.log("dd의 값 ",dd);
		
	                //일단 여기까지가 세팅
	                	  
	    	xhr.onreadystatechange = function(){
			if(xhr.readyState ==4 && xhr.status ==200){
				productList1(cc,undefined,dd);        	
			}
	                };
	             
	                
	
	                
	                
		xhr.open("post" , "../updateProductStatus"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productNo=" + aa + "&productYn=" + bb);
	}
	

	

	//모달로 상품 추가하기 
	function insertProduct(){
		//ecma5
		var productN = document.getElementById("modalPN").value;
		var productP = document.getElementById("modalPP").value;
		var productD = document.getElementById("modalPD").value;
		var productPP = document.getElementById("modalPPP").value;
		var productCN = document.getElementById("modalSelect").value;
		var test =document.getElementById("typeStop");
		console.log('productN',productN);
		console.log('productP',productP);
		console.log('productD',productD);
		console.log('productPP',productPP);
		console.log('productCN',productCN);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
			
				productList1(test,typeStopE,typeStopN);
				
			}
		};
		
        
		xhr.open("post" , "../productModifyProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productName=" + productN + "&productPrice=" + productP+ "&productDesciption=" + productD+ "&productPostPrice=" + productPP+ "&productCategoryNo=" + productCN);
		

	}
	

	function detailProduct(vv){
	/* 	nameButtonBox.setAttribute("data-bs-toggle","modal"); 
 		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2"); */
		var v =vv.value;
		//var v= document.getElementById('nameValue').value;
		console.log("v",v);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				
				var result =JSON.parse(xhr.responseText);
			
			
        		
		   		var detailProductNo  = document.getElementById("detailProductNo");
		   		detailProductNo.innerHTML ="";
		   		
		   		detailProductNo.classList.add('row');
		   		detailProductNo.classList.add('py-2');
		   		detailProductNo.classList.add('mb-2');
		   		detailProductNo.classList.add('border');
		   		detailProductNo.innerText="상품번호 : " + result.dat.product_no;
		   		
		   		
		   		var detailProductName  = document.getElementById("detailProductName");
		   		detailProductName.innerHTML ="";
		   		
		   		detailProductName.classList.add('row');
		   		detailProductName.classList.add('py-2');
		   		detailProductName.classList.add('mb-2');
		   		detailProductName.classList.add('border');
		   		detailProductName.innerText="상품이름 : " + result.dat.product_name;
		   		
		   		var detailProductdescription  = document.getElementById("detailProductdescription");
		   		detailProductdescription.innerHTML ="";
		   		
		   		detailProductdescription.classList.add('row');
		   		detailProductdescription.classList.add('py-3');
		   		detailProductdescription.classList.add('mb-2');
		   		detailProductdescription.classList.add('border');
		   		
		   		detailProductdescription.innerText="상품상세 : " + result.dat.product_description;
					
				var modifyDivBox = document.getElementById("myProductModify");
				modifyDivBox.innerHTML ="";
				modifyDivBox.classList.add("row");
				
				
				var modifyABox = document.createElement('a');
				modifyABox.id ="mody";				
				modifyABox.setAttribute("href","./productModify?productNo="+result.dat.product_no); 

				modifyABox.innerText="상품수정하기";
				modifyDivBox.appendChild(modifyABox);
				
				
				var myProductReviewList  =  document.getElementById("myProductReviewList");
				myProductReviewList.innerHTML ="";
				myProductReviewList.classList.add("row");
				
				var myProductReviewListA = document.createElement('a');
				myProductReviewListA.id ="mody2";
				
				myProductReviewListA.setAttribute("href","./myProductReviewList?productNo="+result.dat.product_no); 

				myProductReviewListA.innerText="상품리뷰보기";
				myProductReviewList.appendChild(myProductReviewListA);
				
				
				var myProductAskList = document.getElementById("myProductAskList");
				myProductAskList.innerHTML ="";
				var myProductAskListA = document.createElement('a');
				myProductAskListA.id ="mody3";
				
				myProductAskListA.setAttribute("href","././myProductAskList?productNo="+result.dat.product_no); 

				myProductAskListA.innerText="상품문의보기";
				myProductAskList.appendChild(myProductAskListA);
				
				
				
			}
		};
		
        
		xhr.open("post" , "../test"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productNo=" + v );
		
	
		
	}
	/* toggle","modal"); 
		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2" */

		/* 		  $(document).ready(function() {
					    function action() {
					      var form = $('#pokeform');
					     console.log("작동되낭7");
					      $('#staticBackdrop2').data('target');
					      console.log('form', form.serializeArray());
					    }
					    $('#nameButton').click(action);
					  });

				


 */
</script>

</head>
<body>	
	

	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
		
	

		
				
			<div class="row py-3">
				<div class="col-4 " style="  text-align: center; border-right: solid; border-right-color:pink;">
				<form name = "act">
				<input type="hidden" value="4" id ="typeSale" name="acti">
				<input type="hidden" value="" id ="typeSaleE" name="actiE">
				<input type="hidden" value="y" id ="typeSaleY" name="actiY">
				<button type="button" onclick="productList1(typeSale,typeSaleE,typeSaleY)" class="text-decoration-none text-dark fw-bold fs-6">판매중</button>
				
				</form>
				</div>
				
				<div class="col-4" style="  text-align: center; border-right: solid;  border-right-color:pink;">
				<form name = "act">
				<input type="hidden" value="4" id ="typeTime">
				<input type="hidden" value="" id ="typeTimeE">
				<input type="hidden" value="n" id ="typeTimeN">
				<button id = "asd"type="button" onclick="productList1(typeTime,typeTimeE,typeTimeN)" class="text-decoration-none text-dark fw-bold fs-6">일시정지 </button>
				
				</form>
				</div>
				
				<div class="col-4" style="  text-align: center; ">
				<form name = "act">
				<input type="hidden" value="1" id ="typeStop">
				<input type="hidden" value="" id ="typeStopE">
				<input type="hidden" value="" id ="typeStopN">
				<button type="button" onclick="productList1(typeStop,typeStopE,typeStopN)" class="text-decoration-none text-dark fw-bold fs-6">정지 </button>
				
				</form>
				</div>

			</div>	
			<hr style="outline : solid 1px pink;"/>
			
		
			 	
			<div class="row" style="height:30px;"></div>
				<div id ="resultBox">
				</div>
	
			
<div class="row" style="height:110px;"></div>




</div>
	<footer class="fixed-bottom">
		<div class="container-fluid">
			<div class="row">
				<div class= "col"></div>
				<div class= "col"></div>
				<div class= "col-4 px-3">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  상품등록
</button>
					

					
				</div>
			</div>
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
				
 
</footer>
	
	
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">${storeInfo.getStore_name() }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">

	
	<div class="container-fluid">
		
	
		<form id = "modalForm" name = "modalForm" >	
			<div class="row py-3">	
				<div class="mb-3">
		    	<input type="text" class="form-control" name = "product_name" id="modalPN" aria-describedby="emailHelp" placeholder="상품 이름을 입력해주세요">
				</div>
			</div>
			<div class="row py-2 border border-1"> 
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_price" id="modalPP" aria-describedby="emailHelp" placeholder="가격">
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">		
					 <textarea class="form-control"name = "product_description" placeholder="상세정보를 입력해주세요!" id="modalPD" rows="10"></textarea>
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_post_price" id="modalPPP" aria-describedby="emailHelp" placeholder="배송비입력">
					</div>
				</div>	
				<div class="row mb-4">
					
						
						
						<select id ="modalSelect" name ="product_category_no" class="form-select btn-outline-warning" size="3"  aria-label="size 3 select example" style="color:pink;">
						
						  <option selected>상품유형을 등록해주세요!</option>
						  <option value="1">디저트</option>
						  <option value="2">음료</option>
						  <option value="3">의류</option>
						  <option value="4">악세사리</option>
						  <option value="5">꽃</option>
						  <option value="6">캔들</option>
						  <option value="7">가구</option>
						  <option value="8">인형</option> 
						  <option value="9">문구</option>
						</select>
				</div>
				<div class="row mb-3"><input type="button" onclick="insertProduct()" class="btn btn-outline-warning" value="등록요청" data-bs-dismiss="modal" aria-label="Close"></div>
			</div>	
		</form>
	</div>
    
      </div>
    </div>
  </div>
</div>
 	
	<!--  -->

<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
    
           <h5 class="modal-title" id="staticBackdropLabel">${storeInfo.getStore_name() }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">

		<div class="container-fluid">

				<div id ="detailProductNo"></div>
				<div  id ="detailProductName"></div>			
				<div  id ="detailProductdescription"></div>
				<div id ="myProductModify"></div>
				<div id = "myProductReviewList"></div>				
				<div id = "myProductAskList"></div>
				</div>
			</div>	
	</div>
      </div>
    </div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>