<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/ao_ocart.css">
<style type="text/css">
	#img{
			margin-left: 10px;
			width: 100px;
			height: 100px;
		}
</style> 
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 
	
	
	<div class="table-container">

		
		<%-- <h1>"${ocartDTO.startNum}"</h1> --%>
		<%-- <h1>HI ${oCartDTO.thumbFilesDTOs.fileNameThumb} </h1> --%>
		

		
		<!----------------------------------------------------------------------------->
		
		<div class="content_area">
		
		 	<!-- paging 처리 위치조정필요 -->
 			<div class="search_wrap">
		  		<form action="./list" class="search" method="get">
					<fieldset>
														<!-- ocartDTO 직접 받아와서 뿌려줬음 -->
														<!-- 이거 지금 작동 안함-->
						<input type="text" name="search" value="${ocartDTO.search}">
						<button type="submit">검색</button>
					</fieldset>
				</form> 
			</div>
			
 			<div class="content_subject"><span>장바구니</span></div>
 
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
			
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input" id= "size" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>
						<tr>
							<th class="td_width_1">버튼</th>
							<th class="td_width_2">상품이미지</th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<!-- 체크박스 태그 추가 부분 -->
								<td class="td_width_1" id="cartInput">
									<!-- 넘기는 값 -->
									<!-- id로 가지고와서 javascript 처리후 출력? -->
									<!-- value값 가지고 와서 처리후 다시 밑에 총가 격 id로 삽입해주기 -->
									<!-- 이건 각각의 값임-->
									<input type="checkbox" class="individual_check" id= "size" checked="checked">
									<input type="hidden" class="individual_productPrice" value="${list.productPrice}">
									<input type="hidden" class="individual_productAmount" value="${list.productAmount}">
									<input type="hidden" class="individual_salePrice" value="${list.salePrice}">
									<input type="hidden" class="individual_totalPrice" value="${list.salePrice * list.productAmount}">
									<input type="hidden" class="individual_point" value="${list.point}">
									<input type="hidden" class="individual_totalPoint" value="${list.totalPoint}">				
								</td>
								<td class="td_width_2">
									<!-- 이미지 출력 -->
									<img alt="" src="../resources/upload/oproduct/thumbnail/${list.thumbFilesDTOs[0].fileNameThumb}" id="img">
								</td>
								<td class="td_width_3"><a href="../oproduct/detail?productNum=${list.productNum}">${list.productName}</a></td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${list.productPrice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${list.salePrice}" pattern="#,### 원" /></span><br>
									마일리지 : <span class="green_color"><fmt:formatNumber value="${list.point}" pattern="#,### M" /></span>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${list.productAmount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${list.salePrice * list.productAmount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			
			<!-- paging 처리 -->
			
	  		<div class="paging">
				<c:if test="${ocartDTO.pre}">
					<a href="./list?page=${ocartDTO.startNum-1}">PREVIEW</a>
				</c:if>
				<c:forEach begin="${ocartDTO.startNum}" end="${ocartDTO.lastNum}" var="i">
					<a href="./list?page=${i}&kind=${ocartDTO.kind} &search=${ocartDTO.search}">${i}</a>
				</c:forEach>
				<c:if test="${ocartDTO.next}">
					<a href="./list?page=${ocartDTO.lastNum+1}">NEXT</a>
				</c:if>
			</div>
			
			<div class="line">
			</div>
			
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<!-- td에 class값을 부여하고 시작되자마자 계산해서 td안에 span값을 뿌려주자 -->
										<td id="totalPriceInput">
											<!-- 자바스크립트에서 값 뿌려줌 -->
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td id="deliveryFee">
											
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td id="totalAmountInput">

										</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td id="finalPriceInput">
												
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td id="totalPointInput">

											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a>주문하기</a>
			</div>
		
		</div>
		<!----------------------------------------------------------------------------->
		

	
		<%-- admin이 들어왔들때 하기 애초에 필요 없을듯 타입 다른것만 생각--%>
		<!-- 여기서 member id 랑 member type 같이 보는 방법생각 -->
		<%-- <c:if test="${not empty member}">
			<a href="./add">ADD</a>
		</c:if> --%>
		<!-- <a href="./add">ADD</a> -->
		
	</div>
	
	<script src="../resources/js/ocartTotalCount.js"></script>

</body>
</html>
