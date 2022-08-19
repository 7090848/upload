<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${!empty consumer}">
				${consumer.consumer_id }님 회원가입이 완료되었습니다.
			</c:when>
			<c:otherwise>
				알 수 없는 이유로 회원가입을 실패하였습니다.
			</c:otherwise>
		</c:choose>
			<br>
			<a href="../lg/login">로그인하러 가기</a>
	
	</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>