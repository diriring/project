<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | Olive Young</title>
<!-- 내가추가 -->
<c:import url="../template/header_css.jsp"></c:import>
</head>
<style type="text/css">
   #img{
         margin-left: 10px;
         width: 150px;
         height: 150px;
      }
	.hero__banner {
	height: 431px;
	display: flex;
	align-items: flex-end;
	padding-left: 75px;
	}
</style> 
<body>
<c:import url="../template/header.jsp"></c:import>
<!-- -- 기존 --
</head>
<body> -->

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
					<div class="shoping__cart__table">
						<table>
							<tr>
								<td rowspan="2" class="shoping__cart__item" style="width:200px;">
									<img alt="img" src="/s1/resources/img/blank-profile-picture.png" id="img">
								</td>
								<td>${dto.name}님 반갑습니다.</td>
							</tr>
							<tr>
								<td>보유하신 포인트 : ${dto.point}P</td>
							</tr>
						</table>
					</div>
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-6">
								<div class="hero__banner set-bg" data-setbg="/s1/resources/img/banner/2890695765313366951.jpg">
			                        <div class="hero__text">
			                            <h4>거침없이 촉촉하게<br />인생 첫세럼</h4>
			                            <p>한정특가 확인해보세요!</p>
			                        </div>
			                    </div>
							</div>
							<div class="col-lg-6">
								<div class="hero__banner set-bg" data-setbg="/s1/resources/img/banner/6140848862176833481.jpg">
			                        <div class="hero__text">
			                            <h4>두피전문가<br />찐팬을 위한 대용량 샴푸</h4>
			                            <p>선착순 샴푸 50ml 추가 증정</p>
			                        </div>
			                    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>                  
	
<!-- 내가추가 -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/header_js.jsp"></c:import>	
</body>
</html>