<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리 | Olive Young</title>
<c:import url="../../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>

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
	                           <li><a href="/s1/member/orderList">주문/배송 조회</a></li>
	                           <li><a href="/s1/member/beforeUpdate">회원정보 수정</a></li>
	                           <li><a href="/s1/member/pwUpdate">비밀번호 수정</a></li>
	                           <li><a href="/s1/member/address/list">배송지 관리</a></li>
	                           <li><a href="/s1/member/beforeDelete">회원탈퇴</a></li>
	                       </ul>
	                   </div>
                   </div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="section-title">
						<h2>배송지 관리</h2>
						<br>
						<h5>배송지는 최대 20개까지 등록 가능합니다.</h5>
					</div>
					<div class="shoping__cart__table">
						<table>
							<tr>
								<td>배송지명</td>
								<td>우편번호</td>
								<td>주소</td>
								<td>관리</td>
							</tr>
							<c:forEach items="${list}" var="address">
								<tr>
									<td>${address.addressName}</td>
									<td>${address.mAddress1}</td>
									<td>
										<c:forTokens items="${address.mAddress2}" delims="&&" var="token">  
											<c:out value="${token}"/> 
										</c:forTokens>
									</td>
									<td>
										<a class="btn btn-outline-secondary" href="./delete?maNum=${address.maNum}">삭제</a>
										<a class="btn btn-outline-secondary" href="./update?maNum=${address.maNum}">수정</a>
									</td>
								</tr>	
							</c:forEach>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-9 text-left">
                            <div class="product__pagination">
								<c:if test="${pager.pre}">
									<a href="./list?page=${pager.startNum-1}"><i class="fa fa-long-arrow-left"></i></a>
								</c:if>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		
								<a href="./list?page=${i}">${i}</a>
								</c:forEach>
								<c:if test="${pager.next}">
									<a href="./list?page=${pager.lastNum+1}"><i class="fa fa-long-arrow-right"></i></a>
								</c:if>
                            </div>
						</div>
						<div class="col-lg-3 text-right">
							<a class="btn btn-outline-secondary" href="./add">추가</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<c:import url="../../template/footer.jsp"></c:import>
<c:import url="../../template/header_js.jsp"></c:import>
</body>
</html>