<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${Board} ADD Page
	<form action="./add" method="post" enctype="multipart/form-data">
		Title<input type="text" name="title">
		Writer<input type="text" name="writer">
		Contents<textarea name="contents" rows="" cols=""></textarea>
		
		<div>
			<input type="file" name="files">
			<input type="file" name="files">
			<input type="file" name="files">
		</div>
	
	<input type="submit" value="ADD">
	</form>
	
</body>
</html>