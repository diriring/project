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
<link rel="stylesheet" href="../resources/css/board_update.css">
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
			<h2>${board} 수정</h2>
		</div>
		
		
		<form action="./update" method="post">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="text" name="title" value="${dto.title}">
			<input type="text" name="writer" value="${dto.writer}" disabled>
			<div>
				<textarea rows="" cols="" name="contents">${dto.contents}</textarea>
			</div>
			
			<div id="files">
			<c:forEach items="${dto.fileDTOs}" var="f">
			<div>
				<img alt="" src="../resources/upload/${board}/${f.fileName}"
											class="img" style="height: 400px; width: 300px;">
				${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn">지우기</button>
			</div>	
			</c:forEach>
		</div>
		
		<div id="fileResult"></div>

		<div>
			<button type="button" id="fileAdd">파일추가</button>
		</div>
				<button type="submit" class="site-btn">수정하기</button>	
		
		</form>
	
	</div>
	
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
	<script type="text/javascript" src="../resources/js/board_update.js"></script>	
</body>
</html>