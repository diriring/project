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


