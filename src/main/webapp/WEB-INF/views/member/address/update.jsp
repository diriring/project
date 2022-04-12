<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 수정 | Olive Young</title>
<c:import url="../../template/header_css.jsp"></c:import>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
	
	<c:set var="fullAddress" value="${dto.mAddress2}"></c:set>
	
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
						<h2>배송지 수정</h2>
					</div>
					<div class="shoping__cart__table">
						<form action="./update" method="post" id="addressfrm">
						<table>
							<tr>
								<td style="width:200px">배송지명</td>
								<td>
									<div class="checkout__input">
										<input type="text" name="addressName" id="addressName" value="${dto.addressName}" placeholder="최대 10자">
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:200px"><h5>우편번호/주소</h5></td>
								<td>
									<div class="row">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-7">
													<div class="checkout__input">
														<input type="text" id="mAddress1" name="mAddress1" value="${dto.mAddress1}" placeholder="우편번호" readonly>										
													</div>
												</div>
												<div class="col-lg-3">
													<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="site-btn">
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="checkout__input">
												<input type="text" id="address" value="${fn:split(fullAddress, '&&')[0]}" placeholder="주소" readonly><br>
												<input type="text" id="detailAddress"  value="${fn:split(fullAddress, '&&')[2]}" placeholder="상세주소">
												<input type="text" id="extraAddress" value="${fn:split(fullAddress, '&&')[1]}" placeholder="참고항목">
												<input type="hidden" name="mAddress2" id="mAddress2">
												<input type="hidden" id="id" name="id" value="${member.id}">
												<input type="hidden" name="maNum" value="${dto.maNum}">
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
						</form>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center">
							<button class="site-btn" type="button" id="addressbtn">배송지 수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../../resources/js/addressAdd.js"></script>
	
<c:import url="../../template/footer.jsp"></c:import>
<c:import url="../../template/header_js.jsp"></c:import>
</body>
</html>