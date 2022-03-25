<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		new project 
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	
	
	<h1>aaa</h1>
	<a href="/s1/review/list" >Review List</a>
	<a href="/s1/qna/list"> Qna List</a>
	
	<a href="./member/join?type=member">회원가입</a>
	<a href="./member/login">로그인</a>
	<a href="./member/logout">로그아웃</a>
	<a href="./member/mypage">마이페이지</a>
	<a href="./member/join?type=seller">사업자등록</a>
</body>
</html>