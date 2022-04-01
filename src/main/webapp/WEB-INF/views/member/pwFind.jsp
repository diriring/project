<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>비밀번호 변경</h1>
	고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.
	<form action="./pwFind" method="post" id="pwfrm">
		<fieldset>
            <legend>아이디</legend>
            <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
		</fieldset>
        <fieldset>
            <legend>이메일</legend>
            <input type="text" name="email" id="email" placeholder="가입 시 사용한 이메일을 입력해주세요.">
		</fieldset>
		<fieldset>
			<legend>새 비밀번호</legend>
			<input type="password" id="newPw" name="newPw" placeholder="새 비밀번호를 입력해주세요.">
			<div id="pwResult"></div>
		</fieldset>
		<fieldset>
			<legend>새 비밀번호 확인</legend>
			<input type="password" id="newPw2" name="newPw2" placeholder="새 비밀번호를 재입력해주세요.">
			<div id="pcResult"></div>
		</fieldset>
		<button type="button" id="pwbtn">비밀번호 변경</button>
	</form>

	<script src="../resources/js/pwFind.js"></script>
</body>
</html>