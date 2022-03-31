<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
<h1> ${board}List Page</h1>
	
	<div>
			<form action="./list" method="get">
				<fieldset>
					<select name="kind">
						<option value="col1">제목</option>
						<option value="col2">작성자</option>
						<option value="col3">본문</option>
					</select>
					<input type="text" name="search" value="${pager.search}"><!-- 파라미터 -> name-->
					<button type="submit">검색</button>
				</fieldset>	
			</form>

		</div>
	
	
	<table>
		<tr>
				<th>글번호</th><th>제목</th><th>내용</th><th>작성자</th><th>작성일자</th><th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
		<td>${dto.num}</td>
		
		<td><a href="./detail?num=${dto.num}">
			<c:catch var="message">
				<c:forEach begin="1" end="${dto.depth}">--</c:forEach>
			</c:catch>
		
		${dto.title}</a>
		
		</td>
		<td>${dto.contents}</td>
		<td>${dto.writer}</td>
		<td>${dto.regDate}</td>
		<td>${dto.hit}</td>
		</tr>
		</c:forEach>
		</table>
		
		 <div>
				<c:if test="${pager.pre}">
					<a href="./list?page=${pager.startNum-1}">이전</a>
				</c:if>
			
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
				</c:forEach>
				
				<c:if test="${pager.next}">
					<a href="./list?page=${pager.lastNum+1}">다음</a>
				</c:if>
		</div> 
		
		<a href="./add">add</a>
</body>
</html>