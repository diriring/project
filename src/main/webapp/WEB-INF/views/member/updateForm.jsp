<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정</h1>
	
	<c:set var="fullBirth" value="${dto.birth}"></c:set>
	<c:set var="fullPhone" value="${dto.phone}"></c:set>
	<c:set var="fullEmail" value="${dto.email}"></c:set>
	
	<form action="./update" method="post" id="updatefrm">
		<fieldset>
			<legend>이름</legend>
			<input id="name" type="text" name="name" value="${dto.name}">
			<div id="nameResult"></div>
		</fieldset>
		
		<fieldset>
			<legend>아이디</legend>
			<input type="text" id="id" name="id" value="${dto.id}" readonly="readonly">
		</fieldset>
		
		<fieldset>
			<legend>생년월일</legend>
			<select id="year">
				<option value="${fn:split(fullBirth, '-')[0]}" selected disabled hidden>${fn:split(fullBirth, '-')[0]}</option>
			</select>
			<select id="month">
				<option value="${fn:split(fullBirth, '-')[1]}" selected disabled hidden>${fn:split(fullBirth, '-')[1]}</option>
			</select>
			<select id="day">
				<option value="${fn:split(fullBirth, '-')[2]}" selected disabled hidden>${fn:split(fullBirth, '-')[2]}</option>
			</select>
			<input type="hidden" id="birth" name="birth">
			<div id="birthResult"></div>
		</fieldset>
		
		<fieldset>
			<legend>휴대전화</legend>
			<select id="phone1">
				<option value="${fn:split(fullPhone, '-')[0]}" selected disabled hidden>${fn:split(fullPhone, '-')[0]}</option>
			</select>
			-
			<input type="text" id="phone2" value="${fn:split(fullPhone, '-')[1]}">
			-
			<input type="text" id="phone3" value="${fn:split(fullPhone, '-')[2]}">
			<input type="hidden" id="phone" name="phone">
			<div id="phoneResult"></div>
		</fieldset>
		
		<fieldset>
			<legend>이메일</legend>
			<input type="text" id="email1" value="${fn:split(fullEmail, '@')[0]}" readonly="readonly">
			@
			<input type="text" id="email2" placeholder="직접 입력" value="${fn:split(fullEmail, '@')[1]}" readonly="readonly">
			<input type="hidden" id="email" name="email">
			<div id="emailResult"></div>
		</fieldset>
			
		<fieldset>
			<legend>비밀번호</legend>
			<a href="./pwUpdate">변경하기</a>
		</fieldset>
		<button type="button" id="updatebtn">수정</button>
			
	</form>

	<script src="../resources/js/update.js"></script>
</body>
</html>