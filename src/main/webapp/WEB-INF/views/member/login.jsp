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
	<h1>Login Page</h1>
	
	<div>	
		<c:if test="${result == '0'}">
			사용자 아이디 혹은 비밀번호를 확인해주세요.
		</c:if>
		
		<form action="./login" method="post" id="loginfrm">
			<fieldset>
				ID <input type="text" id="id" name="id" value="${cookie.remember.value}" placeholder="아이디">
			</fieldset>
			<fieldset>
				PW <input type="password" id="pw" name="pw" placeholder="비밀번호">
			</fieldset>
			<fieldset>
				<input type="checkbox" name="remember" value="1"> 아이디 저장
				<a href="#">아이디 찾기</a>
				<a href="#">비밀번호 찾기</a>
			</fieldset>
			
			
			<button type="button" id="loginbtn">로그인</button>
		</form>
		
	</div>

<script src="../resources/js/login.js"></script>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>
</html>