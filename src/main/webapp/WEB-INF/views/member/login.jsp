<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | Olive Young</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
	<div class="container">	
		<div class="checkout__form spad">
			<div class="row">
				<div class="col-lg-6 text-center" style="float: none; margin: 0 auto;">
					<div class="section-title">
						<h2>로그인</h2>
						<br>
						<h5>올리브영의 다양한 서비스와 혜택을 누리세요</h5>
					</div>
					<c:if test="${result == '0'}">
						사용자 아이디 혹은 비밀번호를 확인해주세요.
					</c:if>
					
					<form action="./login" method="post" id="loginfrm">
						<div class="checkout__input">
							<input type="text" id="id" name="id" value="${cookie.remember.value}" placeholder="아이디">
						</div>
						<div class="checkout__input">
							<input type="password" id="pw" name="pw" placeholder="비밀번호">
						</div>
						<div class="checkout__input__checkbox">
							<input type="checkbox" name="remember" value="1"> 아이디 저장
							<a href="./idFind">아이디 찾기</a>
							<a href="./pwFind">비밀번호 찾기</a>
						</div>
						
						
						<button type="button" id="loginbtn" class="site-btn">로그인</button>
					</form>
				</div>
			</div>
		</div>	
	</div>

<script src="../resources/js/login.js"></script>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>
</html>