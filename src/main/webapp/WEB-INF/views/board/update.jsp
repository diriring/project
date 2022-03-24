<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board} update Page 임</h1>
	
	
	<form action="./update" method="post">
		<input type="hidden" name="num" value="${dto.num}">
		<input type="text" name="title" value="${dto.title}">
		<input type="text" name="writer" value="${dto.writer}" disabled>
		<textarea rows="" cols="" name="contents">${dto.contents}</textarea>
		<button type="submit">button</button>	
	
	</form>
</body>
</html>