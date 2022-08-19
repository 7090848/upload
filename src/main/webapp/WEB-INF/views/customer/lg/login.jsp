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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>사업자 로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid ">
		<div class="row" style="height:80px;"></div>
		<div class="row"><!-- 배너... -->
			<div class="col"><img class="img-fluid" src="../../resources/img/atelierLogo.jpg">
		</div>
	
		<div>
			<form action="../lg/loginProcess" method="post"><br>
			<div class="row" style=" padding: 10px;"><input type="text" name="customer_id" placeholder="아이디"> </div>
				
			<div class="row "style="padding: 10px;"><input type="password" name="customer_pw" placeholder="비밀번호"></div>
			<div class="row" style="height:10px;"></div>
			<div class="row" style="padding: 10px;"><button type="submit" class="btn btn-warning text-light" >로그인</button></div>
			</form>	
			
		</div>
	</div>
	<div class="row">
			<div class="col-6 text-warning"><a href="../lg/findId">아이디/비밀번호 찾기</a></div>
			<div class="col"></div>
			<div class="col text-warning"><a href="../lg/register">회원가입</a></div>
		</div>
			</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>