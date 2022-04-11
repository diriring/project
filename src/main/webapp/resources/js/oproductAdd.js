const frm = document.querySelector('#frm');
const writer = document.querySelector('#writer');
const productName = document.querySelector('#productName');
const productDetail = document.querySelector('#productDetail');
const productPrice = document.querySelector('#productPrice');
const productDC = document.querySelector('#productDC');
const productStock = document.querySelector('#productStock');
const btn = document.querySelector('#btn');
//const type = document.querySelector('#type');

let typeCheck1 = false;
let typeCheck2 = false;
let typeCheck3 = false;
let photoCheck = false;
let writerCheck = false;
let productNameCheck = false;
let productDetailCheck = false;
let productPriceCheck = false;
let productDCCheck = false;
let productStockCheck = false;

//대분류 태그
const type1 = document.querySelectorAll(".type1")
for(t1 of type1){
    t1.addEventListener("change", function(){
        //console.log("click1");
        let type1 = t1.options[t1.selectedIndex].value;
        //console.log(type1);
        if(type1 =='none'){
            typeCheck1 = false;  
        }else{
            typeCheck1 = true;
            //중간에 변경시 add 되는 오류잡기
            typeCheck2 = false;
        }
 })
}

//중분류 태그
const type2 = document.querySelectorAll(".type2")
for(t2 of type2){
    t2.addEventListener("change", function(){
        //console.log("click2");
        let type2 = t2.options[t2.selectedIndex].value;
        //console.log(type2);
        if(type2 =='none'){
            typeCheck2 = false;  
        }else{
            typeCheck2 = true;
            //중간에 변경시 add 되는 오류잡기
            typeCheck3 = false;
        }
 })
}


//소분류 태그
const type3 = document.querySelectorAll(".type3");
for(t3 of type3){
        t3.addEventListener("change", function(){
            //console.log("click3");
            let type3 = t3.options[t3.selectedIndex].value;
            //console.log(type3);
            if(type3 =='none'){
                typeCheck3 = false;  
            }else{
                typeCheck3 = true;
            }
     })
}

//썸네일 파일 유무 확인
const photo = document.querySelector("#photo");
console.log(photo.value);
photo.addEventListener("change", function(){
    //console.log(photo.value);
    if(photo.value == ''){
        photoCheck = false;
    }else{
        photoCheck = true;
    }
});



writer.focus();
writer.addEventListener("blur", function(){
    if(writer.value == ''){
        writerCheck = false;
    }else{
        writerCheck = true;
    }
});

//일단 공백 체크 이거로(04.05)
productName.addEventListener("blur", function(){
    let blank_pattern = /^\s+|\s+$/g; // 공백체크
        if(productName.value == ''){
            productNameCheck = false;
        }else{
            //앞뒤 문자 다 없애고 공백만 남겼을때 공백만 있으면 발동
            if(productName.value.replace(blank_pattern, '') == ""){
                //일단 맨 앞에 공백있어도 넘어가게 해놓음
                alert(' 공백만 입력되었습니다 ');
                productName.value = null;
                productNameCheck = false;
            }else{
                alert('중복체크 해주세요!');
                productNameCheck = true;
            }
        }
});


productDetail.addEventListener("blur", function(){
    if(productDetail.value == ''){
        productDetailCheck = false;
    }else{
        productDetailCheck = true;
    }
});


productPrice.addEventListener("blur", function(){
    if(productPrice.value == ''){
        productPriceCheck = false;
    }else{
        productPriceCheck = true;
    }
});


productDC.addEventListener("blur", function(){
    if(productDC.value == ''){
        productDCCheck = false;
    }else{
        productDCCheck = true;
    }
});


productStock.addEventListener("blur", function(){
    if(productStock.value == ''){
        productStockCheck = false;
    }else{
        productStockCheck = true;
    }
});


btn.addEventListener("click", function(){
    if(!photoCheck){
        alert('썸네일 파일은 꼭 입력해주셔야합니다');
    }else{
        if(uniqueName && photoCheck && typeCheck1 && typeCheck2 && typeCheck3 && writerCheck && productNameCheck && productDetailCheck && productPriceCheck && productDCCheck && productStockCheck){
            frm.submit();
        }else{
            alert('모두 입력해주세요');
        }
    }
});

