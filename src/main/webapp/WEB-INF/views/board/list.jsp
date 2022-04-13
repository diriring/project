<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="../resources/css/board_list.css" rel="styleSheet"/>
<c:import url="../template/header_css.jsp"></c:import>
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

	<section class="board">
		<div class="page-title">
			<div class="container">
				<h3 class="title"style="padding-top: 50px;" >
					<div class="section-title">
						<h2>${board}</h2>
					</div>
				</h3>
			</div>
		</div>	
		
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="./list" method="get">
						<fieldset>
							<div>
								<select name="kind">
									<option value="col1">제목</option>
									<option value="col2">작성자</option>
									<option value="col3">본문</option>
								</select>
								<input type="text" name="search" value="${pager.search}"><!-- 파라미터 -> name-->
								<button type="submit" class="site-btn">검색</button>
							</div>
						</fieldset>	
					</form>
				</div>
			</div>
		</div>
	
	
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr id="list_top">
							<th class="th-num">글번호</th>
							<th class="th-title">제목</th>
							<th hidden>내용</th>
							<th class="th-writer">작성자</th>
							<th class="th-date">작성일자</th>
							<th class="th-hit">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr id="list_contents">
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.num}</td>
									<td><a href="./detail?num=${dto.num}">${dto.title}</a></td>
									<td hidden>${dto.contents}</td>
									<td>${dto.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regDate}"/></td>
									<td>${dto.hit}</td>
								</tr>
								</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		 <div class="container" style="text-align: center; padding-top: 30px;">
				<c:if test="${pager.pre}">
					<a href="./list?page=${pager.startNum-1}">이전</a>
				</c:if>
			
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
				</c:forEach>
				
				<c:if test="${pager.next}">
					<a href="./list?page=${pager.lastNum+1}">다음</a>
				</c:if>
		
			<c:if test="${not empty member}">
				<a href="./add" style="float: right;">글 작성</a>
			</c:if>
		</div>	
		
	</section>

<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	
</body>
</html>