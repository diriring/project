<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/detail.css">
<c:import url="../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 
	<!-- 중요 잊지말고 구매가 진행되면 재고에서 없어지고 판매량 늘어나는 코드 작성할것 -->
	<h1>OProduct Detail Page</h1>
	
		<div class="content_area">
			<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap">
						<img alt="img" src="../resources/upload/oproduct/thumbnail/${dto.oproductFileThumbDTO.fileNameThumb}" id="img">
					</div>
					<div class="line">
					</div>
					<div class="image_detail_wrap">
						<div class="image_detail">
							<c:forEach items="${dto.fileDTOs}" var="f">
								<img alt="" src="../resources/upload/oproduct/${f.fileName}" id="imgd">
							</c:forEach>
						</div>
					</div>
				</div> 
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${dto.productName}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="year">
						 <span>
						 	등록일
						 </span>
						 <span>|</span>
						 <span>
						 <fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/>
						 </span>
					</div>
					<div class="line">
					</div>	
					<div class="price">
						<div class="sale_price">정가 : <fmt:formatNumber value="${dto.productPrice}" pattern="#,### 원" /></div>
						<div class="discount_price">
							판매가 : <span class="discount_price_number"><fmt:formatNumber value="${dto.productPrice - (dto.productPrice)*(dto.productDC*0.01)}" pattern="#,### 원" /></span> 
							[<fmt:formatNumber value="${dto.productDC}" pattern="###" />% 
							<fmt:formatNumber value="${dto.productPrice*(dto.productDC*0.01)}" pattern="#,### 원" /> 할인]</div>							
						<div>
							<!-- 포인트 판매가의 0.05 적립으로 성정 -->
							적립 포인트 : <span class="point"></span>
							<fmt:formatNumber value="${(dto.productPrice - (dto.productPrice)*(dto.productDC*0.01))*0.05}" pattern="#,### 원"/>
						</div>
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" value="1" id="count_check">
							<span>
								<button id="plus_btn">+</button>
								<button id="minus_btn">-</button>
							</span>
						</div>
						<div id="button_set">
							<a class="btn_cart" data-id="${member.id}" data-proNum="${dto.productNum}">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="product_intro">
					${dto.productDetail}
				</div>
				<div class="product_content">
					${dto.productDetail}
				</div>
			</div>
			<div class="line">
			</div>
			<div class="content_bottom">
				<c:if test="${member.id eq dto.writer}">
					<a href="./update?productNum=${dto.productNum}">Update</a>
					<a href="./delete?productNum=${dto.productNum}">Delete</a>
				</c:if>
				<a href="./list">List</a>
			</div>	
						
			<!-- <div class="content_bottom">
				리뷰
			</div> -->
			
		</div>
		
		<script src="../resources/js/detail.js"></script>
</body>
</html>