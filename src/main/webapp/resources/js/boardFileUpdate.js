const fileResult = document.getElementById('fileResult');
const fileAdd = document.getElementById('fileAdd');
const del = document.getElementsByClassName('del');
//디테일의 이미지!!
const imgDetail = document.querySelectorAll(".img");
const frm = document.querySelector('#frm');
const btn = document.querySelector('#btn');

let count = 0;
let num1 = 0;
let result = '';

function imgCount(){
    //imgCountC = count;
    if(result == '1'){
        count--;
    }else{
        for(i of imgDetail){
            count++;
        }
    }
}

fileAdd.addEventListener("click", function(){
    count++;
    if(count > 3){
        alert('첨부파일은 최대 3개까지 가능합니다');
        count = 3;
        return;
    }

    let div = document.createElement("div");//div 태그 생성
    div.setAttribute("id", "del"+num1);


    let add = document.createElement("input");
    add.setAttribute("type", "file");
    add.setAttribute("name", "files");

    let button = document.createElement("button");
    button.setAttribute("type", "button");
    button.setAttribute("data-num", "del"+num1);
    button.className="del";
    button.innerText='DEL';


    div.append(add);
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

    const fileDeleteBtn = document.querySelectorAll('.fileDeleteBtn');
const files = document.querySelector('#files');

files.addEventListener("click", function(event){
    //DELETE 먼저 완성
    if(event.target.classList.contains('fileDeleteBtn')){
        let check = confirm("삭제시 복구가 어렵습니다")
        if(!check){
            return;
        }

        let fileNum = event.target.getAttribute("data-fileNum");
        //console.log(fileNum);
        let num = event.target.getAttribute("data-num");
        //console.log(productNum);
        let fileName = event.target.getAttribute("data-fileName")
        //파라미터 : fileNum, method : post, URL : deleteFile, Controller : deleteFile
        let xhttp = new XMLHttpRequest();
            xhttp.open("POST", "./deleteFile")
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("fileNum="+fileNum+"&num="+num+"&fileName="+fileName);
            xhttp.onreadystatechange=function(){
                if(this.readyState == 4 && this.status==200){
                    //result 전역변수로 바꾸니 해결
                    result = this.responseText.trim();
                    if(result == '1'){
                        event.target.parentNode.remove();
                        //img 숫자세는 함수
                        imgCount();
                    }else{
                    } 
                }
            }
    }

    
 
});

btn.addEventListener("click", function(){

    
            frm.submit();
       

});



