//수량 체크
const count_check = document.querySelector("#count_check");
const plus_btn = document.querySelector("#plus_btn");
const minus_btn = document.querySelector("#minus_btn");

plus_btn.addEventListener("click", function(){
    count_check.value++;
   // console.log(count_check.value);
});

minus_btn.addEventListener("click", function(){
    if(count_check.value > 1){
        count_check.value--;
    }
});

//장바구니 담기(ajax 연결)
const button_set = document.querySelector('#button_set');
const btn_cart = document.querySelectorAll(".btn_cart");
const btn_buy = document.querySelectorAll(".btn_buy");

button_set.addEventListener("click", function(event){

    if(event.target.classList.contains('btn_cart')){

        //console.log(count_check.value);
        let productAmount = count_check.value;
        let id = event.target.getAttribute("data-id")
        let productNum = event.target.getAttribute("data-proNum")
        console.log(productAmount);
        console.log(id);
        console.log(productNum);
        let xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../ocart/add")
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+id+"&productNum="+productNum+"&productAmount="+productAmount);
        xhttp.onreadystatechange=function(){
            if(this.readyState == 4 && this.status==200){
                result = this.responseText.trim();
                if(result == '0'){
					alert("장바구니에 추가를 하지 못하였습니다.");
				} else if(result == '1'){
					alert("장바구니에 추가되었습니다.");
				} else if(result == '2'){
					alert("장바구니에 이미 추가되어져 있습니다.");
				} else if(result == '5'){
					alert("로그인이 필요합니다.");	
				}
            }
        }



    }


});