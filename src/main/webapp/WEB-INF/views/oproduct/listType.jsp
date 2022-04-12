<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olive Young</title>
<c:import url="../template/header_css.jsp"></c:import>
<link href="../resources/css/ao_table.css" rel="styleSheet" />
<link href="../resources/css/ao_list.css" rel="styleSheet" />
<!-- 오류로 뜨는 404 안뜨게 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<style type="text/css">
.right-form {
	margin-left: auto;
}

#img {
	margin-left: 10px;
	width: 100px;
	height: 100px;
}

.set-bg {
	background-repeat: no-repeat;
	/* background-size: cover; */
	/*상품리스트 이미지 들어오게 수정*/
	background-size: contain;
	background-position: top center;
}

.breadcrumb__text h2 {
	font-size: 46px;
	/*여기 색 수정 카트 배너부분*/
	color: #00d700;
/* 	color: #ff51ff; */
	font-weight: 700;
}

.line {
	width: 100%;
	border-top: 1px solid #c6c6cf;
}

.bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	background-image: url("../resources/img/olive/banner/flower.jpg")
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 상단 배너 부분 -->
	<!-- 안되서 강제로 넣어버림 -->
	<div class="bg">
		<section class="breadcrumb-section set-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<h2>${list[0].typeName}</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<section class="product spad">
		<div class="container">
			<div class="row">

				<!-- paging 처리 -->
				<!-- 옆으로 더 옮겨야함 -->
				<!--이름,내용 별 검색 만들기 카테고리 미완성 아니면 가격을 넣어볼지 카트에서는 뺼지?  -->
				<div class="right-form">
					<form action="./listType" class="search" method="get">
						<fieldset>
							<select name="kind">
								<option value="col1">상품명</option>
								<option value="col2">상품내용</option>
							</select> <input type="text" name="search" value="${oproductTypeDTO.search}">
							<input type="hidden" name="productType" value="${list[0].productType}">
							<button type="submit">검색</button>
						</fieldset>
					</form>
				</div>
				<br> <br>
				<div class="line"></div>
				<br> <br>

				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>상품 카테고리</h4>
							<ul>
								<c:forEach items="${typeList}" var="list">
								
									<c:choose>
										<c:when test="${list.grade eq 2}">
											<br>
											<li class="cateMenu"><strong>${list.typeName}</strong></li>
										</c:when>
										<c:when test="${list.grade eq 3}">
											<ul class="hide">
												<li><a href="./listType?productType=${list.productType}">&nbsp;&nbsp;&nbsp;*&nbsp;${list.typeName}</a></li>
											</ul>
										</c:when>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>


				<div class="col-lg-9 col-md-7">
					
					<!-- 상품 갯수 보여주는거 빼고 없앨지 고민 -->
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>Sort By</span> <select>
										<option value="0">Default</option>
										<option value="0">Default</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span>총 ${oproductTypeDTO.totalCountC}</span>개의 상품이 있습니다
									</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<c:forEach items="${list}" var="list">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="../resources/upload/oproduct/thumbnail/${list.oproductFileThumbDTO.fileNameThumb}"></div>
									<div class="product__item__text">
										<h6>
											<a href="./detail?productNum=${list.productNum}">${list.productName}</a>
										</h6>
										<h5>
											판매가 :
											<fmt:formatNumber
												value="${list.productPrice - (list.productPrice)*(list.productDC*0.01)}"
												pattern="#,### 원" />
										</h5>
										<div class="product__item__price">
											정가 : <span class="discount_price_number"><fmt:formatNumber
													value="${list.productPrice}" pattern="#,### 원" /></span> [
											<fmt:formatNumber value="${list.productDC}" pattern="###" />
											%
											<fmt:formatNumber
												value="${list.productPrice*(list.productDC*0.01)}"
												pattern="#,### 원" />
											할인]
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- paging 처리 -->
					<!-- 안쪽으로 밀어 넣으면 될듯 -->
					<br>
					<div class="line"></div>
					<br>
					<div class="product__pagination text-center">
						<c:if test="${oproductTypeDTO.pre}">
							<a href="./listType?productType=${list[0].productType}&page=${oproductTypeDTO.startNum-1}">PREVIEW</a>
						</c:if>
						<c:forEach begin="${oproductTypeDTO.startNum}" end="${oproductTypeDTO.lastNum}"
							var="i">
							<a
								href="./listType?productType=${list[0].productType}&page=${i}&kind=${oproductTypeDTO.kind} &search=${oproductTypeDTO.search}">${i}</a>
						</c:forEach>
						<c:if test="${oproductTypeDTO.next}">
							<a href="./listType?productType=${list[0].productType}&page=${oproductTypeDTO.lastNum+1}">NEXT</a>
						</c:if>
					</div>
					<br>
					<div class="line"></div>
					<%-- <br>
					<div class="text-right">
						<c:if test="${not empty member}">
							<a href="./add">상품추가</a>
						</c:if>
					</div>
					<br> --%>

				</div>
			</div>
		</div>
	</section>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/header_js.jsp"></c:import>
	
</body>

</html>