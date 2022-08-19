<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아틀리에 고객 문의</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
</head>
<body>
	<div class="container-fluid px-3">

        <div class="row">
            <div class="col-3"></div>
            <div class="col"><h2>문의 작성</h2></div>
            <div class="col-3"></div>
        </div>
        	<!-- 문의 작성 폼태그 -->
	<form action="./CustomerQnaWriteProcess" method="post">
        <div class="row">
            <div class="col"></div>
            <div class="col"><h2></h2></div>
            <div class="col"></div>
        </div>
        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">문의 제목</label>
                    <input type="text" name="cus_center_title" class="form-control" id="exampleFormControlInput1"  placeholder="문의글의 제목을 입력하세요.">
                  </div>
                  <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">문의 내용</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8"  name="cus_center_content" placeholder="문의하실 내용을 입력해주세요."></textarea>
                  </div>
                  <div class="row">
                    <div class="col"></div>
                    <div class="col"><button type="submit" type="button" class="btn btn-primary">문의하기</button></div>
                </div>      
            </div>
        </div>
	</form> <!-- 문의 작성 끝나는 구간 -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>  
	</div>
</body>
</html>