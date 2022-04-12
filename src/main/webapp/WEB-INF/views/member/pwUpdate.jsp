<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 | Olive Young</title>
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
			<div class="section-title">
				<h2>비밀번호 변경</h2>
				<br>
				<h5>고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.</h5>
			</div>
			<div class="row">
				<div class="col-lg-6" style="float: none; margin: 0 auto;">
					<form action="./pwUpdate" method="post" id="pwfrm">
						<div>
							<h5>현재 비밀번호</h5>
							<div class="checkout__input">
								<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
							</div>
						</div>
						<div>
							<h5>새 비밀번호</h5>
							<div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<input type="password" id="newPw" name="newPw" placeholder="새 비밀번호를 입력해주세요.">
									</div>
								</div>
								<div class="col-lg-12">
									<div id="pwResult">영문자, 숫자, 특수문자 조합하여 8~12자리</div> <br>
								</div>
							</div>
						</div>
						<div>
							<h5>새 비밀번호 확인</h5>
							<div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<input type="password" id="newPw2" name="newPw2" placeholder="새 비밀번호를 재입력해주세요.">
									</div>
								</div>
								<div class="col-lg-12">
									<div id="pcResult"></div> <br>
								</div>
							</div>
						</div>
						<input type="hidden" id="id" name="id" value="${member.id}">
						<div class="col-lg-12 text-center">
							<button type="button" id="cancel" class="site-btn">나중에</button>
							<button type="button" id="pwbtn" class="site-btn">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../resources/js/pwUpdate.js"></script>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	
</body>
</html>