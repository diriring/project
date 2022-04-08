const ok = document.querySelector("#ok");
const num = document.querySelector("#num");
const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const productReview = document.querySelector("#productReview");

const fileInput = document.getElementById("upload_file");
const fileAdd = document.getElementById("fileAdd");
const fileResult = document.getElementById("fileResult");
const del = document.getElementsByClassName("del");


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

//add (ajax아님 )

let count = 0;
let num1 = 0;

fileAdd.addEventListener("click",function(){

    if(count>2){
        alert("리뷰사진은 3개까지 가능합니다")
        return;
    }
    count ++

    let div = document.createElement('div');
    div.setAttribute("id","del"+num);

    let file = document.createElement("input");
    file.setAttribute("type","file");
    file.setAttribute("name","files");

    let button = document.createElement('button');
    button.setAttribute("type", "button");
    button.className="del";
    button.setAttribute("data-num", "del"+num);
    button.innerHTML="파일 지우기";

    div.append(file);
    div.append(button);
    
    fileResult.append(div);

    num1++;
});

fileResult.addEventListener("click", function(event){
    let cn = event.target;
   

    if(cn.classList.contains('del')){
        let delNum = cn.getAttribute("data-num");
        document.getElementById(delNum).remove();

        count--;
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