<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	아이디가 기억나지 않으세요? 원하시는 방법을 선택해 아이디를 확인하실 수 있습니다.
	<h3>간편 찾기</h3>
	<form action="./idFind" method="post" id="idFindFrm">
		<input type="text" name="email" id="email" placeholder="가입 시 사용한 이메일을 입력해주세요.">
		<button type="button" id="idFindBtn">아이디 찾기</button>
	</form>
	<h3>이름과 전화번호를 통해 찾기</h3>

	<script src="../resources/js/idFind.js"></script>
</body>
</html>