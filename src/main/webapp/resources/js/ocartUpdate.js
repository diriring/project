
//수량 변경 탭
const quantity_div = document.querySelectorAll(".quantity_div");
for(q of quantity_div){
   
    let cartId = q.getAttribute("data-num");
    
    // 카운트체크
    let count_check = document.querySelector("#count_check"+cartId);
    
    // 플러스버튼
    let plus_btn = document.querySelector("#plus_btn"+cartId);

    // 마이너스버튼
    let minus_btn = document.querySelector("#minus_btn"+cartId);

    plus_btn.addEventListener("click", function(){
        count_check.value++;
        console.log(count_check.value);
    });
    
    minus_btn.addEventListener("click", function(){
        if(count_check.value > 1){
            count_check.value--;
        }
    });


    //수정 탭
    const update_frm = document.querySelector("#update_frm");
    const update_cartId = document.querySelector("#update_cartId");
    const update_productAmount = document.querySelector("#update_productAmount");
    let quantity_modify_btn = document.querySelector("#quantity_modify_btn"+cartId);

    quantity_modify_btn.addEventListener("click", function(event){
        update_cartId.setAttribute("value", event.target.getAttribute("data-cartId"));
        update_productAmount.setAttribute("value", count_check.value);
        update_frm.submit();
    });


    //삭제 탭
    const delete_frm = document.querySelector("#delete_frm");
    const delete_cartId = document.querySelector("#delete_cartId");
    let delete_btn = document.querySelector("#delete_btn"+cartId);

    delete_btn.addEventListener("click",function(event){
        delete_cartId.setAttribute("value", event.target.getAttribute("data-cartId"));
        delete_frm.submit();
    });

}






