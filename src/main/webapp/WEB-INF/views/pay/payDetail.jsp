<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
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

	<div class="container">
		<div class="checkout__from spad">
			<div class="section-title">
				<h2>주문/결제</h2>
			</div>
			
			<div class="checkout__form">
				<!-- 재석 수정중 04.08 -->
				<!-- controller에서 같이 써볼까 일단 실패해서 이걸 두개로 써보려고함-->
				
				<form action="./addDetail" method="post" id="payFrm">
				<div class="row">
					<div class="col-lg-8">
						<div>
							<h4>배송지 정보</h4>
							<div class="shoping__cart__table">
							<table>
								<tr>
									<td style="width:200px"><h5>배송지 선택</h5></td>
									<td>
										<select id="selectBox" class="form-control" style="width:200px;">
											<option value="0">신규 배송지</option>
											<c:forEach items="${addressList}" var="address" varStatus="status">
												<option value="${address.maNum}">${address.addressName}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
							
							<table id="addressResult">
								<tr>
									<td style="width:200px"><h5>우편번호/주소</h5></td>
									<td>
										<div class="row">
											<div class="col-lg-12">
												<div class="row">
													<div class="col-lg-7">
														<div class="checkout__input">
															<input type="text" id="mAddress1" placeholder="우편번호" disabled="disabled">										
														</div>
													</div>
													<div class="col-lg-3">
														<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="site-btn">
													</div>
												</div>
											</div>
											<div class="col-lg-12">
												<div class="checkout__input">
													<input type="text" id="address" placeholder="주소" readonly><br>
													<input type="text" id="detailAddress" placeholder="상세주소">
													<input type="text" id="extraAddress" placeholder="참고항목">
													<input type="hidden" name="arrive" id="arrive">
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div>
							<h4>올리브영 배송상품</h4>
							<div class="shoping__cart__table">
								<table>
									<thead>
										<tr>
											<th colspan="2">상품정보</th>
											<th>판매가</th>
											<th>수량</th>
											<th>구매가</th>
										</tr>
									</thead>
									<!-- 04.08 재석 수정 바로구매 추가해보기 -->
									<!-- 통째로 다르게 출력해보기 -->
									<!-- 아마 결제에서 안될수 있음 밑에 결제 버튼 -->
									<!-- 다른 변수가 들어올 경우 다르게 출력값을 넣어봄 -->
										<tr>
											<td>
												<img alt="img" src="../resources/upload/oproduct/thumbnail/${productDTO.oproductFileThumbDTO.fileNameThumb}" id="img">
											</td>
											<td><!-- 여기랑  name 바꿈-->
												<input type="hidden" name="productNum" value="${productDTO.productNum}">
													${productDTO.productName}
											</td>
											<td><fmt:formatNumber value="${productDTO.productPrice}" pattern="#,###원"/></td>
											<!-- 여기 수정해야할거같고 -->
											<td>${productAmount}개</td>
											<td><fmt:formatNumber value="${productDTO.productPrice * (1 - productDTO.productDC / 100)}" pattern="#,###원"/></td>
										</tr>
								</table>
							</div>
						</div>
						
						<div>
							<h4>마일리지 사용</h4>
							<div class="col-lg-6">
								<h5>보유 마일리지 <fmt:formatNumber value="${memberDTO.point}" pattern="#,###M"/></h5>
								<div class="input-group mb-3">																<!-- value값 추가 04.08 재석 -->
									<input id="pointUse" name="pointUse" type="number" min="0" max="${memberDTO.point}" class="form-control" value="0">
									<button type="button" id="pointBtn" class="btn btn-outline-secondary">사용</button>
								</div>
								</div>
						</div>
						
						<!-- <div>
							<h3>결제수단 선택</h3>
						</div> -->
					</div>
					<div class="col-lg-4">
						<div class="checkout__order">
							<h4>최종 결제정보</h4>
							<table style="width:100%;">
								<tr>
									<td>총 상품금액</td>
									<td style="text-align: right;"><fmt:formatNumber value="${totalPrice}" pattern="#,###원"/></td>
								</tr>
								<tr>
									<td>총 배송비</td>
									<!-- 04.08 재석 수정중 c:choose사용 배송비 새로 계산하려고-->
									<c:choose>
										<c:when test="${totalPrice >= 30000}">
											<td style="text-align: right;">0원</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: right;">3,000원</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td>마일리지 사용</td>
									<td style="text-align: right;">
									<div id="pointUseResult">0M</div>
									</td>
								</tr>
								<tr>
									<td>최종 결제금액</td>
									<td style="text-align: right;">
										<input name="totalPrice" id="totalPrice" type="hidden" value="${totalPrice}" readonly="readonly">
											<!-- 04.08 재석 수정중 c:choose사용 배송비 새로 계산하려고-->	
											<c:choose>
												<c:when test="${totalPrice >= 30000}">
													<input name="payMoney" id="payMoney" type="hidden" value="${totalPrice}" readonly>
													<div id="totalPriceResult">
														<fmt:formatNumber value="${totalPrice}" pattern="#,###원"/>
													</div>
												</c:when>
												<c:otherwise>
													<input name="payMoney" id="payMoney" type="hidden" value="${totalPrice + 3000}" readonly>
													<div id="totalPriceResult">
														<fmt:formatNumber value="${totalPrice + 3000}" pattern="#,###원"/>
													</div>
												</c:otherwise>
											</c:choose>
									</td>
								</tr>
								<tr>
									<td>마일리지 적립</td>
									<td style="text-align: right;">
										<input id="pointSave" type="hidden" name="pointSave">
										<!-- 04.08 재석 수정중 c:choose사용 배송비 새로 계산하려고-->
										<!-- 생각해보니 마일리지는 배송비 영향 없이 진행이 맞는듯 -->
										<div id="pointSaveResult">
											<!-- totalPoint 바로 뿌려주는것으로 수정 -->
											<fmt:formatNumber value="${totalPoint}" pattern="#,###M"/>
										</div>
									</td>
								</tr>
							</table>
							<button type="button" id="payBtn" class="site-btn">결제</button>
						</div>
					</div>
				</div>
				<!-- productAmount값 넘겨서 addDetail에서 받기 -->
				<input type="hidden" name="productAmount" value="${productAmount}">
				</form>
			
				<!-- <a href="../ocart/list">취소</a> -->
			</div>
		</div>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/pay.js"></script>

<c:import url="../template/footer.jsp"></c:import>
 <script src="/s1/resources/js/jquery-3.3.1.min.js"></script>
 <script src="/s1/resources/js/bootstrap.min.js"></script>

 <script src="/s1/resources/js/jquery-ui.min.js"></script>
 <script src="/s1/resources/js/jquery.slicknav.js"></script>
 <script src="/s1/resources/js/mixitup.min.js"></script>
 <script src="/s1/resources/js/owl.carousel.min.js"></script>
 <script src="/s1/resources/js/main.js"></script>
</body>
</html>