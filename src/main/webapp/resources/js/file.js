const fileResult = document.getElementById('fileResult');
const fileAdd = document.getElementById('fileAdd');
const del = document.getElementsByClassName('del');
const img = document.querySelectorAll('.img');
let count = 0;
let num = 0;
let result = '';
//이걸 한번만 실행하면 되는데
//지금 click 누를때마다 실행되서 문제임
//function으로 한번만?
//img 숫자세는 함수 - 총 2번실행
imgCount();

function imgCount(){
    //imgCountC = count;
    if(result == '1'){
        count--;
    }else{
        for(i of img){
            count++;
        }
    }
}

//지우는것도 구현하자
fileAdd.addEventListener("click", function(){
    count++;
    if(count > 5){
        alert('첨부파일은 최대 5개만 가능');
        count = 5;
        return;
    }

    let div = document.createElement("div");//div 태그 생성
    div.setAttribute("id", "del"+num);


    let add = document.createElement("input");
    add.setAttribute("type", "file");
    add.setAttribute("name", "files");

    let button = document.createElement("button");
    button.setAttribute("type", "button");
    button.setAttribute("data-num", "del"+num);
    button.className="del";
    button.innerText='DEL';


    div.append(add);
    div.append(button);

    fileResult.append(div);
    num++;
});


fileResult.addEventListener("click", function(event){

    let cn = event.target;

    if(cn.classList.contains('del')){
        let delNum = cn.getAttribute("data-num");
        document.getElementById(delNum).remove();
        count--;
    }
});

//---------- file Update ---------------
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
        let productNum = event.target.getAttribute("data-productNum");
        //console.log(productNum);
        let fileName = event.target.getAttribute("data-fileName")
        //파라미터 : fileNum, method : post, URL : deleteFile, Controller : deleteFile
        let xhttp = new XMLHttpRequest();
            xhttp.open("POST", "./deleteFile")
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("fileNum="+fileNum+"&productNum="+productNum+"&fileName="+fileName);
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

    //UPDATE 진행해야함(위에 관련 count체크 완료)
 
});
