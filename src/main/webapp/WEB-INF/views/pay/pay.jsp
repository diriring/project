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
				<form action="./add" method="post" id="payFrm">
				<div class="row">
					<div class="col-lg-8">
						<div>
							<h4>배송지 정보</h4>
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
						
						<div>
							<h4>올리브영 배송상품</h4>
							<div class="shoping__cart__table">
								<table>
									<thead>
										<tr>
											<th>이미지</th>
											<th>상품정보</th>
											<th>판매가</th>
											<th>수량</th>
											<th>구매가</th>
										</tr>
									</thead>
									<c:forEach items="${productList}" var="product" varStatus="status">
										<tr>
											<td>
												<img alt="img" src="../resources/upload/oproduct/thumbnail/${product.oproductFileThumbDTO.fileNameThumb}" id="img">
											</td>
											<td>
												<input type="hidden" name="idList" value="${cartList[status.index].cartId}">
												${product.productName}
											</td>
											<td><fmt:formatNumber value="${product.productPrice}" pattern="#,###원"/></td>
											<td>${cartList[status.index].productAmount}개</td>
											<td><fmt:formatNumber value="${product.productPrice * (1 - product.productDC / 100)}" pattern="#,###원"/></td>
										</tr>
									</c:forEach>
									
								</table>
							</div>
						</div>
						
						<div>
							<h4>마일리지 사용</h4>
							<div class="col-lg-6">
								<h5>보유 마일리지 <fmt:formatNumber value="${memberDTO.point}" pattern="#,###M"/></h5>
								<div class="input-group mb-3">
									<input id="pointUse" name="pointUse" type="number" min="0" max="${memberDTO.point}" class="form-control">
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
									<td style="text-align: right;">2,500원</td>
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
										<input name="payMoney" id="payMoney" type="hidden" value="${totalPrice + 2500}" readonly>
										<div id="totalPriceResult">
											<fmt:formatNumber value="${totalPrice + 2500}" pattern="#,###원"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>마일리지 적립</td>
									<td style="text-align: right;">
										<input id="pointSave" type="hidden" name="pointSave">
										<div id="pointSaveResult">
											<fmt:formatNumber value="${(totalPrice + 2500)*0.05}" pattern="#,###M"/>
										</div>
									</td>
								</tr>
							</table>
							<button type="button" id="payBtn" class="site-btn">결제</button>
						</div>
					</div>
				</div>
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