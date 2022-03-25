<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>My page</h1>
	<h3>${dto.name}님 반갑습니다.</h3>
	<div>
	보유하신 포인트 : ${dto.point}P
	</div>
	<div>
		<h4>마이 정보</h4>
		<ul>
			<li><a href="./beforeUpdate">회원정보 수정</a></li>
			<li><a href="./pwUpdate">비밀번호 수정</a></li>
			<li><a href="./address/list">배송지 관리</a></li>
			<li><a href="./beforeDelete">회원탈퇴</a></li>
		</ul>
	</div>
	
	
</body>
</html>