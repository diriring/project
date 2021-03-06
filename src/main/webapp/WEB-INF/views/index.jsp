<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Olive Young</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./resources/css/ao_index.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/style.css" type="text/css">
    <script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous">
	</script>
	
	<style>
    .cateMenu a{cursor:pointer;}
    .cateMenu .hide{display:none;}
	</style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> oliveweb@cj.net</li>
                                <li>3만원 이상 구매시 배송비 무료</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                        	<c:choose>
                        		<c:when test="${not empty member}">
		                            <div class="header__top__right__social">
		                                <a href="/s1/member/mypage">MyPage</a>
									</div>
									<div class="header__top__right__social">
		                                <a href="/s1/member/logout">로그아웃</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="header__top__right__social">
		                                <a href="/s1/member/join?type=member">회원가입</a>
									</div>
									<div class="header__top__right__social">
		                                <a href="/s1/member/login">로그인</a>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="header__top__right__social">
                                <a href="/s1/ocart/list">장바구니</a>
							</div>
							<div class="header__top__right__social">
                                <a href="/s1/member/orderList">주문배송</a>
							</div>
							<!-- <div class="header__top__right__social">
                                <a href="/s1/qna/list">QNA</a>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/s1/"><img src="./resources/img/olive/logo/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/s1/">Home</a></li>
                            <li><a href="/s1/oproduct/list">Shop</a></li>
                            <!-- <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul> 
                            </li> -->
                            <li><a href="/s1/qna/list">QNA</a></li>
                            <li><a href="/s1/notice/list">NOTICE</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <!-- <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul> -->
                        <div class="header__cart__price">
                        	<a href="/s1/member/join?type=seller">사업자등록</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
	
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories" id="cateMenu">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li class="cateMenu"><a href="#" id="s1">스킨케어</a>
                            	<!-- 아니면 div로 묶고 위에 a태그에 id줘서 click왔을때 옆에 보이게? -->
                            	<ul class="hide">
                            		<li><a href="./oproduct/listType?productType=10101">스킨/로션/올인원</a></li>
                            		<li><a href="./oproduct/listType?productType=10102">에센스/크림</a></li>
                            		<li><a href="./oproduct/listType?productType=10103">미스트/오일</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s2">마스크팩</a>
                            	<ul class="hide">
                            		<li><a href="./oproduct/listType?productType=10201">시트팩/패드</a></li>
                            		<li><a href="./oproduct/listType?productType=10202">페이셜팩</a></li>
                            		<li><a href="./oproduct/listType?productType=10203">코팩/패치</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s3">클렌징</a>
                                <ul class="hide">
                            		<li><a href="./oproduct/listType?productType=10301">페이셜클렌징</a></li>
                            		<li><a href="./oproduct/listType?productType=10302">메이크업클렌징</a></li>
                            		<li><a href="./oproduct/listType?productType=10303">필링/패드</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s4">건강/위생용품</a>
                            	<ul class="hide">
                            		<li><a href="./oproduct/listType?productType=20101">스팟패치/의료용품</a></li>
                            		<li><a href="./oproduct/listType?productType=20102">여성/위생용품</a></li>
                            		<li><a href="./oproduct/listType?productType=20103">운동/헬스용품</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s5">건강식품</a>
                            	<ul class="hide">
                            		<li><a href="./oproduct/listType?productType=20201">비타민류</a></li>
                            		<li><a href="./oproduct/listType?productType=20202">체중관리</a></li>
                            		<li><a href="./oproduct/listType?productType=20203">선물용 건강세트</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s6">푸드</a>
                                <ul class="hide">
                            		<li><a href="./oproduct/listType?productType=20301">식단/이너뷰티</a></li>
                            		<li><a href="./oproduct/listType?productType=20302">간편식/요리</a></li>
                            		<li><a href="./oproduct/listType?productType=20303">디저트/간식</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s7">라이프/홈</a>
                            	 <ul class="hide">
                            		<li><a href="./oproduct/listType?productType=30101">홈클리닝</a></li>
                            		<li><a href="./oproduct/listType?productType=30102">생활</a></li>
                            		<li><a href="./oproduct/listType?productType=30103">주방</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s8">반려동물</a>
                                <ul class="hide">
                            		<li><a href="./oproduct/listType?productType=30201">강아지식품</a></li>
                            		<li><a href="./oproduct/listType?productType=30202">강아지용품</a></li>
                            		<li><a href="./oproduct/listType?productType=30203">고양이식품</a></li>
                            		<li><a href="./oproduct/listType?productType=30204">고양이용품</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#" id="s9">베이비</a>
                                <ul class="hide">
                            		<li><a href="./oproduct/listType?productType=30301">기저귀</a></li>
                            		<li><a href="./oproduct/listType?productType=30302">분유/이유식/간식</a></li>
                            		<li><a href="./oproduct/listType?productType=30303">스킨/바디케어</a></li>
                            	</ul>
                            </li>
                            <!-- 밑에 두개 미구현 -->
                            <li class="cateMenu"><a href="#">네일</a>
                            	<ul class="hide">
                            		<li><a href="">스킨/로션/올인원</a></li>
                            		<li><a href="">에센스/크림</a></li>
                            		<li><a href="">미스트/오일</a></li>
                            	</ul>
                            </li>
                            <li class="cateMenu"><a href="#">바디케어</a>
                                <ul class="hide">
                            		<li><a href="">스킨/로션/올인원</a></li>
                            		<li><a href="">에센스/크림</a></li>
                            		<li><a href="">미스트/오일</a></li>
                            	</ul>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="./oproduct/list" class="search" method="get">
                            	<!-- 상품명만 검색 가능하게 -->
                           		<input type="hidden" name="kind" value="col1">
                                <input type="text" placeholder="어떤게 필요하신가요?" name="search" value="${pager.search}">
                                <button type="submit" class="site-btn">검 색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+02 1522-0882</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="./resources/img/olive/banner/banner.jpg">
                        <div class="hero__text">
                            <span>모든 생필품이 다 있는</span>
                            <h2>올리브영에 <br />오신 여러분 환영합니다</h2>
                            <p>저렴하고 좋은 물건 가져가세요!</p>
                            <a href="./oproduct/list" class="primary-btn">상품 보러가기</a>
                        </div>
                    </div>
               </div> 
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
     
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/skin.jpg">
                            <h5><a href="./oproduct/listType?productType=10101">스킨/로션/올인원</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/maskPack.png">
                            <h5><a href="./oproduct/listType?productType=10201">시트팩/패드</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/cleansing.jpg">
                            <h5><a href="./oproduct/listType?productType=10301">페이셜클렌징</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/spotPatch.png">
                            <h5><a href="./oproduct/listType?productType=20101">스팟패치/의료용품</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/vitamin.jpg">
                            <h5><a href="./oproduct/listType?productType=20201">비타민류</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/food.jpg">
                            <h5><a href="./oproduct/listType?productType=20301">식단/이너뷰티</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/homeCleaning.jpg">
                            <h5><a href="./oproduct/listType?productType=30101">홈클리닝</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/dogFood.jpg">
                            <h5><a href="./oproduct/listType?productType=30201">강아지식품</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="./resources/img/olive/categories/diaper.jpg">
                            <h5><a href="./oproduct/listType?productType=30301">기저귀</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>오늘의 추천상품</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".beauty">Beauty</li>
                            <li data-filter=".health">Health</li>
                            <li data-filter=".food">Food</li>
                            <li data-filter=".life">Life</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!----------------------------------여기 구현시 링크 제품 넣고 실제 제품 링크로 할것 -------------------------->
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix beauty">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/2T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                        	<!-- 이 부분 -->
							<!-- 연습용 db임 -->
                        	<h6><a href="./oproduct/detail?productNum=142">아누아 수딩 토너 350ml</a></h6>
                            <!-- <h6><a href="#">아누아 수딩 토너 350ml</a></h6> -->
                            <h5>30,500원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix health">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/22T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=161">센시안 압박밴드 1켤레</a></h6>
                            <h5>21,900원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix beauty">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/3T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=143">아비브 토너 스킨부스터 1+1</a></h6>
                            <h5>39,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix life">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/31T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=170">리큅 3in1 미니믹서기</a></h6>
                            <h5>49,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix food">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/27T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=166">쿠캣 쭈꾸미볶음 280g 2종 택1</a></h6>
                            <h5>7,500원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix beauty">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/14T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=153">스킨푸드 캐롯 카로틴 카밍 워터 패드</a></h6>
                            <h5>26,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix beauty">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/18T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=157">바닐라코 클렌징밤 오리지널 125ml</a></h6>
                            <h5>18,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix beauty">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/img/olive/today/13T.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./oproduct/detail?productNum=152">눅스멀티 플로럴오일(본품100ml+멀티오일10ml*2 증정)</a></h6>
                            <h5>49,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
