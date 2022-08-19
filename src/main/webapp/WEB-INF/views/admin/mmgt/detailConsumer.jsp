<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${data }" var="data">
		<p>회원 번호 : ${data.consumer.consumer_no }</p>
		<p>회원 등급 : ${data.consumer.consumer_tier_no }</p>
		<p>회원 아이디 : ${data.consumer.consumer_id }</p>
		<p>회원 이름 : ${data.consumer.consumer_name }</p>
		<p>회원 닉네임 : ${data.consumer.consumer_nickname }</p>
		<p>회원 전화번호 : ${data.consumer.consumer_phone }</p>
		<p>회원 이메일 : ${data.consumer.consumer_email }</p>
		<p>회원 생일 : ${data.consumer.consumer_birth }</p>
		<p>회원 가입일자 : ${data.consumer.consumer_joindate }</p>
		<p>회원 보유마일리지 : ${data.consumer.consumer_totalprice }</p>
		<p>회원 삭제여부 : ${data.consumer.consumer_delete_yn }</p>
		
	</c:forEach>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>