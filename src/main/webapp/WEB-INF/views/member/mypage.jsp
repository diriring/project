<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>My page</h1>
	${dto.id}
	${dto.name}
	<!-- 버튼으로 해놓고 나중에 비밀번호 한 번 입력한다음에 회원탈퇴 창으로 넘어가도록 -->
	<form action="./delete" method="post">
		<input type="hidden" name="id" value="${dto.id}">
		<button type="submit">회원탈퇴</button>
	</form>
	
</body>
</html>