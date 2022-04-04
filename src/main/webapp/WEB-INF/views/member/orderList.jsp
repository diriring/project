<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>주문/배송 조회</h1>
	<table>
		<tr>
			<td>주문일자</td>
			<td>상품</td>
			<td>수량</td>
			<td>주문금액</td>
			<td>상태</td>
		</tr>
		<c:forEach items="${orderList}" var="order" varStatus="status">
			<tr>
				<td>${order.orderDate}</td>
					<td>
						<table>
						<c:forEach items="${productList[status.index]}" var="product">
							<tr>
								<td>${product.productName}</td>
							</tr>
						</c:forEach>
						</table>
					</td>
					<td>
						<table>
							<c:forEach items="${productList[status.index]}" var="product">
							<tr>
								<td>${product.cartDTO.productAmount}개</td>
							</tr>
						</c:forEach>
						</table>
					</td>
					<td>
						<table>
							<c:forEach items="${productList[status.index]}" var="product">
							<tr>
								<td>${product.productPrice * (1 - product.productSale / 100)}원</td>
							</tr>
						</c:forEach>
						</table>
					</td>
				<td>
					<c:choose>
						<c:when test="${order.shipState eq 0}">
							상품 준비 중
							<button type="button">주문 취소</button>
						</c:when>
						<c:when test="${order.shipState eq 1}">배송 중</c:when>
						<c:when test="${order.shipState eq 2}">배송 완료</c:when>
					</c:choose>
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${pager.pre}">
			<a href="./orderList?page=${pager.startNum-1}">PREVIEW</a>
		</c:if>
	
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		
		<a href="./orderList?page=${i}">${i}</a>
		</c:forEach>
		
		<c:if test="${pager.next}">
			<a href="./orderList?page=${pager.lastNum+1}">NEXT</a>
		</c:if>
	</div>
</body>
</html>