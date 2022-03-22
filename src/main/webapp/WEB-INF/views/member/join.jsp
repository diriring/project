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
	<h1>${title}</h1>
	<div>
		
		<h3>기본정보</h3>
		
		<form action="./join" method="post" id="joinfrm">
			<input type="hidden" name="memberType" value="${memberType}">
			<fieldset>
				<legend>${name}</legend>
				<input id="name" type="text" name="name">
				<div id="nameResult"></div>
			</fieldset>
			
			<fieldset>
				<legend>아이디</legend>
				<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
				<button type="button">중복확인</button>
				<div id="idResult"></div>
			</fieldset>
			
			<fieldset>
				<legend>비밀번호</legend>
				<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
				<div id="pwResult">영문자, 숫자, 특수문자 조합하여 8~12자리</div>
			</fieldset>
			
			<fieldset>
				<legend>비밀번호 확인</legend>
				<input type="password" id="pwCheck" placeholder="비밀번호를 재입력해주세요.">
				<div id="pcResult"></div>
			</fieldset>
			
			<fieldset>
				<legend>생년월일</legend>
				<select id="year"></select>
				<select id="month"></select>
				<select id="day"></select>
				<input type="hidden" id="birth" name="birth">
				<div id="birthResult"></div>
			</fieldset>
			
			<fieldset>
				<legend>휴대전화</legend>
				<select id="phone1"></select>
				-
				<input type="text" id="phone2">
				-
				<input type="text" id="phone3">
				<input type="hidden" id="phone" name="phone">
				<div id="phoneResult"></div>
			</fieldset>
			
			<fieldset>
				<legend>이메일</legend>
				<input type="text" id="email1">
				@
				<input type="text" id="email2" placeholder="직접 입력">
				<input type="hidden" id="email" name="email">
				<button type="button">중복확인</button>
				<div id="emailResult"></div>
			</fieldset>
			
			<button type="button" id="joinbtn">회원가입</button>
			
		</form>
	</div>
	
	<script src="../resources/js/join.js"></script>
</body>
</html>