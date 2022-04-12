<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송 조회 | Olive Young</title>
<style type="text/css">
   #img{
         margin-left: 10px;
         width: 100px;
         height: 100px;
      }
	.outer_table {
		width: 100%;
   		border-collapse: collapse;
	}
	.outer_table th, td {
		border-bottom: 1px solid #BDBDBD;
		text-align: center;
	}
	.inner_table {
		width: 100%;
	}
	.inner_table td {
		border: unset;
		height: 100px;
	}
</style> 
<c:import url="../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	<section class="breadcrumb-section set-bg" data-setbg="/s1/resources/img/mypage_img.jpg">
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
    
	<section class="product spad">
	   <div class="container">
	       <div class="row">
	           <div class="col-lg-3 col-md-5">
	               <div class="sidebar">
	                   <div class="sidebar__item">
	                       <h4>마이페이지</h4>
	                       <ul>
	                           <li><a href="./orderList">주문/배송 조회</a></li>
	                           <li><a href="./beforeUpdate">회원정보 수정</a></li>
	                           <li><a href="./pwUpdate">비밀번호 수정</a></li>
	                           <li><a href="./address/list">배송지 관리</a></li>
	                           <li><a href="./beforeDelete">회원탈퇴</a></li>
	                       </ul>
	                   </div>
                   </div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="section-title">
						<h2>주문/배송 조회</h2>
					</div>
					<div>
						<table class="outer_table">
							<colgroup>
								<col width="12%"/>
								<col width="52%"/>
								<col width="12%"/>
								<col width="12%"/>
								<col width="12%"/>
							</colgroup>
							<tr>
								<th>주문일자</th>
								<th>상품</th>
								<th>수량</th>
								<th>주문금액</th>
								<th>상태</th>
							</tr>
							<c:forEach items="${orderList}" var="order" varStatus="status">
								<tr>
									<td>${order.orderDate}</td>
										<td>
											<table class="inner_table">
											<colgroup>
												<col width="30%"/>
												<col width="70%"/>
											</colgroup>
											<c:forEach items="${productList[status.index]}" var="product">
												<tr>
													<td>
														<img alt="img" src="../resources/upload/oproduct/thumbnail/${product.oproductFileThumbDTO.fileNameThumb}" id="img">
													</td>
													<td>${product.productName}</td>
												</tr>
											</c:forEach>
											</table>
										</td>
										<td>
											<table class="inner_table">
												<c:forEach items="${productList[status.index]}" var="product">
												<tr>
													<td>${product.cartDTO.productAmount}개</td>
												</tr>
											</c:forEach>
											</table>
										</td>
										<td>
											<table class="inner_table">
												<c:forEach items="${productList[status.index]}" var="product">
												<tr>
													<td>
														<fmt:formatNumber value="${(product.productPrice * (1 - product.productDC / 100)) * product.cartDTO.productAmount}" pattern="#,###원"/>
													</td>
												</tr>
											</c:forEach>
											</table>
										</td>
									<td>
										<c:choose>
											<c:when test="${order.refund eq 0}">
												<c:choose>
													<c:when test="${order.shipState eq 0}">
														상품 준비 중
														<form action="../order/refund" method="post">
														<input type="hidden" name="orderNum" value="${order.orderNum}">
														<button type="submit" class="btn btn-outline-secondary">주문 취소</button>
														</form>
													</c:when>
													<c:when test="${order.shipState eq 1}">배송 중</c:when>
													<c:when test="${order.shipState eq 2}">배송 완료</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
												환불 처리 완료
											</c:otherwise>
										</c:choose>
									</td>
								</tr>	
							</c:forEach>
						</table>
			 		</div>
					<div class="row">
						<div class="col-lg-12 text-center">
							<div class="product__pagination">
								<c:if test="${pager.pre}">
									<a href="./orderList?page=${pager.startNum-1}"><i class="fa fa-long-arrow-left"></i></a>
								</c:if>
							
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		
								<a href="./orderList?page=${i}">${i}</a>
								</c:forEach>
								
								<c:if test="${pager.next}">
									<a href="./orderList?page=${pager.lastNum+1}"><i class="fa fa-long-arrow-right"></i></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>
</body>
</html>