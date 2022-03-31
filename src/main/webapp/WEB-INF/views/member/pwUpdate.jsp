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
	<h1>비밀번호 변경</h1>
	고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.
	<form action="./pwUpdate" method="post" id="pwfrm">
		<fieldset>
			<legend>현재 비밀번호</legend>
			<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
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
		<input type="hidden" id="id" name="id" value="${member.id}">
		<button type="button" id="cancel">나중에</button>
		<button type="button" id="pwbtn">비밀번호 변경</button>
	</form>

	<script src="../resources/js/pwUpdate.js"></script>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	
</body>
</html>