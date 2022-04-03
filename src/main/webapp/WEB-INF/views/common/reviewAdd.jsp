<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="./reviewAdd" method="POST">
    <input type="hidden" name="num" value="${dto.productNum}" id="num">
		<input type="text" name="writer" id="writer" value="${member.id}" readonly><!-- value="${member.id}" readonly 멤버 추가되면 추가할것 -->
		<textarea rows="" cols="" name="contents" id="contents"></textarea>
		<button type="submit" id="ok">등록!</button>
	</form>
</body>
</html>