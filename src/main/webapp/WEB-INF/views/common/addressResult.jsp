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
			<td>배송지명</td>
			<td>
				${dto.addressName}
			</td>
		</tr>
		
		<tr>
			<td>우편번호/주소</td>
			<td>
				<c:set var="fullAddress" value="${dto.mAddress2}"></c:set>
				<input type="text" id="mAddress1" name="mAddress1" value="${dto.mAddress1}" placeholder="우편번호" readonly>
				<input type="text" id="address" placeholder="주소" value="${fn:split(fullAddress, '&&')[0]}" readonly><br>
				<input type="text" id="detailAddress" value="${fn:split(fullAddress, '&&')[2]}" placeholder="상세주소">
				<input type="text" id="extraAddress" value="${fn:split(fullAddress, '&&')[1]}" placeholder="참고항목">
			</td>
		</tr>

</body>
</html>