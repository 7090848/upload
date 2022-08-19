<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
<title>제안 자세히 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 

<script type="text/javascript">
function test1(){
	//ecma5
	var boardNo = document.getElementById("formid").value;
	//alert(boardNo);
	console.log(boardNo);
	//AJAX : 자바스크립트로 리퀘스트한다...
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			//client side rendering => hell...
			//AJAX는 restapi를 호출한다뿐 ... 단 필연적으로 client side rendering이 필요함..
			var resultBox = document.getElementById("resultBox");
			resultBox.innerHTML = "";
			
			var titleBox = document.createElement("span");
			titleBox.innerText = result.data.boardVo.board_title;
			titleBox.style.color = "blue";
			resultBox.appendChild(titleBox);
			
			var nicknameBox = document.createElement("span");
			nicknameBox.innerText = result.data.memberVo.member_nick;
			nicknameBox.style.color = "red";
			resultBox.appendChild(nicknameBox);
			
		}
	};
	
	/* xhr.open("get" , "../testapi/test5?board_no=" + boardNo); //리퀘스트 세팅..
	xhr.send(); //AJAX로 리퀘스트함.. */
}

</script>

</head>
<body>
  <div class="container-fluid px-3">
       <form id="formid" name="formname">
       	<input type ="hidden" value="1" id ="input1">
       	<input type ="hidden" value="2" id ="input2">
       	<button type= "button" onclick="test1()"></button>
       </form>
</div> 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>