const fileResult = document.getElementById('fileResult');
const fileAdd = document.getElementById('fileAdd');
const fileResultThumb = document.getElementById('fileResultThumb');
const fileThumb = document.getElementById('fileThumb');
const del = document.getElementsByClassName('del');
//디테일의 이미지!!
const imgDetail = document.querySelectorAll(".img");
//디테일
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
        for(i of imgDetail){
            count++;
        }
    }
}


//파일추가 최대 5개 설정(지우는것도 구현하자)
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

//----------  디테일 file Update ajax ---------------
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




//================== thumbnail 수정 =========
const photoDeleteBtn = document.querySelectorAll('.photoDeleteBtn');
const photoUpdate = document.querySelector('#photoUpdate');

// let tx = document.createElement('input');
// tx.setAttribute("type","file");
// tx.setAttribute("id","photo");
// tx.setAttribute("name","photo");
// photoUpdate.append(tx);

photoUpdate.addEventListener("click", function(event){
    //DELETE 먼저 완성
    if(event.target.classList.contains('photoDeleteBtn')){
        let check = confirm("삭제시 복구가 어렵습니다")
        if(!check){
            return;
        }

        let fileNumThumb = event.target.getAttribute("data-fileNum");
        //console.log(fileNum);
        let productNum = event.target.getAttribute("data-productNum");
        //console.log(productNum);
        let fileNameThumb = event.target.getAttribute("data-fileNameThumb")
        //파라미터 : fileNum, method : post, URL : deleteFile, Controller : deleteFile
        let xhttp = new XMLHttpRequest();
            xhttp.open("POST", "./deleteFileThumb")
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("fileNumThumb="+fileNumThumb+"&productNum="+productNum+"&fileNameThumb="+fileNameThumb);
            xhttp.onreadystatechange=function(){
                if(this.readyState == 4 && this.status==200){
                    //result 전역변수로 바꾸니 해결
                    result = this.responseText.trim();
                    if(result == '1'){
                        //발동되면 div까지 다 삭제
                        event.target.parentNode.remove();
                        //이후 이 함수로 div태그 새로 생성
                        photoDelete();
                    }else{
                    } 
                }
            }

    }

    //UPDATE 진행해야함(위에 관련 count체크 완료)
 
});

//photoUpdate 지워졌을때
const photoUpdateTop = document.querySelector("#photoUpdateTop");
//이걸 함수로해서 지우는 순간 생성?
function photoDelete(){

    let div = document.createElement("div");//div 태그 생성
    div.setAttribute("id", "photoUpdate");

    let add = document.createElement('input');//그 안 input태그 생성
    add.setAttribute("type","file");
    add.setAttribute("name","photo");
    add.setAttribute("id","photo");

    //이건 photo 자동생성이라 del 버튼을 만들 필요가 없음
    // let button = document.createElement("button");
    // button.setAttribute("type", "button");
    // button.setAttribute("data-num", "del");
    // button.className="del";
    // button.innerText='DEL';

    div.append(add);
    //div.append(button);

    photoUpdateTop.append(div);
}

// 지울수있음 ==============
//기존 썸네일 파일 유무
// fileupdate에서 해보자
// let imgCheck = false;
// //썸네일의 이미지!!
// const imgThumb = document.querySelector("#img");
// //썸네일

// //지우는순간 이 코드를 실행?
// console.log(imgThumb.alt);
// function imgDelete(){
//     if(imgThumb.alt == ''){
//         console.log("Nook")
//         imgCheck = false;
//     }else{
//         console.log("ok")
//         imgCheck = true;
//     }
// }
// 지울수있음 ==============



//photoUpdate 생성시
//이건 photo 자동생성이라 del 버튼을 만들 필요가 없음
// photoUpdate.addEventListener("click", function(event){
//     let cn = event.target;
//     if(cn.classList.contains('del')){
//         photoDelete();
//         let delNum = cn.getAttribute("data-num");
//         document.getElementById(delNum).remove();
//         countT--;
//     }
// });

