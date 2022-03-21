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
	
	<form action="./add" method="POST">
	
		<fieldset>
			<legend>ProductType</legend>
				<select name="productType">
					<option value=1>스킨케어</option>
					<option value=2>마스크팩</option>
					<option value=3>클렌징</option>
				</select>
		</fieldset>	
		
		ProductName : <input type="text" name="productName">
		ProductDetail : <textarea rows="10" cols="" name="priductDetail"></textarea>
		ProductPrice : <input type="number" name="productPrice">
		ProductDC : <input type="number" step="0.01" name="productDC">
		ProductStock : <input type="number" name="productStock">

		<button type="submit">ADD</button>
		
	</form>
	
	
	<a href="./list">List</a>
	
</body>
</html>







