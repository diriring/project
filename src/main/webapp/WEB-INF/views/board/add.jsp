<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board_add.css">
<style type="text/css">
	.set-bg {
		background-repeat: no-repeat;
		/* background-size: cover; */
		/*상품리스트 이미지 들어오게 수정*/
		background-size: contain;
		background-position: top center;
	}
	.bg {
		background-repeat: no-repeat;
		background-size: cover;
		background-position: top center;
		background-image: url("/s1/resources/img/mypage_img.jpg")
	}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->
	<div class="bg">
		<section class="breadcrumb-section set-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<h2><br></h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<div class="container">
		<div class="section-title" style="padding-top: 50px;">
			<h2>글 등록</h2>
		</div>
	<form action="./add" method="post" id="frm" enctype="multipart/form-data">
		제목<input type="text" name="title">
		작성자<input type="text" name="writer" value="${member.id}" readonly>
		<div>Contents<textarea name="contents" rows="" cols=""></textarea></div>
		
		<div id="fileResult">
		
		
	
	</div>
	<div>
		<button type="button" id="fileAdd">파일추가</button>
	</div>
	
	  
		
	
	<input type="submit" value="글 등록" class="site-btn">
	</form>
	
		</div>
<!-- 내가추가 -->
<script src="../resources/js/board_update.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>		
</body>
</html>