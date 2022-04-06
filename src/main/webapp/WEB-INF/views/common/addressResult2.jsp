<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<tr>
			<td style="width:200px">우편번호/주소</td>
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

</body>
</html>