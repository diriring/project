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
	
		<h1> oCart List Page</h1>
		
		<!-- paging 처리 -->
		<form action="./list" class="search" method="get">
			<fieldset>
				<input type="text" name="search" value="${pager.search}">
				<button type="submit">검색</button>
			</fieldset>
		</form>
		
		
		<table class="table-basic">
			<tr>
				<th>장바구니번호</th><th>ID</th><th>제품번호</th><th>제품수량</th>
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.cartId}</td>
					<td>${list.id}</td>
					<td><a href="../oproduct/detail?productNum=${list.productNum}">${list.productNum}</a></td>
					<td>${list.productAmount}</td>
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
		<%-- <c:if test="${not empty member}">
			<a href="./add">ADD</a>
		</c:if> --%>
		<a href="./add">ADD</a>
		
	</div>

</body>
</html>