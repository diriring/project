<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Join Page</h1>
	
	<div>
		
		<h3>기본정보</h3>
		
		<form action="./join" method="post">
			
			<fieldset>
				<legend>이름</legend>
				<input type="text" name="name">
			</fieldset>
			
			<fieldset>
				<legend>아이디</legend>
				<input type="text" name="id" placeholder="아이디를 입력해주세요.">
			</fieldset>
			
			<fieldset>
				<legend>비밀번호</legend>
				<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
			</fieldset>
			
			<fieldset>
				<legend>비밀번호 확인</legend>
				<input type="password" placeholder="비밀번호를 재입력해주세요.">
			</fieldset>
			
			<fieldset>
				<legend>생년월일</legend>
				<input type="text" name="birth">
			</fieldset>
			
			<fieldset>
				<legend>휴대전화</legend>
				<input type="text" name="phone">
			</fieldset>
			
			<fieldset>
				<legend>이메일</legend>
				<input type="text" name="email">
			</fieldset>
			
			<button type="submit">JOIN</button>
			
		</form>
	</div>
	
	
</body>
</html>