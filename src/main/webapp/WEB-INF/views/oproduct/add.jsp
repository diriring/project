<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olive Young</title>
<c:import url="../template/header_css.jsp"></c:import>
<!-- <link rel="stylesheet" href="../resources/css/ao_type.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
<style type="text/css">
	.nice-select {
		width: 230px;
	}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<div class="checkout__form spad">
			<div class="section-title">
				<h2>상품 추가</h2>
			</div>

			<div class="row">
				<div class="col-lg-8" style="float: none; margin: 0 auto;">
				
					<!-- <h3>상품타입</h3> -->
					
					<form action="./add" method="POST" id="frm"
						enctype="multipart/form-data">

	
						<div class="form_section">
							<!-- <div class="form_section_title">
								<label>상품타입</label>
							</div> -->
							<div>
								<h5>상품타입</h5>
								<div class="row">
									<div class="form_section_content col-lg-12" id="type">
										<div class="type_wrap checkout__input">
											<span>대분류</span> <select class="type1 col-lg-12">
												<option selected value="none">선택</option>
											</select>
										</div>
										<div class="type_wrap checkout__input">
											<span>중분류</span> <select class="type2 col-lg-12">
												<option selected value="none">선택</option>
											</select>
										</div>
										<div class="type_wrap checkout__input">
											<span>소분류</span> <select class="type3 col-lg-12" name="productType">
												<option selected value="none">선택</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<h5>아이디</h5>
							<div class="row">
								<div class="form_section col-lg-12">
									<!-- <div class="form_section_title">
										<label>Writer</label>
									</div> -->
									<div class="form_section_content">
										<div class="type_wrap checkout__input">
											<input type="text" name="writer" id="writer"
												value="${member.id}"  class="col-lg-12" readonly>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div>
							<h5>상품이름</h5>
							<div class="form_section">
								<!-- <div class="form_section_title">
									<label>ProductName</label>
								</div> -->
								<div class="form_section_content">
									<div class="type_wrap checkout__input ">
										<input type="text" name="productName" id="productName"
											placeholder="제품의 이름을 입력해 주세요" class="col-lg-10">
										<button type="button" id="nameCheckBtn" class="site-btn">중복확인</button>
									</div>
								</div>
							</div>
						</div>
						
						
						<div>
							<h5>상품상세</h5>
							<div class="form_section">
								<!-- <div class="form_section_title">
									<label>ProductDetail</label>
								</div> -->
								<div class="form_section_content">
									<div class="type_wrap">
										<!-- style 2906추가 -->
										<textarea rows="10" cols="134" name="productDetail"
											id="productDetail" placeholder="제품의 상세내용을 입력해 주세요" class="col-lg-12"></textarea>
									</div>
								</div>
							</div>
						</div>
						
						<div>
							<h5>상품가격</h5>
							<div class="form_section">
								<!-- <div class="form_section_title">
									<label>ProductPrice</label>
								</div> -->
								<div class="form_section_content">
									<div class="type_wrap checkout__input">
										<!-- 어떻게 리턴 옮길까? -->
										<input type="text" name="productPrice" id="productPrice"
											placeholder="제품의 가격을 입력해 주세요"
											onkeypress="return isNumberKey2(event)"
											onkeyup="return delHangle(event)"
											class="col-lg-12">
									</div>
								</div>
							</div>
						</div>
						
						<div>
							<h5>상품할인</h5>
							<div class="form_section">
								<!-- <div class="form_section_title">
									<label>ProductDC</label>
								</div> -->
								<div class="form_section_content">
									<div class="type_wrap checkout__input">
										<!-- 어떻게 리턴 옮길까? -->
										<input type="text" name="productDC" id="productDC"
											placeholder="제품의 할인율을 입력해 주세요 ex) 10 -> 10%"
											onkeypress="return isNumberKey(event)"
											onkeyup="return delHangle(event)"
											class="col-lg-12">
									</div>
								</div>
							</div>
						</div>
						
						<div>
							<h5>상품재고</h5>
							<div class="form_section">
								<!-- <div class="form_section_title">
									<label>ProductStock</label>
								</div> -->
								<div class="form_section_content">
									<div class="type_wrap checkout__input">
										<!-- 어떻게 리턴 옮길까? -->
										<input type="text" name="productStock" id="productStock"
											placeholder="제품의 수량을 입력해 주세요"
											onkeypress="return isNumberKey2(event)"
											onkeyup="return delHangle(event)"
											class="col-lg-12">
									</div>
								</div>
							</div>
						</div>

						<!-- 동일 간격 주려고 css용 class 생성 -->
						<!-- 썸네일 파일 시작 -->
						<div>
							<h5>대표 이미지</h5>
							<div class="photoFile">
								<!-- <label>ThumbNail File</label> -->
								<!-- <p>썸네일 파일은 꼭 지정해주셔야 합니다</p> -->
								<div>
									<input type="file" name="photo" id="photo">
								</div>
							</div>
						</div>
						<!-- 썸네일 파일 끝	 -->
						<br><br>
						<!-- 디테일 파일 시작 -->
						<div>
							<h5>상세 이미지</h5>
							<div class="photoFile">
								<!-- <label>Detail File</label> -->
								<div id="fileResult"></div>
								<div>
									<button type="button" id="fileAdd">상세 이미지 추가</button>
								</div>
							</div>
						</div>
						<!-- 디테일 파일 끝	 -->
						<br><br>
						
						<input type="hidden" name="type" value="${type}">

						<button class="photoFile" type="button" id="btn">상품등록</button>

					</form>

					<br><br><!-- 지울까? -->
					<a href="javascript:history.back();" class="photoFile">상품리스트</a>
				</div>
			</div>
		</div>
	</div>


	<script>
		//ajax로도 처리 가능하고
		//c:foreach로 미리 가져와서도 처리 가능함(json말고)
		//나중에 javascript에서 처리
		//let data = '${typeList}';

		//타입 관련 JQUERY
		let typeList = JSON.parse('${typeList}');

		let type1Array = new Array();
		let type2Array = new Array();
		let type3Array = new Array();
		let type1Obj = new Object();
		let type2Obj = new Object();
		let type3Obj = new Object();

		let typeSelect1 = $(".type1");
		let typeSelect2 = $(".type2");
		let typeSelect3 = $(".type3");

		//타입 배열 초기화 메서드
		function makeTypeArray(obj, array, typeList, grade) {
			for (let i = 0; i < typeList.length; i++) {
				if (typeList[i].grade === grade) {
					obj = new Object();

					obj.typeName = typeList[i].typeName;
					obj.productType = typeList[i].productType;
					obj.typeTop = typeList[i].typeTop;

					array.push(obj);
				}
			}
		}

		// 배열 초기화
		makeTypeArray(type1Obj, type1Array, typeList, 1);
		makeTypeArray(type2Obj, type2Array, typeList, 2);
		makeTypeArray(type3Obj, type3Array, typeList, 3);

		// 대분류 <option> 태그
		for (let i = 0; i < type1Array.length; i++) {
			typeSelect1.append("<option value='"+type1Array[i].productType+"'>"
					+ type1Array[i].typeName + "</option>");
		}

		// 중분류 <option> 태그
		$(typeSelect1)
				.on(
						"change",
						function() {
							let selectVal1 = $(this).find("option:selected")
									.val();

							typeSelect2.children().remove();
							typeSelect3.children().remove();

							typeSelect2
									.append("<option value='none'>선택</option>")
							typeSelect3
									.append("<option value='none'>선택</option>")

							for (let i = 0; i < type2Array.length; i++) {
								if (selectVal1 === type2Array[i].typeTop) {
									typeSelect2
											.append("<option value='"+type2Array[i].productType+"'>"
													+ type2Array[i].typeName
													+ "</option>");
								}
							}
						});

		// 소분류 <option>태그
		$(typeSelect2)
				.on(
						"change",
						function() {

							let selectVal2 = $(this).find("option:selected")
									.val();

							typeSelect3.children().remove();

							typeSelect3
									.append("<option value='none'>선택</option>");

							for (let i = 0; i < type3Array.length; i++) {
								if (selectVal2 === type3Array[i].typeTop) {
									typeSelect3
											.append("<option value='"+type3Array[i].productType+"'>"
													+ type3Array[i].typeName
													+ "</option>");
								}
							}

						});
	</script>

	<script src="../resources/js/fileAdd.js"></script>
	<script src="../resources/js/oproductAdd.js"></script>
	<!-- 나중에 javascript에서 처리-->
	<!-- <script src="../resources/js/oproductType.js"></script> -->

	<c:import url="../template/footer.jsp"></c:import>
	<%-- <c:import url="../template/header_js.jsp"></c:import> --%>
	<!-- jquery 작동안해서 임시로 -->
	<!-- Js Plugins -->
	<script src="/s1/resources/js/jquery.nice-select.min.js"></script>
	<!-- 이 부분때문에 작동안함 -->
	<script src="/s1/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/s1/resources/js/bootstrap.min.js"></script>
	<script src="/s1/resources/js/jquery-ui.min.js"></script>
	<script src="/s1/resources/js/jquery.slicknav.js"></script>
	<script src="/s1/resources/js/mixitup.min.js"></script>
	<script src="/s1/resources/js/owl.carousel.min.js"></script>
	<script src="/s1/resources/js/main.js"></script>

</body>
</html>







