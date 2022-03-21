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

	<h1>OProduct Update Page</h1>
	
	<form action="./update" method="POST">
	
		<input type="hidden" name="productNum" value="${dto.productNum}">
		
		<fieldset>
			<legend>ProductType</legend>
				<c:choose>
					<c:when test="${dto.productType eq 1}">
						<select name="productType">
							<option value=1 selected>스킨케어</option>
							<option value=2>마스크팩</option>
							<option value=3>클렌징</option>
						</select>
					</c:when>	
					<c:when test="${dto.productType eq 2}">
						<select name="productType">
							<option value=1>스킨케어</option>
							<option value=2 selected>마스크팩</option>
							<option value=3>클렌징</option>
						</select>
					</c:when>	
					<c:otherwise>	
						<select name="productType">
							<option value=1>스킨케어</option>
							<option value=2>마스크팩</option>
							<option value=3 selected>클렌징</option>
						</select>
					</c:otherwise>
				</c:choose>
		</fieldset>	
		Writer : <input type="text" name="writer" value="${dto.writer}" disabled>
		ProductName : <input type="text" name="productName" value="${dto.productName}">
		ProductDetail : <textarea rows="10" cols="" name="productDetail">${dto.productDetail}</textarea>
		ProductPrice : <input type="number" name="productPrice" value="${dto.productPrice}">
		ProductDC : <input type="number" step="0.01" name="productDC" value="${dto.productDC}">
		ProductStock : <input type="number" name="productStock" value="${dto.productStock}">

		<button type="submit">UPDATE</button>
		
	</form>
	

	<a href="./list">List</a>
	
</body>
</html>



