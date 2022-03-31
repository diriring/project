<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
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
                                <a href="#">주문배송</a>
							</div>
							<div class="header__top__right__social">
                                <a href="/s1/qna/list">QNA</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 아직 안건듬 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/s1/"><img src="./resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/s1/">Home</a></li>
                            <li><a href="/s1/oproduct/list">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
            <!-- 아직 안건듬 -->
        </div>
    </header>
    <!-- Header Section End -->
	
  

	
	
	
	
	
	
	
	



   
    

