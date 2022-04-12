<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 | Olive Young</title>
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
				<h2>회원정보 수정</h2>
			</div>
			<form action="./update" method="post" id="updatefrm">
			<div class="row">
				<div class="col-lg-8" style="float: none; margin: 0 auto;">
	
					<c:set var="fullBirth" value="${dto.birth}"></c:set>
					<c:set var="fullPhone" value="${dto.phone}"></c:set>
					<c:set var="fullEmail" value="${dto.email}"></c:set>
					
						<div>
							<h5>이름</h5>
							<div class="row">
								<div class="col-lg-10">
									<div class="checkout__input">
										<input id="name" type="text" name="name" value="${dto.name}">
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
										<input type="text" id="id" name="id" value="${dto.id}" readonly="readonly">
									</div>
								</div>
							</div>
						</div>
						
						<div>
							<h5>생년월일</h5>
							<div class="row">
								<div class="col-lg-4">
									<select id="year" class="form-control">
										<option value="${fn:split(fullBirth, '-')[0]}" selected disabled hidden>${fn:split(fullBirth, '-')[0]}</option>
									</select>
								</div>
								<div class="col-lg-4">	
									<select id="month" class="form-control">
										<option value="${fn:split(fullBirth, '-')[1]}" selected disabled hidden>${fn:split(fullBirth, '-')[1]}</option>
									</select>
								</div>
								<div class="col-lg-4">
									<select id="day" class="form-control">
										<option value="${fn:split(fullBirth, '-')[2]}" selected disabled hidden>${fn:split(fullBirth, '-')[2]}</option>
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
										<option value="${fn:split(fullPhone, '-')[0]}" selected disabled hidden>${fn:split(fullPhone, '-')[0]}</option>
									</select>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="phone2" value="${fn:split(fullPhone, '-')[1]}">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="phone3" value="${fn:split(fullPhone, '-')[2]}">
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
										<input type="text" id="email1" value="${fn:split(fullEmail, '@')[0]}" readonly="readonly">
									</div>
								</div>
								<span>@</span>
								<div class="col-lg-4">
									<div class="checkout__input">
										<input type="text" id="email2" placeholder="직접 입력" value="${fn:split(fullEmail, '@')[1]}" readonly="readonly">
									</div>
								</div>
								<input type="hidden" id="email" name="email">
								<div class="col-lg-12">
									<div id="emailResult"></div> <br>
								</div>
							</div>
						</div>
						
						<div class="row">	
							<div class="col-lg-4">
								<h5>비밀번호</h5>
							</div>
							<div class="col-lg-5">
								변경하러 가기
								<a class="btn btn-outline-secondary" href="./pwUpdate">GO</a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="col-lg-12 text-center">
					<button type="button" id="updatebtn" class="site-btn">수정</button>
				</div>
			</form>
		</div>
	</div>

	<script src="../resources/js/update.js"></script>
	
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