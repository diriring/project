<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/ao_detail.css">
<c:import url="../template/header_css.jsp"></c:import>
<style type="text/css">
	#img {
		width: 400px;
		height: 400px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 
	<!-- 중요 잊지말고 구매가 진행되면 재고에서 없어지고 판매량 늘어나는 코드 작성할것 -->
	
	
	<div class="container">
	<h1>상세페이지</h1>
	
		<div class="content_area">
			<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap">
						<img alt="img" src="../resources/upload/oproduct/thumbnail/${dto.oproductFileThumbDTO.fileNameThumb}" id="img">
					</div>
					<!-- <div class="line"></div> -->
					<!-- 여기서 디테일 빼봄 -->
				</div> 
				<div class="ct_right_area">
					<div class="title">
						<!-- 수정 -->
						<h2>
							${dto.productName}
						</h2>
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
						<!-- 생각해보니 여기 건드릴 필요없어서 다시 C:CHOOSE 지움 / OCARTDTO만 처리 -->
						<div class="discount_price">
								판매가 : <span class="discount_price_number"><fmt:formatNumber value="${dto.productPrice - (dto.productPrice)*(dto.productDC*0.01)}" pattern="#,### 원" /></span> 
								[<fmt:formatNumber value="${dto.productDC}" pattern="###" />% 
								<fmt:formatNumber value="${dto.productPrice*(dto.productDC*0.01)}" pattern="#,### 원" /> 할인]
						</div>						
						<div>
							<!-- 포인트 판매가의 0.05 적립으로 설정 -->
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
							<button type = "button" class="btn_cart" data-id="${member.id}" data-proNum="${dto.productNum}">장바구니 담기</button>
							<button type = "button" class="btn_buy" id="btn_buyT">바로구매</button>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="product_intro">
				<!-- 추가함 옆으로 옮기는것 생각 -->
					<div style="white-space:pre;"><c:out value="${dto.productDetail}" /></div>
				</div>
				<div class="line">
				</div>
				<div class="product_content">
					<div class="image_detail_wrap">
						<div class="image_detail">
							<c:forEach items="${dto.fileDTOs}" var="f">
								<img alt="" src="../resources/upload/oproduct/${f.fileName}" id="imgd">
							</c:forEach>
						</div>
					</div>
				</div>	
			</div>
			
			<div class="line">
			</div>
			
		<!-- product Review -->	
		<hr>
		
		<h3>Review 작성</h3>
		<input type="hidden" name="num" value="${dto.productNum}" id="num">
		<input type="text" name="writer" id="writer" value="${member.id}" readonly><!-- value="${member.id}" readonly 멤버 추가되면 추가할것 -->
		<textarea rows="" cols="" name="contents" id="contents"></textarea>
		<button type="button" id="ok">OK</button>
	
		<hr>

		<table id="productReview">
	
	
		</table>

		<hr>
			
		<!-- product Review 끝 -->		
			
			
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
	
	</div>
	<!-- pay form -->
	<!-- 현재 문제는 지금 paycontroller는 cartid로만 기능하게 되어있음  변수명 미선언 or 컨트롤러 작동 메서드 하나더 생성-->
	<form action="../pay/payForm" method="post" id="pay_frm">
		<input type="hidden" name="productNum" id="pay_pNum" value="${dto.productNum}">
		<input type="hidden" name="productAmount" id="pay_pAmount">
		<input type="hidden" name="id" value="${member.id}">
	</form>


	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/header_js.jsp"></c:import>
	<script src="../resources/js/oproductDetail.js"></script>
	<script src="../resources/js/oproductReview.js"></script>

</body>

</html>