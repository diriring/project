//이거 해결하고 체크박스 전체 체크까지 

let changeCheck = true;

//이걸 함수로 만들고
//만약 change가 생기면 함수를 다시 호출해서 그 값을 넣어주고
//값을 조정해서 재호출함
firstCode();

//체크박스가 체크되어있으면 실행
//체크박스가 해제되면 미실행

//없앨수도
const cartInput = document.querySelectorAll(".cartInput");
// const individual_check = document.querySelectorAll(".individual_check");
//없앨수도
const productPrice = document.querySelectorAll('.individual_productPrice');
const productAmount = document.querySelectorAll('.individual_productAmount');
const salePrice = document.querySelectorAll('.individual_salePrice');
const totalPrice = document.querySelectorAll('.individual_totalPrice');
const point = document.querySelectorAll('.individual_point');
const totalPoint = document.querySelectorAll('.individual_totalPoint');



function firstCode(){
    //이거 지울수도있음
    const individual_check = document.querySelectorAll(".individual_check");
    const individual_checkT = document.querySelector("#individual_checkT");
    const productPrice = document.querySelectorAll('.individual_productPrice');
    const productAmount = document.querySelectorAll('.individual_productAmount');
    const salePrice = document.querySelectorAll('.individual_salePrice');
    const totalPrice = document.querySelectorAll('.individual_totalPrice');
    const point = document.querySelectorAll('.individual_point');
    const totalPoint = document.querySelectorAll('.individual_totalPoint');

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

    let productAmountM = 0;
    let salePriceM = 0;
    let totalPriceM = 0;
    let totalPointM = 0;
    let finalPriceM = 0;
    let productPriceM = 0;
    let pointM = 0;

    cal();
    feeCheck();
    finalCheck();

    const productPriceT = document.querySelector("#individual_productPriceC");
    const productAmountT = document.querySelector("#individual_productAmountC");
    const salePriceT = document.querySelector("#individual_salePriceC");
    const totalPriceT = document.querySelector("#individual_totalPriceC");
    const pointT = document.querySelector("#individual_pointC");
    const totalPointT = document.querySelector("#individual_totalPointC");
    

    function cal(){

        for(c of cartInput){

            if(individual_checkT.value == 'checked'){
                productAmountM = productAmountM + productAmountT.getAttribute("value");
                productPriceM = productPriceM + parseInt(productPriceT.getAttribute("value")); 
                productAmountM = productAmountM + parseInt(productAmountT.getAttribute("value")); 
                salePriceM = salePriceM + parseInt(salePriceT.getAttribute("value")); 
                totalPriceM = totalPriceM + parseInt(totalPriceT.getAttribute("value")); 
                pointM = pointM + parseInt(pointT.getAttribute("value")); 
                totalPointM = totalPointM + parseInt(totalPointT.getAttribute("value")); 
            }
        
            //총 상품수
            productAmountC =  productAmountC + productAmountM;
            //총 상품가격
            totalPriceC = totalPriceC + productPriceM;
            //총 마일리지
            totalPointC = totalPointC + pointM;

        }
    }


        // for(p of productPrice){
        //     productPriceC += parseInt(p.value);  
        // }
        // for(p of productAmount){
        //     productAmountC += parseInt(p.value);
        // }
        // for(p of salePrice){
        //     salePriceC += parseInt(p.value);
        // }
        // for(p of totalPrice){
        //     totalPriceC += parseInt(p.value);
        // }
        // for(p of totalPoint){
        //     totalPointC += parseInt(p.value);
        // }
    // }

    //아직 미사용
    // if(changeCheck){
    //     console.log("change!!");
    //     function cal(){
    //         for(p of productPrice){
    //             productPriceC += parseInt(p.value);  
    //         }
    //         for(p of productAmount){
    //             productAmountC += parseInt(p.value);
    //         }
    //         for(p of salePrice){
    //             salePriceC += parseInt(p.value);
    //         }
    //         for(p of totalPrice){
    //             totalPriceC += parseInt(p.value);
    //         }
    //         for(p of totalPoint){
    //             totalPointC += parseInt(p.value);
    //         }
    //     }
    //     changeCheck = false;

    // }else{

    // }
    
    //-------------------- 여기부터 새로

    // const productPriceT = document.querySelector("#individual_productPriceC");
    // const productAmountT = document.querySelector("#individual_productAmountC");
    // const salePriceT = document.querySelector("#individual_salePriceC");
    // const totalPriceT = document.querySelector("#individual_totalPriceC");
    // const pointT = document.querySelector("#individual_pointC");
    // const totalPointT = document.querySelector("#individual_totalPointC");
    
    // let productAmountM = 0;
    // let salePriceM = 0;
    // let totalPriceM = 0;
    // let totalPointM = 0;
    // let finalPriceM = 0;
    // let productPriceM = 0;


    // //console.log(productPriceT);
    // //기본 값 계산식
    // function cal(){
    //     for(c of individual_check){
    //         if(c.getAttribute("checked")){
    //             //console.log(productPriceT.getAttribute("value"));
    //             productPriceM = productPriceM + parseInt(productPriceT.getAttribute("value")); 
    //             productAmountM = productAmountM + parseInt(productAmountT.getAttribute("value")); 
    //             salePriceM = salePriceM + parseInt(salePriceT.getAttribute("value")); 
    //             totalPriceM = totalPriceM + parseInt(totalPriceT.getAttribute("value")); 
    //             //pointM += parseInt(pointT.getAttribute("value")); 
    //             totalPointM = totalPointM + parseInt(totalPointT.getAttribute("value")); 
    //         }
    //         productAmountC = productAmountC + productAmountM;
    //         salePriceC = salePriceC + salePriceM;
    //         totalPriceC = totalPriceC + totalPriceM;
    //         totalPointC = totalPointC + totalPointM;
    //     }
    // }

    

    //-------------------- 여기까지 

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
const cartInputC = document.querySelector("#cartInputC");
cartInputC.addEventListener("change", function(event){

    if(event.target.classList.contains('individual_check')){

        //여기서 요소를 넣어주면 실행하는 코드를 위에 작성해놓기?
        //일단 이게 실행되면 위에 append는 지워주는 코드작성
        changeCheck = true;
        firstCode(changeCheck);

        //append된 내용 삭제 후 재등록
        totalPriceInput.innerHTML = "";
        totalAmountInput.innerHTML = "";
        deliveryFee.innerHTML = "";
        finalPriceInput.innerHTML = "";
        totalPointInput.innerHTML = "";


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