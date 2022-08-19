<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.button-color{
background-color: pink;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function submit(){
	const formId = document.getElementById("formId");
	
	const idInput = document.getElementById("id");

	if(isChecked == false){
		alert("아이디 중복 확인을 하셔야됩니다.");
		idInput.focus();
		return;
	}
	
	
	if(idInput==""){
		alert("아이디를 입력하셔야합니다");
		idInput.focus();
		return;
	}
	

	
	const pwInput = document.getElementById("password");
	if(pwInput == ""){
		alert("비밀번호를 입력해주세요");
		return;
	}
	
	if(pwChecked == false){
		alert("비밀번호 확인을 하셔야됩니다.");
		
		return;
	}
	const nameInput = document.getElementById("name");
	if(nameInput == ""){
		alert("이름을 입력해주세요");
		return;
	}
	
	const busiInput = document.getElementById("business");
	if(busiInput == ""){
		alert("사업자번호를 입력해주세요");
		return;
	}
	
	const emailInput = document.getElementById("email");
	if(emailInput == ""){
		alert("이메일을 입력해주세요");
		return;
	}
	
	const agreeInput = document.getElementById("agree");
	if(agreeInput != 'Y'){
		alert("약관에 동의해주세요!");
		return;
	}
	formId.submit();
}

var isChecked = false;

var pwChecked = false;
function checkPw(){
	var pwValue = document.getElementById("password").value;
	var confirmValue = document.getElementById("passwordConfirm").value;
	
	
			
			//렌더링...및 추가 화면 로직...헬...
			var pwResult = document.getElementById("idResult");
			pwResult.innerHTML="";
			if(pwValue == confirmValue){
				pwChecked = true;
				pwResult.innerText = "비밀번호가 일치합니다.";
				pwResult.classList.remove("text-success");
				pwResult.classList.add("text-danger");
			}else{
				pwChecked =false;
				pwResult.innerText = "비밀번호가 일치하지 않습니다";
				pwResult.classList.remove("text-danger");
				pwResult.classList.add("text-success");
			}
}

function checkId(){
	var idValue = document.getElementById("id").value;
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			//렌더링...및 추가 화면 로직...헬...
			var idResult = document.getElementById("idResult");
			idResult.innerHTML="";
			if(result.name != null){
				isChecked = false;
				idResult.innerText = "이미 존재하는 아이디 입니다.";
				idResult.classList.remove("text-success");
				idResult.classList.add("text-danger");
			}else{
				isChecked = true;
				idResult.innerText = "사용 가능한 아이디 입니다.";
				idResult.classList.remove("text-danger");
				idResult.classList.add("text-success");
			}
			
		}
	}
	
	xhr.open("get" , "../checkId?name=" + idValue); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..		
	
}


</script>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>


	<div class="container-fluid">
	
		<div class="row py-2 my-1">
			<div class="col-3"></div>
			<div class="col">로고이미지</div>
			<div class="col-3"></div>
		</div>
		<form id="formId" action="../lg/registerProcess" method="post">
			<div class="row py-2 my-1 border border-1  border-warning">
				<input type="text" class="form-control py-2 my-2" name ="customer_no" id="id" placeholder="ID" onblur="checkId()">
				<div id="idResult"></div>
				<input type="password" class="form-control py-2 my-2" name ="customer_pw" id="password" placeholder="PW">
				<input type="password" class="form-control py-2 my-2" id="passwordConfirm" placeholder="PWConfirm" onblur="checkPw()" >
				<div id="pwResult"></div>
				<input type="text" class="form-control py-2 my-2" name ="customer_name"  id="name" placeholder="name">
				<input type="text" class="form-control py-2 my-2"name ="customer_business_number"  id="business" placeholder="BusinessNumber">
				<input type="email" class="form-control py-2 my-2"name ="customer_email" id="email" placeholder="email">
				<button type="button" onclick="emailConfirm()">email확인</button>
				<span>Modal 동의문</span>
				<input type="checkbox" class="form-check-input" id="agree" value="Y">약관에 동의합니다.
				<input type="button" class="form-control py-2 my-2" id="name" onclick ="submit()"value="가입하기">
			</div>
		</form>
	</div>
		
		
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>