<!--     <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="./resources/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="./resources/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <!-- <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="./resources/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Latest Product Section End -->

	<!-- 블로그 지우기 -->
    <!-- Blog Section Begin -->
    <!-- <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="./resources/img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="./resources/img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="./resources/img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="/s1/"><img src="./resources/img/olive/logo/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>씨제이올리브영 주식회사</li>
                            <li>대표이사 : 구창근 | 사업자등록번호 : 809-81-01574</li>
                            <li>주소 : (04323) 서울특별시 용산구 한강대로 372, 24층(동자동, KDB타워)</li>
                            <li>호스팅사업자 : CJ 올리브네트웍스</li>
                            <li>통신판매업신고번호 : 2019-서울용산-1428</li>
                            <li>이메일 : oliveweb@cj.net</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1">
					 <div class="footer__about">
                        <ul>
                        	<li>이용약관법적고지</li>
                            <li>개인정보처리방침</li>
                            <li>청소년보호방침</li>
                            <li>영상정보처리기기 운영/관리 방침</li>
                            <li>이메일무단수집거부</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-12">
                    <div class="footer__widget">
                        <h6>정기구독</h6>
                        <p>최신 쇼핑정보 받아가세요!</p>
                        <form action="#">
                            <input type="text" placeholder="이메일 입력">
                            <button type="submit" class="site-btn">구독하기</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="./resources/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="./resources/js/index.js"></script>
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery-ui.min.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/mixitup.min.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>

	<script>
		//JQUERY로 카테고리 메뉴 클릭시 구동
	    $(document).ready(function(){
	        $(".cateMenu>a").click(function(){
	            var submenu = $(this).next("ul");
	 
	            // submenu 가 화면상에 보일때는 위로 부드럽게 접고 아니면 아래로 부드럽게 펼치기
	            if( submenu.is(":visible") ){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	            }
	        })
	 
	        //마우스 갔다댔을때 너무 번잡함
	 		/* .mouseover(function(){
	            $(this).next("ul").slideDown();
	        }); */
/* 	        // cateMenu class 중에 두번째 있는 cateMenu 의 하위에 있는 a태그에 클릭 이벤트를 발생시킨다. 화면 켰을때 먼저 다보고싶을때
	        $(".cateMenu:eq(1)>a").click(); */
	    });
	</script>


</body>

</html>