<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<tr>
			<td>우편번호/주소</td>
			<td>
				<input type="text" id="mAddress1" name="mAddress1" placeholder="우편번호" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="address" placeholder="주소" readonly><br>
				<input type="text" id="detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" placeholder="참고항목">
				<input type="hidden" name="mAddress2" id="mAddress2">
			</td>
		</tr>

</body>
</html>