<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olive Young</title>
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/ao_ocart.css">
<style type="text/css">
#img {
	margin-left: 10px;
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
	
	
	<section class="breadcrumb-section set-bg" data-setbg="../resources/img/olive/banner/cart.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${member.name}의 장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<div class="container">
	

		<!----------------------------------------------------------------------------->

		<div class="content_area">

			<!--이름,내용 별 검색 만들기 카테고리 미완성 아니면 가격을 넣어볼지 카트에서는 뺼지?  -->
			<!-- 일단 빼봄 -->
			<!-- 맵퍼에서 일단 뺴는거로 구현 -->
<%-- 			<div class="search_wrap">
				<form action="./list" class="search" method="get">
					<fieldset>
						<select name="kind">
							<option value="col1">상품명</option>
							<option value="col2">상품내용</option>
						</select>
						<input type="text" name="search" value="${ocartDTO.search}">
						<button type="submit">검색</button>
					</fieldset>
				</form>
			</div> --%>

			<form action="../pay/payForm" id="frm" method="post">

				<%-- <div class="content_subject">
					<span>${member.name}의 장바구니</span>
				</div> --%>

				<!-- 장바구니 리스트 -->
				<div class="content_middle_section"></div>
				<!-- 장바구니 가격 합계 -->
				<!-- cartInfo -->
				<div class="content_totalCount_section">

					<!-- 체크박스 전체 여부 -->
					<div class="all_check_input_div">
						<input type="checkbox" class="all_check_input" id="size" checked="checked">
						<span class="all_chcek_span">전체선택</span>
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
									<td class="td_width_1 cartInput" id="cartInputT">
										<div class="rules">
											<input type="checkbox" class="individual_check" checked="checked" data-num="${list.cartId}" name="idList" value="${list.cartId}">
										</div>
										<input type="hidden" class="individual_salePrice" id="individual_salePriceC${list.cartId}" value="${list.salePrice}">
										<input type="hidden" class="individual_productAmount" id="individual_productAmountC${list.cartId}" value="${list.productAmount}"> 
										<input type="hidden" class="individual_point" id="individual_pointC${list.cartId}" value="${list.point}">
										<!-- point 1원 차이나는거 고민중에 만들어봄 -->
										<%-- <input type="hidden" class="individual_totalPoint" id="individual_totalPointC${list.cartId}" value="${list.totalPoint}"> --%>
									</td>
									
									<td class="td_width_2">
										<!-- 이미지 출력 --> 
										<img alt="" src="../resources/upload/oproduct/thumbnail/${list.thumbFilesDTOs[0].fileNameThumb}" id="img">
									</td>
									<td class="td_width_3"><a href="../oproduct/detail?productNum=${list.productNum}">${list.productName}</a></td>
									
									<td class="td_width_4 price_td">
									<del>정가 :<fmt:formatNumber value="${list.productPrice}" pattern="#,### 원" /></del>	<br> 
										판매가 : <span class="red_color"><fmt:formatNumber value="${list.salePrice}" pattern="#,### 원" /></span><br>
										마일리지 : <span class="green_color"><fmt:formatNumber value="${list.point}" pattern="#,### M" /></span></td>
										
									<td class="td_width_4 table_text_align_center modify" id="modify">
										<div class="table_text_align_center quantity_div" data-num="${list.cartId}">
											<input type="text" value="${list.productAmount}" class="quantity_input" id="count_check${list.cartId}">
											<button type="button" class="quantity_btn plus_btn" id="plus_btn${list.cartId}">+</button>
											<button type="button" class="quantity_btn minus_btn" id="minus_btn${list.cartId}">-</button>
										</div> 
                             	    <button type="button" class="quantity_modify_btn" id="quantity_modify_btn${list.cartId}" data-cartId="${list.cartId}">변경</button>
									</td>
									
									<td class="td_width_4 table_text_align_center">
										<fmt:formatNumber value="${list.salePrice * list.productAmount}" pattern="#,### 원" />
									</td>
									
									<td class="td_width_4 table_text_align_center" id="delete_cart">
										<button type="button" class="delete_btn" id="delete_btn${list.cartId}" data-cartId="${list.cartId}">삭제</button>
									</td>
									
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
					<c:forEach begin="${ocartDTO.startNum}" end="${ocartDTO.lastNum}"
						var="i">
						<a
							href="./list?page=${i}&kind=${ocartDTO.kind} &search=${ocartDTO.search}">${i}</a>
					</c:forEach>
					<c:if test="${ocartDTO.next}">
						<a href="./list?page=${ocartDTO.lastNum+1}">NEXT</a>
					</c:if>
				</div>

				<div class="line"></div>

				<!-- 가격 종합 -->
				 <div class="content_total_section">
					<div class="total_wrap">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>총 상품 가격</td>
											<td id="totalPriceInput">
												<!-- 자바스크립트에서 값 뿌려줌 --> 
                                    <span id="totalPrice_span"></span>
											</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td id="deliveryFee"><span id="delivery_price"></span></td>
										</tr>
										<tr>
											<td>총 주문 상품수</td>
											<td id="totalAmountInput"><span id="totalAmount_span"></span>
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
												<td><strong>총 결제 예상 금액</strong></td>
												<td id="finalPriceInput"><span
													id="finalTotalPrice_span"></span></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<table>
										<tbody>
											<tr>
												<td><strong>총 적립 예상 마일리지</strong></td>
												<td id="totalPointInput"><span id="totalPoint_span"></span>
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
				 	<input type="hidden" name="id" value="${member.id}">
					<button type="submit" id="btn">주문하기</button>
				</div>
				<!-- 마일리지 생각 -->
			</form>
			
				<!-- 수량 조정 form -->
	            <form action="./update" method="post" id="update_frm">
	               <input type="hidden" name="cartId" id="update_cartId">
	               <input type="hidden" name="productAmount" id="update_productAmount">
	               <input type="hidden" name="id" value="${member.id}">
	            </form>
	            
	            <!-- 삭제 form -->
                <form action="./delete" method="post" id="delete_frm">
                   <input type="hidden" name="cartId" id="delete_cartId">
                   <input type="hidden" name="id" value="${member.id}">
                </form>
	            
		</div>
		<!----------------------------------------------------------------------------->

	</div>

	
	<script src="../resources/js/ocartTotalCount.js"></script>
	<script src="../resources/js/ocartUpdate.js"></script>

	
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/header_js.jsp"></c:import>

</body>
</html>





