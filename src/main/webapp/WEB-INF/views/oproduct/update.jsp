<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<style type="text/css">
	.img{
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	<h1>OProduct Update Page</h1>
	
	<form action="./update" method="POST" id="frm" enctype="multipart/form-data">
	
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
		Writer : <input type="text" name="writer" id="writer" value="${dto.writer}" disabled>
		ProductName : <input type="text" name="productName" id="productName" value="${dto.productName}">
		ProductDetail : <textarea rows="10" cols="" name="productDetail" id="productDetail">${dto.productDetail}</textarea>
		ProductPrice : <input type="number" name="productPrice" id="productPrice" value="${dto.productPrice}">
		ProductDC : <input type="number" step="0.01" name="productDC" id="productDC" value="${dto.productDC}">
		ProductStock : <input type="number" name="productStock" id="productStock" value="${dto.productStock}">


		<div id="files">
		<c:forEach items="${dto.fileDTOs}" var="f">
			<div>
				<img alt="" src="../resources/upload/oproduct/${f.fileName}" class="img">
				${f.oriName} <button type="button" class="fileDeleteBtn" data-productNum="${dto.productNum}" data-fileNum="${f.fileNum}" data-fileName="${f.fileName}">X</button>
				<%-- <input type="hidden" value="${dto.productNum}"> --%>
				<!-- 만약안되면 여기때문 -->
			</div>
		</c:forEach>
		</div>

		<!-- ADD에서 끌고오려면? -->
		<!-- 이걸 묶는 div생성하고 button해서 update ajax도 가능할듯-->
		<div id="fileResult"></div>

		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
		<!-- ADD에서 끌고오려면? -->
		
		<button type="button" id="btn">UPDATE</button>
		
	</form>
	

	<a href="./list">List</a>
	
	<script src="../resources/js/file.js"></script>
	<script src="../resources/js/oproductUpdate.js"></script>
</body>
</html>



