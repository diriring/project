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
	<h1>배송지 관리</h1>
	배송지는 최대 20개까지 등록 가능합니다.
	<hr>
	<table>
		<tr>
			<td>배송지명</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>관리</td>
		</tr>
		<c:forEach items="${list}" var="address">
			<tr>
				<td>${address.addressName}</td>
				<td>${address.mAddress1}</td>
				<td>
					<c:forTokens items="${address.mAddress2}" delims="&&" var="token">  
						<c:out value="${token}"/> 
					</c:forTokens>
				</td>
				<td>
					<a href="./delete?maNum=${address.maNum}">삭제</a>
					<a href="./update?maNum=${address.maNum}">수정</a>
				</td>
			</tr>	
		</c:forEach>
	</table>
	<a href="./add">추가</a>
</body>
</html>