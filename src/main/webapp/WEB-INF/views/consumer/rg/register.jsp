<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>일반 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	// input 유효성 체크 변수
	let isCheck = true;
	
	function chkId() {
		let chkIdMsg = $("#chkId");
		let id = $("#consumer_id");
		
		// 아이디 공백체크
		if(id.val() == "" || id.val() == undefined) {
			chkIdMsg.text("필수 항목입니다.").addClass("text-danger");
			id.focus();
			isCheck = false;
		} else {
			chkIdMsg.text("").removeClass("text-danger");
			
			// 아이디 중복체크
			$.ajax({
				url: "./isExistsId?consumer_id=" + id.val(),
				method: "get",
				dataType: "json",
			}).done(function(jsonObj) {
				console.log("result : " + jsonObj.result);
				if(jsonObj.data) {
					chkIdMsg.text("이미 존재하는 아이디입니다.").removeClass("text-success").addClass("text-danger");
					isCheck = false;
				} else {
					chkIdMsg.text("사용 가능한 아이디입니다.").removeClass("text-danger").addClass("text-success");
					isCheck = true;
				}
			}).fail(function(xhr, msg) {
				console.log("xhr : " + xhr);
				console.log("msg : " + msg);
				isCheck = false;
			});
		}
	}

</script>
</head>
<body>
	<div class="container-fluid" style="margin: 0 auto;">
		<div class="row mt-3">
			<div class="col"></div>
		
			<div class="col-7">
				<div class="row my-3">
					<div class="col">
						<!-- <img class="img-fluid" src="../resources/img/doraemong.jpg"> -->
					</div>
				</div>
				<form action="./registerProcess" method="post">
					<div class="row my-3"><!-- 아이디 입력 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*아이디</span></div>					
							</div>
							<div class="row">
								<div class="col">
									<input type="text" class="input_val" name="consumer_id" id="consumer_id" placeholder="아이디를 입력해주세요" onblur="chkId();">
									<span id="chkId"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 비밀번호 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*비밀번호</span></div>
							</div>
							<div class="row">
								<div class="col"><input type="password" class="input_val" name="consumer_pw" id="consumer_pw" placeholder="비밀번호(영문+숫자+특수문자 8자 이상)"><span id="chkPw"></span></div>
							</div>
							<div class="row">
								<div class="col"><input type="password" class="input_val" id="consumer_chk_pw" placeholder="비밀번호 확인"><span id="chkPw2"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 이름 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*이름</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="text" class="input_val" name="consumer_name" id="consumer_name" placeholder="이름을 입력해주세요"><span id="chkName"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 닉네임 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*닉네임</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="text" class="input_val" name="consumer_nickname" id="consumer_nickname" placeholder="닉네임을 입력해주세요"><span id="chkNickname"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 전화번호 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*전화번호</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="text" class="input_val" name="consumer_phone" id="consumer_phone" placeholder="010-1234-5678"><span id="chkPhone"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 이메일 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*이메일</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="text" class="input_val" name="consumer_email" id="consumer_email" placeholder="이메일을 입력해주세요"><span id="chkEmail"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 생년월일 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*생년월일</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="date" class="input_val" name="consumer_birth" id="consumer_birth" placeholder="생년월일"><span id="chkBirth"></span></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 추천인코드 -->
						<div class="col">
							<div class="row">
								<div class="col"><span>*추천인코드</span></div>					
							</div>
							<div class="row">
								<div class="col"><input type="text" name="consumer_input_rec_code" id="consumer_input_rec_code" placeholder="선택사항"></div>
							</div>
						</div>
					</div>
					<div class="row my-3"><!-- 약관 동의 -->
						<div class="col">
							<div class="row">
								<div class="col">
									<input type="checkbox" name="" id=""><span>모두 동의합니다</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input type="checkbox" name="" id=""><span>만 14세 이상입니다.</span><br>
									<input type="checkbox" name="" id=""><span>이용약관 필수 동의</span><br>
									<input type="checkbox" name="" id=""><span>개인정보 수집 및 이용 동의</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-3">
						<div class="col"><input type="submit" value="회원가입하기"></div>
					</div>
				</form>
			</div>
			
			<div class="col"></div>
		</div>
	</div>


	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>