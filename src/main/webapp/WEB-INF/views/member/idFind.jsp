<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	<div class="container">	
		<div class="checkout__form spad">
			<div class="row">
				<div class="col-lg-6 text-center" style="float: none; margin: 0 auto;">
					<div class="section-title">
						<h3>아이디 찾기</h3>
						<h5>아이디가 기억나지 않으세요?</h5>
						<h5>가입하실 때 사용하신 이메일을 통해 아이디를 확인하실 수 있습니다.</h5>
					</div>
					<form action="./idFind" method="post" id="idFindFrm">
						<div class="checkout__input">
							<input type="text" name="email" id="email" placeholder="가입 시 사용한 이메일을 입력해주세요.">
						</div>
						<button type="button" id="idFindBtn" class="site-btn">아이디 찾기</button>
					</form>
				</div>
			</div>
		</div>	
	</div>

	<script src="../resources/js/idFind.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>
</html>