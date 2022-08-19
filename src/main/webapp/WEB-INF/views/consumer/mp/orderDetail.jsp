<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script>

function refreshCommentList(){
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var commentListBox = document.getElementById("commentList");
				commentListBox.innerHTML = "";
				
				for(commentData of jsonObj.data){
					
					var commentRowBox = document.createElement("div");
					commentRowBox.classList.add("row");
					commentRowBox.classList.add("commentRow");
					
					var col1 = document.createElement("div");
					col1.classList.add("col");
					commentRowBox.appendChild(col1);
					
					var innerRow1 = document.createElement("div");
					innerRow1.classList.add("row");
					col1.appendChild(innerRow1);
					
					var nicknameBox = document.createElement("div");
					nicknameBox.classList.add("col-2");
					nicknameBox.classList.add("text-secondary");
					nicknameBox.classList.add("bg-black");
					nicknameBox.innerText = commentData.memberVo.member_nick; //값 세팅..
					innerRow1.appendChild(nicknameBox);
					
					var contentBox = document.createElement("div");
					contentBox.classList.add("col-6");
					contentBox.classList.add("bg-primary");
					contentBox.classList.add("commentContent"); //내가 사용할 녀석..
					contentBox.innerText = commentData.commentVo.comment_content;
					innerRow1.appendChild(contentBox);
					
					var dateBox = document.createElement("div");
					dateBox.classList.add("col-2");
					dateBox.innerText = commentData.commentVo.comment_writedate;
					innerRow1.appendChild(dateBox);
					
					
					
					var innerRow2 = document.createElement("div");
					innerRow2.classList.add("row");
					col1.appendChild(innerRow2);
					
					var updateColBox = document.createElement("div");
					updateColBox.classList.add("col");
					updateColBox.classList.add("updateCol"); // << 이건 css용 아님...
					innerRow2.appendChild(updateColBox);
					
					commentListBox.appendChild(commentRowBox);
					
				}
				
			}
		}
		
		xhr.open("get" , "./?board_no=" + boardNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
		
	}
</script>
</head>
<body>
	
	<div class="row">
			<div id="commentList" class="col"><!-- 댓글 리스트 -->
				<div class="row"><!-- 댓글 하나 -->
					<div class="col">
						<div class="row">
							<div class="col text-secondary bg-black">티모</div>
							<div class="col-6 bg-primary">안녕하세요</div>
							<div class="col">22.2.2</div>
						</div>
						<div class="row"><!-- 수정 box.. -->
							<div class="col updateCol"></div>
						</div>
					</div>
				</div>
			</div>
		</div> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>