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
<link rel="stylesheet" href="../resources/css/board_add.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
	
	<div class="container">
		<div class="section-title">
			<h2>글 등록</h2>
		</div>
	<form action="./add" method="post" enctype="multipart/form-data">
		제목<input type="text" name="title">
		작성자<input type="text" name="writer" value="${member.id}" readonly>
		<div>Contents<textarea name="contents" rows="" cols=""></textarea></div>
		
		<div>
			<input type="file" name="files">
			<input type="file" name="files">
			<input type="file" name="files">
		</div>
		
	
	<input type="submit" value="글 등록" class="site-btn">
	</form>
	
		</div>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>		
</body>
</html>