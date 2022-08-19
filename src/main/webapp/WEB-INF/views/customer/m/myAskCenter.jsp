<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

</head>
<body>	
	
	
	
	
	<div class="container-fluid">
	<div class="sticky-top">
				<jsp:include page="../common/navbarTop.jsp"></jsp:include>
	</div>
				<p>임시 관리자에게 문의하기 메인화면</p>
				
				<div class="row py-3 border border-2">
					<div class="col-7">${temp.store.store_name}님<br> 안녕하세요</div>
				</div>		
			
				<div class="row py-3 border border-2">
    			
      			<div class="col">
      				<table class="table">
	       				<thead>
		          			<tr>
		            			<th scope="col">현황</th>
		            			<th scope="col">번호</th>
		            			<th scope="col">제목</th>
		            			<th scope="col">작성일</th>
		          			</tr>
		        		</thead>
	        		
	        			<c:forEach items="${temp.cusQna}" var="t">
	        			<tbody>	        			
				          <tr>
				            <th scope="row">
							          <c:choose>				            				
				            				<c:when test="${cus_center_category_yn == 'y'}">
				            				<button type="button" class="btn btn-primary">답변 완료</button>
				            				</c:when>
				            				<c:otherwise>
				            				<button type="button" class="btn btn-secondary">처리중</button>
				            				</c:otherwise>
							            </c:choose>
		            				</th>
				            <td>${t.cus_center_no }</td>
				            <td><a href="./askWriteToAdminDetail?cusCenterNo=${t.cus_center_no}">${t.cus_center_title }</a></td>
				            <td><fmt:formatDate value="${t.cus_center_writedate }" pattern="yy.MM.dd"/></td>
				          </tr>				      
	        			</tbody>
	        			</c:forEach>
        			</table>
      			</div>
	</div>
	</div>
	
	
	
	
	
	
	
	<footer class="fixed-bottom">
		<div class="container-fluid">
			<div class="row">
				<div class= "col"></div>
				<div class= "col"></div>
				<div class= "col-4">
				
				<a href ="./askWriteToAdmin">문의하기</a>
				
				
				</div>
			</div>
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
				
    	
    
</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>