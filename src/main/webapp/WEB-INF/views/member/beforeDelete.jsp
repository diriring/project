<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원탈퇴</h1>
	<h3>회원탈퇴를 하시려면 비밀번호를 입력하셔야 합니다.</h3>
	
	<form action="./delete" method="post">
		<input type="hidden" name="id" value="${member.id}">
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
		<button type="button" id="cancel">취소</button>
		<button type="submit">확인</button>
	</form>
	
	<script>
		const cancel = document.querySelector("#cancel");
		cancel.addEventListener("click", function() {
			window.location.href="./mypage";
		});
	</script>
</body>
</html>