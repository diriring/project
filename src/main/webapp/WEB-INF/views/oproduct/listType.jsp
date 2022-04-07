<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link href="../resources/css/ao_table.css" rel="styleSheet"/>
<link href="../resources/css/ao_list.css" rel="styleSheet"/>

<style type="text/css">
	#img{
			margin-left: 10px;
			width: 100px;
			height: 100px;
		}
</style> 
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 
	
	<div class="container">
	
	
		<h1>타입별 상품 페이지</h1>
		
		<!-- paging 처리 -->
		<!--이름,내용 별 검색 만들기 카테고리 미완성 아니면 가격을 넣어볼지 카트에서는 뺼지?  -->
		
 		<form action="./list" class="search" method="get">
			<fieldset>
				<select name="kind">
						<option value="col1">상품명</option>
						<option value="col2">상품내용</option>
				</select>
				<input type="text" name="search" value="${oproductTypeDTO.search}">
				<button type="submit">검색</button>
			</fieldset>
		</form>
		
		<table class="table-basic">
			<tr>
				<th>이미지</th><th>상품번호</th><th>상품이름</th><th>카테고리</th><th>상품가격</th><th>등록날짜</th><th>재고</th>
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td>
						<img alt="" src="../resources/upload/oproduct/thumbnail/${list.oproductFileThumbDTO.fileNameThumb}" id="img">
					</td>															
					<td>${list.productNum}</td>
					<td><a href="./detail?productNum=${list.productNum}&type=${list.productType}">${list.productName}</a></td>
					<td>${list.typeName}</td>
					<td>${list.productPrice}</td>
					<td>${list.regDate}</td>
					<td>${list.productStock}</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- paging 처리 -->
		<div>
			<c:if test="${oproductTypeDTO.pre}">
				<a href="./list?page=${oproductTypeDTO.startNum-1}">PREVIEW</a>
			</c:if>
			<c:forEach begin="${oproductTypeDTO.startNum}" end="${oproductTypeDTO.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${oproductTypeDTO.kind} &search=${oproductTypeDTO.search}">${i}</a>
			</c:forEach>
			<c:if test="${oproductTypeDTO.next}">
				<a href="./list?page=${oproductTypeDTO.lastNum+1}">NEXT</a>
			</c:if>
		</div>
		
		<!-- 카테고리 타입별로 볼때 add빼버릴까 고민중 04.07-->
		<%-- <c:if test="${not empty member}">
			<a href="./add">ADD</a>
		</c:if> --%>
	
	
	</div>
	
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>


</html>