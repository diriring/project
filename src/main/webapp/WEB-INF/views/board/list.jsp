<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> ${board}List Page</h1>

	<table>
		<tr>
				<th>글번호</th><th>제목</th><th>내용</th><th>작성자</th><th>작성일자</th><th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="review">
		<tr>
		<td>${review.num}</td>
		
		<td>${review.title}
		
		</td>
		<td>${review.contents}</td>
		<td>${review.writer}</td>
		<td>${review.regDate}</td>
		<td>${review.hit}</td>
		</tr>
		</c:forEach>
		</table>
</body>
</html>