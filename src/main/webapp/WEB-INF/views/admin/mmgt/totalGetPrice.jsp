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
<title>Insert title here</title>
</head>
<body>
	
	일자별 매출 현황 리스트
        <table class="table">
            <tbody>
              <tr>
                <th scope="row" class="bg-secondary bg-opacity-50">매출일자</th>
                <td><input  style="width:5em;" type="text" value="2022-07-01"></td>
                <td style="text-align:center;"> ~ </td>
                <td><input  style="width:5em;" type="text" value="2022-07-03"></td>
              </tr>
              <tr>
                <th scope="row" class="bg-secondary bg-opacity-50">주문상태</th>
                <td>
                	<div class="btn-group">
                	<button class="btn border py-0 dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    --선택--
					 </button>
					 <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#"></a>미승인</li>
					    <li><a class="dropdown-item" href="#"></a>일시정지</li>
					    <li><a class="dropdown-item" href="#">삭제</a></li>
					    <li><a class="dropdown-item" href="#">승인</a></li>
					 </ul>
					  </div>
                </td>
               
                <td class="bg-secondary bg-opacity-50 text-bold" style="text-align:center;" >제품명</td>
                <td><input style="width:5em;" type="text"></td>
              </tr>
              <tr>
                <th scope="row" style="text-align:center;" class="bg-secondary bg-opacity-50">구매자</th>
                <td colspan="2"><input  style="width:11em; height:2em;"  type="text" value="검색어 입력"></td>
                <td style="text-align:center"><button class="py-0 btn btn-secondary">검색</button></td>
              </tr>
            </tbody>
          </table>


        오오오오오오오옹
        <table class="table">
            <thead>
              <tr class="text-small">
                <th scope="col">No</th>
                <th scope="col">구매자</th>
                <th scope="col">제품명</th>
                <th scope="col">구매일자</th>
                <th scope="col">판매액</th>
                <th scope="col">부가세</th>
                <th scope="col">판매수익</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${list}" var="data">
              <tr class="text-xsmall" style="text-align:center;">
                <th scope="row">${data.ORDER_NO }</th>
                <td>${data.CONSUMER_NAME }</td>
                <td>${data.PRODUCT_NAME }</td>
                <td><fmt:formatDate value="${data.ORDER_DATE}" pattern="yyyy.MM.dd"/></td>
                <td>${data.PRODUCT_PRICE }</td>
                <td>500</td>
                <td>${data.PRODUCT_PRICE }</td>
              </tr>
               </c:forEach>
            </tbody>
          </table>
          
          <div class="row" >
          	<nav aria-label="Page navigation example">
			  <ul class="pagination" style="place-content:center;">
			    <li class="page-item">
			      <a class="page-link text-black" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item"><a class="page-link text-black" href="#">1</a></li>
			    <li class="page-item"><a class="page-link text-black" href="#">2</a></li>
			    <li class="page-item"><a class="page-link text-black" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link text-black" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
          </div>
          
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>