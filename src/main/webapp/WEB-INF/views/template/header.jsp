<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="menu">
					<ul>
						<li><a href="/s1/">HOME</a></li>
						<li><a href="/s1/oproduct/list">PRODUCT</a></li>
						<li><a href="/s1/oreview/list">REVIEW</a></li>
						<li><a href="/s1/oqna/list">QNA</a></li>
					</ul>
				</div>
				<div class="login">
					<ul>
						<c:choose>
							<c:when test="">
								<li><a href="/s1/omember/myPage">MyPage</a></li>
								<li><a href="/s1/omember/logout">LogOut</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/s1/omember/join">JOIN</a></li>
								<li><a href="/s1/omember/login">LOGIN</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
