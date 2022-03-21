<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Login Page</h1>
	
	<div>	
		<form action="./login" method="post">
			<fieldset>
				ID <input type="text" name="id" value="${cookie.remember.value}" placeholder="아이디">
			</fieldset>
			<fieldset>
				PW <input type="password" name="pw" placeholder="비밀번호">
			</fieldset>
			<fieldset>
				<input type="checkbox" name="remember" value="1"> 아이디 저장
			</fieldset>
			
			<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>