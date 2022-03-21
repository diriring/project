const fileResult = document.getElementById('fileResult');
const fileAdd = document.getElementById('fileAdd');
const del = document.getElementsByClassName('del');
let count = 1;
let num = 0; //id용도

//지우는것도 구현하자
fileAdd.addEventListener("click", function(){
    
    // count = count+1;
    

    if(count > 5){
        alert('첨부파일은 최대 5개만 가능');
        return;
    }

    let div = document.createElement("div"); //<div></div>
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

    count++;
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
