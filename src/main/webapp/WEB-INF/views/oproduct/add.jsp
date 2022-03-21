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

	<h1>OProduct Add Page</h1>
	
	<form action="./add" method="POST" enctype="multipart/form-data">
	
		<fieldset>
			<legend>ProductType</legend>
				<select name="productType">
					<option value=1>스킨케어</option>
					<option value=2>마스크팩</option>
					<option value=3>클렌징</option>
				</select>
		</fieldset>	
		<!-- 나중에 member들어오면 -->
		<%-- Writer : <input type="text" name="writer" id="writer" value="${member.id}" readonly> --%>
		Writer : <input type="text" name="writer">
		ProductName : <input type="text" name="productName">
		ProductDetail : <textarea rows="10" cols="" name="productDetail"></textarea>
		ProductPrice : <input type="number" name="productPrice">
		ProductDC : <input type="number" step="0.01" name="productDC">
		ProductStock : <input type="number" name="productStock">

		<!-- 파일 ADD 시작 -->
		<div id="fileResult"></div>

		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
		
		<!-- 파일 ADD 끝	 -->
	
		<!-- id btn 왜 넣었지 생각 -->
		<button type="submit" id="btn">ADD</button>
		
	</form>
	
	
	<a href="./list">List</a>
	
	<script src="../resources/js/file.js"></script>
</body>
</html>







