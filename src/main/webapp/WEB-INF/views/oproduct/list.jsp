<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link href="../resources/css/ao_table.css" rel="styleSheet"/>
<link href="../resources/css/ao_list.css" rel="styleSheet"/>

<style type="text/css">
	#img{
			margin-left: 10px;
			width: 100px;
			height: 100px;
		}
</style> 
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 
	
	
	<div class="table-container">
	
		<h1> OProduct Page</h1>
		
		<!-- paging 처리 -->
		<!-- 아직 미완성 카테고리, 이름 별 검색 만들기 -->
		<form action="./list" class="search" method="get">
			<fieldset>
				<input type="text" name="search" value="${pager.search}">
				<button type="submit">검색</button>
			</fieldset>
		</form>
		
		
		<table class="table-basic">
			<tr>
				<th>이미지</th><th>상품번호</th><th>상품이름</th><th>카테고리</th><th>상품가격</th><th>등록날짜</th><th>재고</th>
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td>
						<img alt="" src="../resources/upload/oproduct/thumbnail/${list.oproductFileThumbDTO.fileNameThumb}" id="img">
					</td>															
					<td>${list.productNum}</td>
					<td><a href="./detail?productNum=${list.productNum}">${list.productName}</a></td>
					<td>${list.typeName}</td>
					<td>${list.productPrice}</td>
					<td>${list.regDate}</td>
					<td>${list.productStock}</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- paging 처리 -->
		<div>
			<c:if test="${pager.pre}">
				<a href="./list?page=${pager.startNum-1}">PREVIEW</a>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${pager.kind} &search=${pager.search}">${i}</a>
			</c:forEach>
			<c:if test="${pager.next}">
				<a href="./list?page=${pager.lastNum+1}">NEXT</a>
			</c:if>
		</div>
		
		<c:if test="${not empty member}">
			<a href="./add">ADD</a>
		</c:if>
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>


</html>