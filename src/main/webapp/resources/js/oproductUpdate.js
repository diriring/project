const frm = document.querySelector('#frm');
const productName = document.querySelector('#productName');
const productDetail = document.querySelector('#productDetail');
const productPrice = document.querySelector('#productPrice');
const productDC = document.querySelector('#productDC');
const productStock = document.querySelector('#productStock');
const btn = document.querySelector('#btn');

let productNameCheck = false;
let productDetailCheck = false;
let productPriceCheck = false;
let productDCCheck = false;
let productStockCheck = false;

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

btn.addEventListener("click", function(){

    if(productNameCheck && productDetailCheck && productPriceCheck && productDCCheck && productStockCheck){
        frm.submit();
    }else{
        alert('모두 입력해주세요');
    }

});

