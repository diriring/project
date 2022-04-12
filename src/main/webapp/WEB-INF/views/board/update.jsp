<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board_update.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
 
 	<div class="container">
 
		<div class="section-title">
			<h2>${board} 수정</h2>
		</div>
		
		
		<form action="./update" method="post">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="text" name="title" value="${dto.title}">
			<input type="text" name="writer" value="${dto.writer}" disabled>
			<div>
				<textarea rows="" cols="" name="contents">${dto.contents}</textarea>
			</div>
				<button type="submit" class="site-btn">수정하기</button>	
		
		</form>
	
	</div>
	
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	
</body>
</html>