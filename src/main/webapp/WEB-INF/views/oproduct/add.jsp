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
	
	<form action="./add" method="POST" id="frm" enctype="multipart/form-data">
	
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
		Writer : <input type="text" name="writer" id="writer">
		ProductName : <input type="text" name="productName" id="productName">
		ProductDetail : <textarea rows="10" cols="" name="productDetail" id="productDetail"></textarea>
		ProductPrice : <input type="number" name="productPrice" id="productPrice">
		ProductDC : <input type="number" step="0.01" name="productDC" id="productDC">
		ProductStock : <input type="number" name="productStock" id="productStock">

		<!-- 파일 ADD 시작 -->
		<div id="fileResult"></div>

		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
		
		<!-- 파일 ADD 끝	 -->
	
		<!-- id btn 왜 넣었지 생각 -->
		<!-- js넣으면 button으로 바꾸려고 넣었네-->
		<!-- member들어와서 자동입력 되면 그때 js에서 writer빼는거 생각-->
		<button type="button" id="btn">ADD</button>
		
	</form>
	
	
	<a href="./list">List</a>
	
	<script src="../resources/js/file.js"></script>
	<script src="../resources/js/oproductAdd.js"></script>
</body>
</html>







