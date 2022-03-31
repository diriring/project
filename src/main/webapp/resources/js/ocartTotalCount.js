//이거 해결하고 체크박스 전체 체크까지 

let changeCheck = false;

//이걸 함수로 만들고
//만약 change가 생기면 함수를 다시 호출해서 그 값을 넣어주고
//값을 조정해서 재호출함
firstCode();

//체크박스가 체크되어있으면 실행
//체크박스가 해제되면 미실행

const cartInput = document.querySelector("#cartInput");
const individual_check = document.querySelectorAll(".individual_check");

function firstCode(){
    const individual_check = document.querySelectorAll(".individual_check");
    const productPrice = document.querySelectorAll('.individual_productPrice');
    const productAmount = document.querySelectorAll('.individual_productAmount');
    const salePrice = document.querySelectorAll('.individual_salePrice');
    const totalPrice = document.querySelectorAll('.individual_totalPrice');
    const point = document.querySelectorAll('.individual_point');
    const totalPoint = document.querySelectorAll('.individual_totalPoint');

    //아직 이 더해지는 부분 해결해야함
    let productAmountM = 0;
    let salePriceM = 0;
    let totalPriceM = 0;
    let totalPointM = 0;
    let finalPriceM = 0;
    let productPriceM = 0;


    //생각은 밑에처럼 각각 가격 다 가지고 오고
    // 변수 새로 생성 각각해서 ++로 다 담아주고
    //그걸 총 가격 책정하는 div에 각각 값 넣어서 추가해주면 될듯?
    let productAmountC = 0;
    let salePriceC = 0;
    let totalPriceC = 0;
    let totalPointC = 0;
    let finalPriceC = 0;
    let dFee = 0;
    let productPriceC = 0;
    let pointC = 0;

    //아직 미사용
    // if(changeCheck){
    //     console.log("change!!")
    // }
    


    //기본 값 계산식
    function cal(){
        //현재 미사용
        for(c of individual_check){
            //console.log("come?");
           // console.log(c.getAttribute("checked"));

            if(c.getAttribute("checked")){

                for(p of productPrice){
                    //이부분 M
                    productPriceM = productPriceM + parseInt(p.value);
                }
                for(p of productAmount){
                    //console.log(p.value);
                    productAmountM = productAmountM + parseInt(p.value);
                }
                //console.log(productAmountC);
                for(p of salePrice){
                    salePriceM = salePriceM + parseInt(p.value);
                }
                for(p of totalPrice){
                    totalPriceM = totalPriceM + parseInt(p.value);
                }
                for(p of totalPoint){
                    totalPointM = totalPointM + parseInt(p.value);
                }

                //이부분
                productAmountC += productAmountM
                salePriceC += salePriceM
                totalPriceC += totalPriceM
                totalPointC += totalPointM


            }    

        }
        
    }

    //배송비 : 총 금액 30000원이상이면 0원, 기본 3000원
    function feeCheck(){
        if(totalPriceC >= 30000){
            dFee = 0;
        }else{
            dFee = 3000;
        }
    }

    //배송비 + 총금액
    function finalCheck(){
        finalPriceC = dFee + totalPriceC;
        //console.log(finalPriceC);
    }

    cal();
    feeCheck();
    finalCheck();

    //총 상품 가격
    const totalPriceInput = document.querySelector("#totalPriceInput");
    let addPrice = document.createElement("span");
    addPrice.className = "totalPrice_span";
    addPrice.innerText = totalPriceC.toLocaleString()+" 원";
                        //.toLocaleString() 0,000원 값으로 리턴
    totalPriceInput.append(addPrice);

    //총 주문 상품수
    const totalAmountInput = document.querySelector("#totalAmountInput");
    let addAmount = document.createElement("span");
    addAmount.className = "totalKind_span";
    addAmount.innerText = productAmountC.toLocaleString()+" 개";
    totalAmountInput.append(addAmount);

    //배송비
    const deliveryFee = document.querySelector("#deliveryFee");
    let fee = document.createElement("span");
    fee.className = "delivery_price";
    fee.innerText = dFee.toLocaleString()+" 원";
    deliveryFee.append(fee);

    //총 결제 예상 금액
    const finalPriceInput = document.querySelector("#finalPriceInput");
    let addFeePrice = document.createElement("span");
    addFeePrice.className = "finalTotalPrice_span";
    addFeePrice.innerText = finalPriceC.toLocaleString()+" 원";
    finalPriceInput.append(addFeePrice);

    //총 적립 마일리지
    const totalPointInput = document.querySelector("#totalPointInput");
    let addPoint = document.createElement("span");
    addPoint.className = "totalPoint_span";
    addPoint.innerText = totalPointC.toLocaleString()+" M";
    totalPointInput.append(addPoint);
}



//장바구니 변화시 금액 변화

//일단 맨위로 올려봄
//const cartInput = document.querySelector("#cartInput");
//onst individual_check = document.querySelectorAll(".individual_check");

cartInput.addEventListener("change", function(event){

    if(event.target.classList.contains('individual_check')){

        //여기서 요소를 넣어주면 실행하는 코드를 위에 작성해놓기?
        // changeCheck = true;
        // firstCode(changeCheck);

    }


});

///기본실행은 해놓고
//위에 change가 발생하면
//cartInput이 자동 실행을 하게 하고
//그럼 기본적으로 위에도 catInput이 들어가야함
//거기서 일단 true면 다 계산을 하게하고 append를 해놓고
//check박스가 true일때만 코드를 작성(이건 전역변수로해놓기)
//아래 함수에서 change가 발생하면 기존에 넣었던 span들을 다 지우고
//새로 넣어주게 실행
//changeCheck의 true false는 필요한지? 안필요할거같고 지우는거 cartInput 클릭시 하는거로하고
//어차피 firstCode는 기본실행이니까
//그럼 위 함수에 cartInput을 자동으로 하게해줘야함
//예를들어 addEvent발생시가 아니고 일단 기본 검사
//그럼 걍 individual_check로만 잠만