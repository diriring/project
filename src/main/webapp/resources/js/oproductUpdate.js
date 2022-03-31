const frm = document.querySelector('#frm');
const productName = document.querySelector('#productName');
const productDetail = document.querySelector('#productDetail');
const productPrice = document.querySelector('#productPrice');
const productDC = document.querySelector('#productDC');
const productStock = document.querySelector('#productStock');
const btn = document.querySelector('#btn');

//writer는 기본입력이고 수정불가라 뺌

//처음 typeCheck 는 true를 줌 add와 다르게
//이후 change가 발동되면 false로
let typeCheck1 = true;
let typeCheck2 = true;
let typeCheck3 = true;
//photoCheck는 밑 imgCheck로 재구현
//let photoCheck = false;
let productNameCheck = false;
let productDetailCheck = false;
let productPriceCheck = false;
let productDCCheck = false;
let productStockCheck = false;


//분류도 동일하게 focus 주는게 있어야함

//대분류 태그
const type1 = document.querySelectorAll(".type1")
for(t1 of type1){
    t1.addEventListener("change", function(){
        console.log("click1");
        let type1 = t1.options[t1.selectedIndex].value;
        console.log(type1);
        if(type1 =='none'){
            typeCheck1 = false;  
        }else{
            typeCheck1 = true;
            //중간에 변경시 update 되는 오류잡기
            typeCheck2 = false;
        }
 })
}

//중분류 태그
const type2 = document.querySelectorAll(".type2")
for(t2 of type2){
    t2.addEventListener("change", function(){
        console.log("click2");
        let type2 = t2.options[t2.selectedIndex].value;
        console.log(type2);
        if(type2 =='none'){
            typeCheck2 = false;  
        }else{
            typeCheck2 = true;
            //중간에 변경시 update 되는 오류잡기
            typeCheck3 = false;
        }
 })
}


//소분류 태그
const type3 = document.querySelectorAll(".type3");
for(t3 of type3){
    t3.addEventListener("change", function(){
        console.log("click3");
        let type3 = t3.options[t3.selectedIndex].value;
        console.log(type3);
        if(type3 =='none'){
            typeCheck3 = false;  
        }else{
            typeCheck3 = true;
        }
    })
}


//썸네일 이미지 체크 함수(마지막 btn넘길때 보내는것)
let imgCheck = true;
//썸네일 이미지 지워졌을때 처음에만 확인가능 변수
let imgDeleteCheck = false;
//썸네일 이미지 지워진거 확인 함수
imgDelete();
function imgDelete(){
    //썸네일 이미지 id로 가져오기
    const imgThumb = document.querySelector("#img");
    if(imgThumb == null){
        imgCheck = false;
        imgDeleteCheck = true;
        if(imgCheck == false){
            //console.log("이거 중요2" + imgCheck);
           const photo = document.querySelector("#photo");
            photo.addEventListener("change", function(){
                //console.log(photo.value);
                if(photo.value == ''){
                    imgCheck = false;
                }else{
                    imgCheck = true;
                }
            });
        }
    }else{
        imgCheck = true;
    }
}



productName.focus();
productName.addEventListener("blur", function(){
    if(productName.value == ''){
        productNameCheck = false;
    }else{
        productNameCheck = true;
    }
});

productDetail.focus();
productDetail.addEventListener("blur", function(){
    if(productDetail.value == ''){
        productDetailCheck = false;
    }else{
        productDetailCheck = true;
    }
});

productPrice.focus();
productPrice.addEventListener("blur", function(){
    if(productPrice.value == ''){
        productPriceCheck = false;
    }else{
        productPriceCheck = true;
    }
});

productDC.focus();
productDC.addEventListener("blur", function(){
    if(productDC.value == ''){
        productDCCheck = false;
    }else{
        productDCCheck = true;
    }
});

productStock.focus();
productStock.addEventListener("blur", function(){
    if(productStock.value == ''){
        productStockCheck = false;
    }else{
        productStockCheck = true;
    }
});


// //클릭할때 focus주기
// function foo(){
//     t1.focus();
//     t2.focus();
//     t3.focus();
// }

btn.addEventListener("click", function(){

    //누르는 순간 지워졌는지를 판단해야함
    if(imgDeleteCheck == false){
        //처음에만 실행가능
        imgDelete();
    }
    if(imgCheck == false){
         alert('썸네일 파일은 꼭 입력해주셔야합니다')   
    }else{
        if(imgCheck && typeCheck1 && typeCheck2 && typeCheck3 && productNameCheck && productDetailCheck && productPriceCheck && productDCCheck && productStockCheck){
            frm.submit();
        }else{
            alert('모두 입력해주세요');
        }
    }

});


//숫자
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
        if(event.keyCode != 46){ //숫자와 .만 입력가능
            return false;
        }
    }

    //소숫점(.)이 두번 이상 나오지 못하게
    let _pattern0 = /^\d*[.]\d*$/; //현재 value 값에 소숫점(.)이 있으면 . 입력불가
    if(_pattern0.test(_value)){
        if(charCode == 46){
            return false;
        }
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

    //소숫점 둘째자리까지만 입력가능
    let _pattern2 = /^\d*[.]\d{2}$/; //현재 value 값이 소숫점 둘째자리 숫자이면 더이상 입력 불가
    // {숫자}의 값을 변경하면 자릿수를 조정할 수 있다.
    if(_pattern2.test(_value)){
        alert("소수점 둘째자리까지만 입력가능합니다.")
        return false;
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



