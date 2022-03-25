<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${board} Reply Page</h1>
	
	<form action="./reply" method="post">
		<input type="hidden" value="${dto.num}" name="num">
		Title<input type="text" name="title">
		Writer<input type="text" name="writer">
		Contents<textarea name="contents" rows="" cols=""></textarea>
		<button type="submit">Reply</button>
	
	</form>
</body>
</html>