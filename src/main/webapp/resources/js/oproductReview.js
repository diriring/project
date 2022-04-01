const ok = document.querySelector("#ok");
const num = document.querySelector("#num");
const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const productReview = document.querySelector("#productReview");
const ReviewAdd =document.querySelector("#ReviewAdd");


getList();
// -------------------list ajax ------------------
function getList(){
    const xhttp = new XMLHttpRequest();
    console.log("List 가져오는중");
    xhttp.open("GET", "../oproductReview/list?num="+num.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            console.log(this.responseText);
            productReview.innerHTML = this.responseText.trim();
            console.log("List 가져오는거 성공");
        }
    }

}



// ----------------- add ajax -------------------
ok.addEventListener("click",function(){

    const xhttp = new XMLHttpRequest();

  xhttp.open("POST","../oproductReview/add");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send("num="+num.value+"&writer="+writer.value+"&contents="+contents.value);

 xhttp.onreadystatechange = function(){
    if(this.readyState == 4 && this.status == 200){
        console.log(this.responseText);
        let result = this.responseText.trim();
        if(result=='1'){
            alert('리뷰가 등록 되었습니다');
            
            getList();
        }else {
            alert('리뷰등록이 실패했습니다.');
        }
    }
}
});
//update
productReview.addEventListener("click",function(event){
    if(event.target.classList.contains('update')){
       
        let num = event.target.getAttribute('data-index'); //num
        let replyNum = document.querySelector("#up"+num); //td
        
        let text = replyNum.innerText;
        replyNum.innerText='';

        let tx = document.createElement('textarea');
        tx.setAttribute("id","update"+num);
        tx.classList.add('ok');
        tx.setAttribute("data-num", num);
        tx.value = text;
        console.log(tx);
        replyNum.append(tx);
    }


});
//update 실행
productReview.addEventListener("change",function(event){
    if(event.target.classList.contains('ok')){
        let contents = event.target.value;
        let replyNum = event.target.getAttribute("data-num");

        let check = window.confirm("수정 하시겠습니까?");

        if(check){
            let xhttp = new XMLHttpRequest();

            xhttp.open("POST", "../oproductReview/update");

            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhttp.send("replyNum="+replyNum+"&contents="+contents);

            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    if(this.responseText.trim()=='1'){
                        alert('수정완료');
                        document.querySelector("#up"+replyNum).innerHTML=contents;
                    }else {
                        alert('수정실패');
                    }
                }

            }


        }

    }

});

//delete
productReview.addEventListener("click",function(event){

    if(event.target.classList.contains('delete')){
        let replyNum = event.target.getAttribute("data-num");
        
        
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../oproductReview/delete");//포스트기 때문에 뒤에 ? 안씀

        //요청 header 정보 Post로 할때는 이걸 넣어줄것 !
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        
        xhttp.send("replyNum="+replyNum);


        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                if(this.responseText.trim()=='1'){
                    alert('삭제성공');
                    getList();
                }else {
                    alert('삭제실패');
                }
            }

        }
    }

});