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
	<h1>배송지 수정</h1>
	
	<c:set var="fullAddress" value="${dto.mAddress2}"></c:set>
	
	<form action="./update" method="post" id="addressfrm">
		<fieldset>
			<legend>배송지명</legend>
			<input type="text" name="addressName" id="addressName" value="${dto.addressName}" placeholder="최대 10자">
		</fieldset>
		<fieldset>
			<legend>주소</legend>
			<input type="hidden" id="id" name="id" value="${member.id}">
			<input type="hidden" name="maNum" value="${dto.maNum}">
			<input type="text" id="mAddress1" name="mAddress1" value="${dto.mAddress1}" placeholder="우편번호" readonly>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" placeholder="주소" value="${fn:split(fullAddress, '&&')[0]}" readonly><br>
			<input type="text" id="detailAddress" value="${fn:split(fullAddress, '&&')[2]}" placeholder="상세주소">
			<input type="text" id="extraAddress" value="${fn:split(fullAddress, '&&')[1]}" placeholder="참고항목">
			<input type="hidden" name="mAddress2" id="mAddress2">
		</fieldset>
		<button type="button" id="addressbtn">배송지 수정</button>
	</form>
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../../resources/js/addressAdd.js"></script>
</body>
</html>