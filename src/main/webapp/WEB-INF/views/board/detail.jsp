<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board_detail.css">
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
	
	<section class="detail">
		<div class="container">
		<div class="page-title">
			<div class="container">
				<h3 id="title" style="text-align: center; padding-bottom: 50px; padding-top: 50px;"> 
					<div class="section-title">
						<h2>${board}</h2>
					</div>
					
				
				</h3>
			</div>
		
			<div id="board_title" style="border-top: 1px solid #e7e7e7; font-weight: 500; font-size: larger;">
			
				
				${dto.title}
			
			
			</div>
				
				
				<div id="board_etc" style="border-top: 1px solid #e7e7e7;">
					<span id="board_writer">${dto.writer}</span>
					<span id="board_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regDate}"/></span>
					<span style="float: right;">조회수 : ${dto.hit}</span>
				</div>
			<div style="border-top: 1px solid #e7e7e7; padding-top: 10px; font-size: medium; white-space:pre-wrap">
				<c:out value="${dto.contents}" />
			</div>
		
		<div>
			<c:forEach items="${dto.fileDTOs}" var="f">
								<img id="board-img" alt="" src="../resources/upload/${board}/${f.fileName}" style="height: 400px;width: 300px;">
			</c:forEach>
		</div>
		
	
	<hr style="background: #9bce26;">
		<c:if test="${not empty member}">
			
			<input type="hidden" name="num" value="${dto.num}" id="num">
			<input type="text" name="writer" id="writer" value="${member.id}" readonly><!-- value="${member.id}" readonly 멤버 추가되면 추가할것 -->
			<textarea rows="" cols="" name="contents" id="contents"></textarea>
			<button type="button" id="reply" class="site-btn">Reply</button>
			
			<hr>
		</c:if>	
			<table id="replyResult">
	
	
			</table>
	
	<div>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<a href="./fileDown?fileNum=${f.fileNum}">${f.oriName}</a>		
		</c:forEach>
	</div>
	
		<div style="text-align: right;">
			<c:if test="${member.id eq dto.writer}">
				<a href="./delete?num=${dto.num}" style="text-align: right;">삭제</a>
				<a href="./update?num=${dto.num}"style="text-align: right;">수정</a>
			</c:if>
		</div>
	</div>
	</div>
</section>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	

	<script src="../resources/js/reviewReply.js"></script>

</body>
</html>