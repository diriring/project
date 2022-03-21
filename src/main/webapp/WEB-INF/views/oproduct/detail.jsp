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
	<h3>Writer : ${dto.writer}</h3>
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
	<h3>Detail : ${dto.productDetail}</h3>
	<h3>Price : ${dto.productPrice}</h3>
	
 	<div>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<img alt="" src="../resources/upload/oproduct/${f.fileName}">
		</c:forEach>
	</div>
	
	<a href="./update?productNum=${dto.productNum}">Update</a>
	<a href="./delete?productNum=${dto.productNum}">Delete</a>
	
	<!-- 나중에 member 생기면 연동 -->
	<%-- <c:if test="${member.id eq dto.writer}">
		<a href="./update?productNum=${dto.productNum}">Update</a>
		<a href="./delete?productNum=${dto.productNum}">Delete</a>
	</c:if>
	<c:if test="${board ne 'notice'}">
		<a href="./reply?productNum=${dto.productNum}">Reply</a>
	</c:if> --%>
	<!-- ------------------ -->
	
	<a href="./list">List</a>
	
</body>
</html>