//이름 중복체크(04.11)
let uniqueName = false;
const nameCheckBtn = document.querySelector("#nameCheckBtn");
nameCheckBtn.addEventListener("click", function() {

    if(productName.value == ''){
        alert("이름을 입력해주세요.")
        return;
    }else{
        let xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./nameCheck");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        //특수문자 인식시키기 위해 encodeURIComponent 추가
        xhttp.send("productName="+encodeURIComponent(productName.value));
    
        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                let result = this.responseText.trim();
                if(result == '0') {
                    alert("사용 가능한 이름입니다.");
                    uniqueName=true;
                }else {
                    alert("사용하실 수 없는 이름입니다.");
                    uniqueName=false;
                }
            }
        }  
    }
});







// 공백사용못하게(04.05)
// function delHangleTrim(obj) { 
//     var str_space = /\s/;  // 공백체크
//     if(str_space.exec(obj.value)) { //공백 체크
//         alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
//         obj.focus();
//         obj.value = obj.value.replace(' ',''); // 공백제거
//         return false;
//     }
// }



function delHangle(evt){//한글을 지우는부분, keyup부분에 넣어준다
    let objTarget = evt.srcElement||evt.target;
    //let objTarget = event.target;
    let _value = event.srcElement.value;
    if(/[ㄱ-ㅎㅏ-ㅡ가-힣]/g.test(_value)){
        // objTarget.value = objTarget.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-힣]/g,'');
        objTarget.value = null;
        //return false;
    }
}

function isNumberKey(evt){ // 숫자를 제외한 값은 입력하지 못함
    let charCode = (evt.which)? evt.which:event.keyCode;
    let _value = event.srcElement.value;
    if(event.keyCode < 48 || event.keyCode > 57){
        alert('숫자만 입력 가능합니다')
        return false;
    }

    //두자리 이하의 숫자만 입력가능
    let _pattern1 = /^\d{2}$/; //현재 value 값이 2자리 숫자이면 . 만 입력가능
    //{숫자}의 값을 변경하면 자릿수를 조정할 수 있다.
    if(_pattern1.test(_value)){
        if(charCode != 46){
            alert("두자리 이하의 숫자만 입력 가능합니다.");
            return false;
        }
    }

    return true;
}

//price, stock 적용
function isNumberKey2(evt){ // 숫자를 제외한 값은 입력하지 못함
    //console.log(event.which);
    let charCode = (evt.which)? evt.which:event.keyCode;
    let _value = event.srcElement.value;
    if(event.keyCode < 48 || event.keyCode > 57){
        alert('숫자만 입력 가능합니다')
        return false;
    }
    return true;
}


//밑에 삭제가능(04.05)
// 소숫점 아래까지 적용시
// function isNumberKey(evt){ // 숫자를 제외한 값은 입력하지 못함
//     let charCode = (evt.which)? evt.which:event.keyCode;
//     let _value = event.srcElement.value;
//     if(event.keyCode < 48 || event.keyCode > 57){
//         if(event.keyCode != 46){ //숫자와 .만 입력가능
//             return false;
//         }
//     }

//     //소숫점(.)이 두번 이상 나오지 못하게
//     let _pattern0 = /^\d*[.]\d*$/; //현재 value 값에 소숫점(.)이 있으면 . 입력불가
//     if(_pattern0.test(_value)){
//         if(charCode == 46){
//             return false;
//         }
//     }

//     //두자리 이하의 숫자만 입력가능
//     let _pattern1 = /^\d{2}$/; //현재 value 값이 2자리 숫자이면 . 만 입력가능
//     //{숫자}의 값을 변경하면 자릿수를 조정할 수 있다.
//     if(_pattern1.test(_value)){
//         if(charCode != 46){
//             alert("두자리 이하의 숫자만 입력 가능합니다.");
//             return false;
//         }
//     }

//     //소숫점 둘째자리까지만 입력가능
//     let _pattern2 = /^\d*[.]\d{2}$/; //현재 value 값이 소숫점 둘째자리 숫자이면 더이상 입력 불가
//     // {숫자}의 값을 변경하면 자릿수를 조정할 수 있다.
//     if(_pattern2.test(_value)){
//         alert("소수점 둘째자리까지만 입력가능합니다.")
//         return false;
//     }
//     return true;

// }
