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
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<title>주문 상세정보</title>
</head>
<body>
	
	<div class="container-fluid pe-4">

            <div class="row mt-4 mb-3 mx-3">
                <div class="col-2" style="text-align:start;"><a href="javascript:history.back();"><i class="bi bi-arrow-left"></i></a></div>
                <div class="col-10 ps-0"><div class="row  mx-2" style="font-size: larger;">내가 작성한 리뷰</div></div>
            </div>
        </div>
        
        <div class="row py-1 border-top border-secondary border-opacity-50">
        	 
        	<div class="col mx-0">
        	<c:forEach items="${dataList}" var="data">
        		<div class="row my-2 pb-3 mx-0 border-bottom border-secondary border-opacity-25">
        			<div class="col">
        				<div class="row">
        					<div class="col fw-bold">
        						<span>${consumer.consumer_nickname }</span>
        					</div>
        				</div>
        				<div class="row">
        					<div class="col-6">
        						<%-- <c:forEach var="i" items="${ratingOptions }"  begin="1" end="5">
        							<c:choose>
        							<c:when test="${data.REVIEW_STAR <= i }">
        								<i class="bi bi-star"></i>
        							</c:when>
        							<c:otherwise>
        								<i class="bi bi-star-fill text-warning"></i>
        							</c:otherwise>
        							</c:choose>
        						</c:forEach> --%>
        						
        							<c:forEach var= "i" items="${ratingOptions}" varStatus="status" begin="1" end="5">
        								<c:if test = "${status.index <= data.REVIEW_STAR}">
        									<i class="bi bi-star-fill text-warning"></i>
        								</c:if>       								
        							</c:forEach>
        						
        						<span class="mx-2 text-secondary text-opacity-50">${data.REVIEW_STAR }</span>
        					</div>
        					<div class="col-6 text-secondary text-small">
        						<span><fmt:formatDate value="${data.REVIEW_WRITEDATE }" pattern="yyyy.MM.dd"/></span>
        					</div>
        				</div>
        				<div class="row">
        					<div class="col my-2">
        						<div class="row">
        							<div class="col">
        								<p><img class="pd-img" src="/uploadFiles/${data.REVIEW_IMG_PATH }">
        							</div>
        							<div class="col">
        								<p>${data.REVIEW_CONTENT }</p>
        							</div>
        						</div>
        					</div>
        				</div>
        				<div class="row mx-1" style="background-color: rgb(245, 245, 245);">
        					<div class="col-3 my-2">
        						<img class="img-fluid" src="/uploadFiles/${data.PI_PATH }">
        					</div>
        					<div class="col my-2">
        						<div class="row text-small text-secondary text-opacity-50">
        							<div class="col">
        								<span>${data.STORE_NAME }</span>
        							</div>
        						</div>
        						<div class="row">
        							<div class="col">
        								<span>${data.PRODUCT_NAME }</span>
        							</div>
        						</div>
        						<div class="row fw-bold">
        							<div class="col">
        								<span class="money">${data.PRODUCT_PRICE }</span>
        							</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        			</c:forEach>
        	</div>
        
        </div>
	
	
	

  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>