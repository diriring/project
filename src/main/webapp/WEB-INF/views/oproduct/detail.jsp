<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	<h1>OProduct Detail Page</h1>
	
	<h3>Num : ${dto.productNum}</h3>
	
	<c:choose>
		<c:when test="${dto.productType eq 1}">
			<h3>Type : 스킨케어</h3>
		</c:when>	
		<c:when test="${dto.productType eq 2}">
			<h3>Type : 마스크팩</h3>
		</c:when>	
		<c:otherwise>	
			<h3>Type : 클렌징</h3>
		</c:otherwise>
	</c:choose>
	
	<h3>Name : ${dto.productName}</h3>
	<h3>Detail : ${dto.priductDetail}</h3>
	<h3>Price : ${dto.productPrice}</h3>
	
	
	<a href="./update?productNum=${dto.productNum}">Update</a>
	<a href="./delete?productNum=${dto.productNum}">Delete</a>
	<a href="./list">List</a>
	
</body>
</html>