const fileAdd = document.getElementById("fileAdd");
const fileResult = document.getElementById("fileResult");
const del = document.getElementsByClassName("del");

//디테일의 이미지!!
const imgDetail = document.querySelectorAll(".img");

let count=0;
let num=0; //id용도

let result = '';

imgCount();



console.log("17번"+count);

function imgCount(){
    console.log("이미지카운트 하는지");
    if(result == '1'){
        console.log("21번"+count);
        count--;
        console.log("23번"+count);
    }else{
        for(i of imgDetail){
            console.log("else");
            count++;
        }
    }
}

fileAdd.addEventListener("click", function(){
    count++;
    if(count>3){
        alert('첨부파일은 최대 3개까지 만 가능합니다');
        count=3;
        return ;
    }

 
    
    let div = document.createElement('div');   //<div></div>
    div.setAttribute("id", "del"+num);
    
    let file = document.createElement("input"); //<input>
    file.setAttribute("type", "file");          //<input type="file">
    file.setAttribute("name", "files");         //<input type="file" name="files">

    let button = document.createElement('button'); //<button></button>
    button.setAttribute("type", "button");
    button.className="del";
    button.setAttribute("data-num", "del"+num);
    button.innerHTML="파일삭제";

    div.append(file);
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

//---------------------------------------------------
const fileDeleteBtn = document.querySelectorAll(".fileDeleteBtn");
const files = document.querySelector("#files");

//각각의 fileNum을 console에 출력
files.addEventListener("click", function(event){
    if(event.target.classList.contains("fileDeleteBtn")){
        
        let check = confirm("삭제시 복구 불가능합니다 삭제하시겠습니까?");

        if(!check){
            return;
        }


        let fileNum = event.target.getAttribute("data-fileNum");
        
        
        let xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./fileDelete");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("fileNum="+fileNum);

         //응답 처리
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                console.log(this.responseText);
                result = this.responseText.trim();
                if(result=='1'){
                    console.log("file 삭제");
                    event.target.parentNode.remove();
                    imgCount();
                }else {

                }
            }
        }        

    }
});