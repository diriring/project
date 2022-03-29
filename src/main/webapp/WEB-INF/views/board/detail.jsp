<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board} 짜잔 Detail</h1>
	
	<h3>제목 : ${dto.title}</h3>
	<h3>내용 : ${dto.contents}</h3>
	<h3>작성자 : ${dto.writer}</h3>
	
	<h3>작성일자 :${dto.regDate}</h3>
	<h3>조회수 :${dto.hit}</h3>
	
	<hr>
	
		<input type="hidden" name="num" value="${dto.num}" id="num">
		<input type="text" name="writer" id="writer" value="${member.id}" readonly><!-- value="${member.id}" readonly 멤버 추가되면 추가할것 -->
		<textarea rows="" cols="" name="contents" id="contents"></textarea>
		<button type="button" id="reply">Reply</button>
	
	<hr>
	
	<table id="replyResult">
	
	
	</table>
	
	
	<div>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<a href="./fileDown?fileNum=${f.fileNum}">${f.oriName}</a>		
		</c:forEach>
	</div>
	
		<a href="./reply?num=${dto.num}">Reply</a>
	
	<a href="./delete?num=${dto.num}">Delete</a>
	<a href="./update?num=${dto.num}">Update</a>
	
	<script src="../resources/js/reviewReply.js"></script>
</body>
</html>