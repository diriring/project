<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link href="../resources/css/table.css" rel="styleSheet"/>
<link href="../resources/css/list.css" rel="styleSheet"/>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
	
	<div class="table-container">
	
		<h1> OProduct Page</h1>
		
		<!-- paging 처리 -->
		<form action="./list" class="search" method="get">
			<fieldset>
				<input type="text" name="search" value="${pager.search}">
				<button type="submit">검색</button>
			</fieldset>
		</form>
		
		
		<table class="table-basic">
			<tr>
				<th>상품번호</th><th>상품이름</th><th>상품가격</th><th>작성자</th>
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.productNum}</td>
					<td><a href="./detail?productNum=${list.productNum}">${list.productName}</a></td>
					<td>${list.productPrice}</td>
					<td>${list.writer}</td>
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
		
		
		<%-- admin이 들어왔들때 하기 --%>
		<!-- 여기서 member id 랑 member type 같이 보는 방법생각 -->
		<%-- <c:if test=""></c:if> --%>
		<a href="./add">ADD</a>
		
	</div>

</body>
</html>