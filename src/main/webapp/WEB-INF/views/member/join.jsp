<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | Olive Young</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
<style type="text/css">
	.nice-select {
		width: 230px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
	<div class="container">
		<div class="checkout__form spad">
			<div class="section-title">
				<h2>${title}</h2>
			</div>
			<div class="row">
				<div class="col-lg-8" style="float: none; margin: 0 auto;">	
					<h3>기본정보</h3>
					<br>
					<form action="./join" method="post" id="joinfrm">
						<input type="hidden" name="memberType" value="${memberType}">
						
						<div>
							<h5>${name}</h5>
							<div class="row">
								<div class="col-lg-10">
									<div class="checkout__input">
										<input id="name" type="text" name="name">
									</div>
								</div>
								<div class="col-lg-12">
									<div id="nameResult"></div> <br>
								</div>
									
							</div>
						</div>
						
						<div>
							<h5>아이디</h5>
							<div class="row">
								<div class="col-lg-10">	
									<div class="checkout__input">
										<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
									</div>
								</div>
								<div>
									<button type="button" id="idCheckBtn" class="site-btn">중복확인</button>
								</div>
								<div class="col-lg-12">
									<div id="idResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div>
							<h5>비밀번호</h5>
							<div class="row">
								<div class="col-lg-10">
									<div class="checkout__input">
										<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
									</div>
								</div>
								<div class="col-lg-12">
									<div id="pwResult">영문자, 숫자, 특수문자 조합하여 8~12자리</div> <br>
								</div>
							</div>
						</div>
						
						<div>
							<h5>비밀번호 확인</h5>
							<div class="row">
								<div class="col-lg-10">
									<div class="checkout__input">
										<input type="password" id="pwCheck" placeholder="비밀번호를 재입력해주세요.">
									</div>
								</div>
								<div class="col-lg-12">
									<div id="pcResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div>
							<h5>생년월일</h5>
							<div class="row">
								<div class="col-lg-4">
									<select id="year" class="form-control">
										<option value="" selected disabled hidden>년도 선택</option>
									</select>
								</div>
								<div class="col-lg-4">
									<select id="month" class="form-control">
										<option value="" selected disabled hidden>달 선택</option>
									</select>
								</div>
								<div class="col-lg-4">
									<select id="day" class="form-control">
										<option value="" selected disabled hidden>일 선택</option>
									</select>
								</div>
								<input type="hidden" id="birth" name="birth">
								<div class="col-lg-12">
									<div id="birthResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div>
							<h5>휴대전화</h5>
							<div class="row">
								<div class="col-lg-4">
									<select id="phone1" class="form-control">
										<option value="" selected disabled hidden>선택해주세요</option>
									</select>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="phone2">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="phone3">
									</div>
								</div>
								<input type="hidden" id="phone" name="phone">
								<div class="col-lg-12">
									<div id="phoneResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div>
							<h5>이메일</h5>
							<div class="row">
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="email1">
									</div>
								</div>
								<span>@</span>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="email2" placeholder="직접 입력">
									</div>
								</div>
								<div>
									<input type="hidden" id="email" name="email">
									<button type="button" id="emailCheckBtn" class="site-btn">중복확인</button>
								</div>
								<div class="col-lg-12">
									<div id="emailResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 text-center">
							<button type="button" id="joinbtn" class="site-btn">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="../resources/js/join.js"></script>
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
 <script src="/s1/resources/js/jquery-3.3.1.min.js"></script>
 <script src="/s1/resources/js/bootstrap.min.js"></script>
 <script src="/s1/resources/js/jquery-ui.min.js"></script>
 <script src="/s1/resources/js/jquery.slicknav.js"></script>
 <script src="/s1/resources/js/mixitup.min.js"></script>
 <script src="/s1/resources/js/owl.carousel.min.js"></script>
 <script src="/s1/resources/js/main.js"></script>
</body>
</html>