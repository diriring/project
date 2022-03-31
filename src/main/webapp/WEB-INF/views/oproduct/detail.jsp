<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import> --%>
<style type="text/css">
	#img{
		width: 200px;
		height: 200px;
	}
</style>
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
			<img alt="" src="../resources/upload/oproduct/${f.fileName}" id="img">
			<a href="./fileDown?fileNum=${f.fileNum}">${f.oriName}</a>
		</c:forEach>
	</div>

	<hr>
		<h3>Review 작성</h3>
		<input type="hidden" name="num" value="${dto.productNum}" id="num">
		<input type="text" name="writer" id="writer" value="${member.id}" readonly><!-- value="${member.id}" readonly 멤버 추가되면 추가할것 -->
		<textarea rows="" cols="" name="contents" id="contents"></textarea>
		<button type="button" id="ok">OK</button>
	
	<hr>

	<table id="productReview">
	
	
	</table>

	<hr>
	
	<a href="./update?productNum=${dto.productNum}">Update</a>
	<a href="./delete?productNum=${dto.productNum}">Delete</a>
	
	<!-- 나중에 member 생기면 연동 -->
	<%-- 
	<c:if test="${member.id eq dto.writer}">
		<a href="./update?productNum=${dto.productNum}">Update</a>
		<a href="./delete?productNum=${dto.productNum}">Delete</a>
	</c:if>
	--%>
	<!------------------------>
	
	
	
	
	<a href="./list">List</a>
	
	<script src="../resources/js/oproductReview.js"></script>
</body>
</html>