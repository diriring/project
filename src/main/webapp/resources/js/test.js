const individual_check = document.querySelectorAll(".individual_check");
const all_check_input = document.querySelector("#size"); //임의로 size 바꿔야함

//전체동의 탭 이건 일단 하나 있어야할듯
all_check_input.addEventListener("click", function(){
    for(i of individual_check){
        i.checked = all_check_input.checked;
    }
    cal();
});

//개별동의 탭
const rules = document.querySelectorAll(".rules");
for (r of rules){
    r.addEventListener("click", function(){
        let final = true;
        for(i of individual_check){
            if(!i.checked){
                final = false;
            }
        }
        all_check_input.checked = final;
        cal();
    });
}



//체크에 클릭이 발생했을때 발동함
for(i of individual_check){
   
    i.addEventListener("click", function(){
        //클릭이 발생했을때 계산식 발동
        cal();
    });

}

const totalPrice_span = document.querySelector('#totalPrice_span');
const delivery_price = document.querySelector('#delivery_price');
const totalAmount_span = document.querySelector('#totalAmount_span');
const finalTotalPrice_span = document.querySelector('#finalTotalPrice_span');
const totalPoint_span = document.querySelector('#totalPoint_span');


//페이지가 처음 떴을때 실행하는 계산식
cal();

//계산식 총금액
function cal(){
    
    //console.log(individual.checked);

    let totalPrice = 0;
    let totalPoint = 0;
    let totalAmount = 0;

    
    for(individual of individual_check){
        //console.log(individual.checked);
        if(individual.checked){

            //console.log(individual.nextSibling.nextSibling.nextSibling.value);
            //이게 중요했음 각각의 id를 확인하게 해주는 코드
            let cartId = individual.getAttribute("data-num");
            
            // 판매가 변수
            let price = document.querySelector('#individual_salePriceC'+cartId).value;
            
            // 포인트 변수
            let point = document.querySelector('#individual_pointC'+cartId).value;

            // 수량 변수
            let amount = document.querySelector('#individual_productAmountC'+cartId).value;

            //총금액 더해주기
            totalPrice = totalPrice + price*amount;
            totalPoint = totalPoint + point*amount;
            totalAmount = totalAmount*1 + amount*1;
           
        }
        
    }

    let fee = 3000;
    if(totalPrice >= 30000){
        fee = 0;
    }

    totalPrice_span.innerHTML=totalPrice +" 원";
    delivery_price.innerHTML= fee +" 원";
    finalTotalPrice_span.innerHTML=fee+totalPrice +" 원";
    totalAmount_span.innerHTML=totalAmount +" 개";
    totalPoint_span.innerHTML=totalPoint +" M";

}

const frm = document.querySelector("#frm");

//버튼 클릭시 넘어가게
const btn = document.querySelector("#btn");
btn.addEventListener("click", function(event){
    let check = false;
    //여기서 토탈 프라이스, 토탈 포인트,
    //파이널 토탈 프라이스, 멤버아이디 넘겨주면 될듯
    //일단 위 주석 수행안함
    for(i of individual_check){
       if(i.checked){
            check = true;
       }
    }
    //체크검사가 필요한거고 체크가 하나라도 있으면 되게해야ㅐ함
    if(check){
        frm.submit();
    }else{
        alert('주문탭에 담긴 상품이 없습니다.');
        event.preventDefault();
    }
});




