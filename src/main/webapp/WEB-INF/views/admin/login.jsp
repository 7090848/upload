<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 로그인</title>
</head>
<body>
	<h1>관리자 로그인</h1>
	<form action="./loginProcess" method="post"><br>
		<input type="text" name="admin_id" placeholder="아이디"><br> 
		<input type="password" name="admin_pw" placeholder="비밀번호"><br>
		<button>로그인</button> 
	</form>
</body>
</html>