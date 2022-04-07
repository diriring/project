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
						<h3>회원탈퇴</h3>
						<h5>회원탈퇴를 하시려면 비밀번호를 입력하셔야 합니다.</h5>
					</div>
		
					<form action="./delete" method="post">
						<div class="checkout__input">
							<input type="hidden" name="id" value="${member.id}">
						</div>
						<div class="checkout__input">
							<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
						</div>
						<button type="button" id="cancel" class="site-btn">취소</button>
						<button type="submit" class="site-btn">확인</button>
					</form>
				</div>
			</div>
		</div>	
	</div>
	
	<script>
		const cancel = document.querySelector("#cancel");
		cancel.addEventListener("click", function() {
			window.location.href="./mypage";
		});
	</script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>
</html>