<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="checkout__form spad"></div>
		<div class="section-title">
			<h2>상품 수정</h2>
		</div>


		<div class="row">
			<div class="col-lg-8" style="float: none; margin: 0 auto;">
				<form action="./update" method="POST" id="frm"
					enctype="multipart/form-data">

					<!-- productNum 넘기기 -->
					<input type="hidden" name="productNum" value="${dto.productNum}">

					<!-- 새로넣어보는 부분 -->

					<div class="form_section">
				<!-- 		<div class="form_section_title">
							<label>ProductType</label>
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
											value="${member.id}" class="col-lg-12" readonly>
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
								<div class="type_wrap checkout__input">
									<input type="text" name="productName" id="productName"
										placeholder="제품의 이름을 입력해 주세요" value="${dto.productName}"
										onkeyup="delHangleTrim(this);" onchange="delHangleTrim(this);"
										class="col-lg-12">
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
									<textarea rows="10" cols="134" name="productDetail"
										id="productDetail" placeholder="제품의 상세내용을 입력해 주세요" class="col-lg-12">${dto.productDetail}</textarea>
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
										value="${dto.productPrice}" placeholder="제품의 가격을 입력해 주세요"
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
										value="${dto.productDC}" placeholder="제품의 할인율을 입력해 주세요 ex) 10 -> 10%"
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
										value="${dto.productStock}" placeholder="제품의 수량을 입력해 주세요"
										onkeypress="return isNumberKey2(event)"
										onkeyup="return delHangle(event)"
										class="col-lg-12">
								</div>
							</div>
						</div>
					</div>

					<!-- 썸네일 파일 시작 -->
					<div>
						<h5>대표 이미지</h5>
						<div id="photoUpdateTop" class="photoFile imgThumb">
							<!-- <label>ThumbNail File</label> -->
							<c:choose>
								<c:when
									test="${not empty dto.oproductFileThumbDTO.fileNameThumb}">
									<div id="photoUpdate">
										<img alt="img"
											src="../resources/upload/oproduct/thumbnail/${dto.oproductFileThumbDTO.fileNameThumb}"
											id="img"> ${dto.oproductFileThumbDTO.oriNameThumb}
										<button type="button" class="photoDeleteBtn"
											data-productNum="${dto.productNum}"
											data-fileNum="${dto.oproductFileThumbDTO.fileNumThumb}"
											data-fileNameThumb="${dto.oproductFileThumbDTO.fileNameThumb}">X</button>
									</div>
								</c:when>
								<c:otherwise>
									<div id="photoUpdate">
										<input type="file" name="photo" id="photo">
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 썸네일 파일 끝	 -->
					<br><br>
					<!-- 디테일 파일 시작 -->
					<div>
						<h5>상세 이미지</h5>
						<div class="photoFile imgDetail">
							<!-- <label>Detail File</label> -->
							<div id="files">
								<c:forEach items="${dto.fileDTOs}" var="f">
									<div>
										<img alt="" src="../resources/upload/oproduct/${f.fileName}"
											class="img"> ${f.oriName}
										<button type="button" class="fileDeleteBtn"
											data-productNum="${dto.productNum}"
											data-fileNum="${f.fileNum}" data-fileName="${f.fileName}">X</button>
									</div>
								</c:forEach>
							</div>
	
							<div id="fileResult"></div>
	
							<div>
								<button type="button" id="fileAdd">FileAdd</button>
							</div>
						</div>
					</div>
					<!-- 디테일 파일 끝 -->
					<br><br>

					<input type="hidden" name="type" value="${type}">

					<button class="photoFile" type="button" id="btn">상품수정</button>

				</form>

			</div>
		</div>
	</div>



	<script>
		//업데이트시 구현(기존거 가지고 오기)
		//시작시 작동하는 함수
		$(document)
				.ready(
						function() {

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

							//배열 초기화
							makeTypeArray(type1Obj, type1Array, typeList, 1);
							makeTypeArray(type2Obj, type2Array, typeList, 2);
							makeTypeArray(type3Obj, type3Array, typeList, 3);

							let targetType2 = '';
							let targetType3 = '${dto.productType}';

							//소분류 가져오기
							for (let i = 0; i < type3Array.length; i++) {
								if (targetType3 === type3Array[i].productType) {
									targetType3 = type3Array[i];
								}
							}

							//none 없애기 위해 기존꺼 지웠다가 다시 생성(소분류)
							typeSelect3.children().remove();
							typeSelect3
									.append("<option value='none'>선택</option>");

							for (let i = 0; i < type3Array.length; i++) {
								if (targetType3.typeTop === type3Array[i].typeTop) {
									typeSelect3
											.append("<option value='"+type3Array[i].productType+"'>"
													+ type3Array[i].typeName
													+ "</option>");
								}
							}

							$(".type3 option").each(function(i, obj) {
								if (targetType3.productType === obj.value) {
									$(obj).attr("selected", "selected");
								}
							});

							//중분류 가져오기
							for (let i = 0; i < type2Array.length; i++) {
								if (targetType3.typeTop === type2Array[i].productType) {
									targetType2 = type2Array[i];
								}
							}

							//none 없애기 위해 기존꺼 지웠다가 다시 생성(중분류)
							typeSelect2.children().remove();
							typeSelect2
									.append("<option value='none'>선택</option>");

							for (let i = 0; i < type2Array.length; i++) {
								if (targetType2.typeTop === type2Array[i].typeTop) {
									typeSelect2
											.append("<option value='"+type2Array[i].productType+"'>"
													+ type2Array[i].typeName
													+ "</option>");
								}
							}

							$(".type2 option").each(function(i, obj) {
								if (targetType2.productType === obj.value) {
									$(obj).attr("selected", "selected");
								}
							});

							//대분류 가져오기

							//none 없애기 위해 기존꺼 지웠다가 다시 생성(대분류)
							typeSelect1.children().remove();
							typeSelect1
									.append("<option value='none'>선택</option>");

							for (let i = 0; i < type1Array.length; i++) {
								typeSelect1
										.append("<option value='"+type1Array[i].productType+"'>"
												+ type1Array[i].typeName
												+ "</option>");
							}

							$(".type1 option").each(function(i, obj) {
								if (targetType2.typeTop === obj.value) {
									$(obj).attr("selected", "selected");
								}
							});
						});
		//업데이트시 구현(기존거 가지고 오기) 끝
	</script>

	<script>
		//업데이트시 구현(기존거 수정하기) 시작
		//수정시 작동하는 JQUERY(add꺼 가지고옴)

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
		function makeTypeArray(obj, array, typeList1, grade) {
			for (let i = 0; i < typeList1.length; i++) {
				if (typeList[i].grade === grade) {
					obj = new Object();

					obj.typeName = typeList[i].typeName;
					obj.productType = typeList[i].productType;
					obj.typeTop = typeList[i].typeTop;

					array.push(obj);
				}
			}
		}

		//배열 초기화
		makeTypeArray(type1Obj, type1Array, typeList, 1);
		makeTypeArray(type2Obj, type2Array, typeList, 2);
		makeTypeArray(type3Obj, type3Array, typeList, 3);

		//중분류 <option>
		$(typeSelect1)
				.on(
						"change",
						function() {

							let selectVal1 = $(this).find("option:selected")
									.val();

							typeSelect2.children().remove();
							typeSelect3.children().remove();

							typeSelect2
									.append("<option value='none'>선택</option>");
							typeSelect3
									.append("<option value='none'>선택</option>");

							for (let i = 0; i < type2Array.length; i++) {
								if (selectVal1 === type2Array[i].typeTop) {
									typeSelect2
											.append("<option value='"+type2Array[i].productType+"'>"
													+ type2Array[i].typeName
													+ "</option>");
								}
							}
						});

		//소분류 <option>
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
		//업데이트시 구현(기존거 수정하기) 끝
	</script>

	<script src="../resources/js/fileUpdate.js"></script>
	<script src="../resources/js/oproductUpdate.js"></script>

	<c:import url="../template/footer.jsp"></c:import>
	<%-- <c:import url="../template/header_js.jsp"></c:import> --%>
	<!-- jquery 작동안해서 임시로 -->
	<!-- Js Plugins -->
	<!-- <script src="/s1/resources/js/jquery.nice-select.min.js"></script> -->
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



