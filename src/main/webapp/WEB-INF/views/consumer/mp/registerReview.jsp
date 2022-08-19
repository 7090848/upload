<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../mp/registerReviewProcess?product_no=${list.product_no }&store_no=${list.store_no }&order_no=${list.order_no}" method="post">
		<input name="consumer_no" type="hidden" value="${list.consumer_no }">
		<input name="product_no" type="hidden" value="${list.product_no}">
		<input name="store_no" type="hidden" value="${list.store_no }">
		<input name="order_no"  type="hidden" value="${list.order_no }">
		<textarea name="review_content" rows="5" cols="10"></textarea>
		별점<input name="review_star" type="number" ><br>
		이미지<input name="review_img_path" type="image"><br>
		<input type="submit" value="회원가입">		
	</form>
</body>
</html>