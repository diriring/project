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
<style type="text/css">
   #img{
         margin-left: 10px;
         width: 100px;
         height: 100px;
      }
</style> 
</head>
<body>
	<h1>주문/결제</h1>
	<form action="./add" method="post" id="payFrm">
	<div>
		<h3>배송지 정보</h3>
		<table>
			<tr>
				<td>배송지 선택</td>
				<td>
					<select id="selectBox">
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
				<td>우편번호/주소</td>
				<td>
					<input type="text" id="mAddress1" placeholder="우편번호" disabled="disabled">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" placeholder="주소" readonly><br>
					<input type="text" id="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" placeholder="참고항목">
					<input type="hidden" name="arrive" id="arrive">
				</td>
			</tr>
		</table>
		
	</div>
	
	<div>
		<h3>올리브영 배송상품</h3>
		<table>
			<tr>
				<td>이미지</td>
				<td>상품정보</td>
				<td>판매가</td>
				<td>수량</td>
				<td>구매가</td>
			</tr>
			
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
	
	<div>
		<h3>마일리지 사용</h3>
		보유하신 마일리지 : ${memberDTO.point}M
		<input id="pointUse" name="pointUse" type="number" min="0" max="${memberDTO.point}">
		<button type="button" id="pointBtn">사용</button>
	</div>
	
	<div>
		<h3>결제수단 선택</h3>
	</div>
	
	<div>
		<h3>최종 결제정보</h3>
		<table>
			<tr>
				<td>총 상품금액</td>
				<td><fmt:formatNumber value="${totalPrice}" pattern="#,###원"/></td>
			</tr>
			<tr>
				<td>총 배송비</td>
				<td>2,500원</td>
			</tr>
			<tr>
				<td>마일리지 사용</td>
				<td>
				<div id="pointUseResult">0M</div>
				</td>
			</tr>
			<tr>
				<td>최종 결제금액</td>
				<td>
					<input name="totalPrice" id="totalPrice" type="hidden" value="${totalPrice}" readonly="readonly">
					<input name="payMoney" id="payMoney" type="hidden" value="${totalPrice + 2500}" readonly>
					<div id="totalPriceResult">
						<fmt:formatNumber value="${totalPrice + 2500}" pattern="#,###원"/>
					</div>
				</td>
			</tr>
			<tr>
				<td>마일리지 적립</td>
				<td>
					<input id="pointSave" type="hidden" name="pointSave">
					<div id="pointSaveResult">
						<fmt:formatNumber value="${(totalPrice + 2500)*0.05}" pattern="#,###M"/>
					</div>
				</td>
			</tr>
		</table>
	</div>
	</form>
	<a href="../ocart/list">취소</a>
	<button type="button" id="payBtn">결제</button>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/pay.js"></script>
</body>
</html>