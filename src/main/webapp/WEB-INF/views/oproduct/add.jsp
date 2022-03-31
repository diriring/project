<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/type.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import> 

	<h1>OProduct Add Page</h1>
	
	<form action="./add" method="POST" id="frm" enctype="multipart/form-data">
	
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductType</label>
			</div>
			<div class="form_section_content" id="type">
				<div class="type_wrap">
					<span>대분류</span>
					<select class="type1">
						<option selected value="none">선택</option>
					</select>
				</div>
				<div class="type_wrap">
					<span>중분류</span>
					<select class="type2">
						<option selected value="none">선택</option>
					</select>
				</div>
				<div class="type_wrap">
					<span>소분류</span>
					<select class="type3" name="productType">
						<option selected value="none">선택</option>
					</select> 
				</div> 
			</div>
		</div>
		
		<div class="form_section">
			<div class="form_section_title">
				<label>Writer</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<input type="text" name="writer" id="writer" value="${member.id}" readonly>
				</div> 
			</div>
		</div>
		
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductName</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<input type="text" name="productName" id="productName" placeholder="제품의 이름을 입력해 주세요">
				</div> 
			</div>
		</div>
		
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductDetail</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<textarea rows="10" cols="" name="productDetail" id="productDetail"  placeholder="제품의 상세내용을 입력해 주세요"></textarea>
				</div> 
			</div>
		</div>
		
		
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductPrice</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<!-- 어떻게 리턴 옮길까? -->
					<input type="text" name="productPrice" id="productPrice"  placeholder="제품의 가격을 입력해 주세요" onkeypress="return isNumberKey2(event)" onkeyup="return delHangle(event)">
				</div> 
			</div>
		</div>
		
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductDC</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<!-- 어떻게 리턴 옮길까? -->
					<input type="text" name="productDC" id="productDC" placeholder="제품의 할인율을 입력해 주세요" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)">%
				</div> 
			</div>
		</div>
		
		<div class="form_section">
			<div class="form_section_title">
				<label>ProductStock</label>
			</div>
			<div class="form_section_content">
				<div class="type_wrap">
					<!-- 어떻게 리턴 옮길까? -->
					<input type="text" name="productStock" id="productStock"  placeholder="제품의 수량을 입력해 주세요" onkeypress="return isNumberKey2(event)" onkeyup="return delHangle(event)">
				</div> 
			</div>
		</div>
		
		<!-- 썸네일 파일 시작 -->
		<div>
			<label>ThumbNail File</label>
			<!-- <p>썸네일 파일은 꼭 지정해주셔야 합니다</p> -->
			<div>
				<input type="file" name="photo" id="photo">
			</div>
		</div>
		<!-- 썸네일 파일 끝	 -->

		<!-- 디테일 파일 시작 -->
		<div>
			<label>Detail File</label>
			<div id="fileResult"></div>
			<div>
				<button type="button" id="fileAdd">FileDetail</button>
			</div>
		</div>
		<!-- 디테일 파일 끝	 -->

		<button type="button" id="btn">ADD</button>
		
	</form>
	
	
	<a href="./list">List</a>
	
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
		function makeTypeArray(obj,array,typeList,grade){
			for(let i = 0; i < typeList.length; i++){
				if(typeList[i].grade === grade){
					obj = new Object();
					
					obj.typeName = typeList[i].typeName;
					obj.productType = typeList[i].productType;
					obj.typeTop = typeList[i].typeTop;
			
					array.push(obj);				
				}
			}
		}

		// 배열 초기화
		makeTypeArray(type1Obj,type1Array,typeList,1);
		makeTypeArray(type2Obj,type2Array,typeList,2);
		makeTypeArray(type3Obj,type3Array,typeList,3);

		// 대분류 <option> 태그
		for(let i = 0; i < type1Array.length; i++){
			typeSelect1.append("<option value='"+type1Array[i].productType+"'>" + type1Array[i].typeName + "</option>");
		}
		
		// 중분류 <option> 태그
		$(typeSelect1).on("change",function(){
			let selectVal1 = $(this).find("option:selected").val();
			
			typeSelect2.children().remove();
			typeSelect3.children().remove();
			
			typeSelect2.append("<option value='none'>선택</option>")
			typeSelect3.append("<option value='none'>선택</option>")
			
			for(let i = 0; i < type2Array.length; i++){
				if(selectVal1 === type2Array[i].typeTop){
					typeSelect2.append("<option value='"+type2Array[i].productType+"'>" + type2Array[i].typeName + "</option>");	
				}
			}	
		});
		
		// 소분류 <option>태그
		$(typeSelect2).on("change",function(){
			
			let selectVal2 = $(this).find("option:selected").val();
			
			typeSelect3.children().remove();
			
			typeSelect3.append("<option value='none'>선택</option>");		
			
			for(let i = 0; i < type3Array.length; i++){
				if(selectVal2 === type3Array[i].typeTop){
					typeSelect3.append("<option value='"+type3Array[i].productType+"'>" + type3Array[i].typeName + "</option>");	
				}
			}	
			
		});	
		
	</script> 

	<script src="../resources/js/fileAdd.js"></script>
	<script src="../resources/js/oproductAdd.js"></script>
	<!-- 나중에 javascript에서 처리-->
	<!-- <script src="../resources/js/oproductType.js"></script> -->
	

</body>
</html>







