const pwbtn = document.querySelector("#pwbtn");
const pwfrm = document.querySelector("#pwfrm");
const cancel = document.querySelector("#cancel");
const id = document.querySelector("#id");
const pw = document.querySelector("#pw");
const newPw = document.querySelector("#newPw");
const newPw2 = document.querySelector("#newPw2");

let pwconfirm = false;
let pcconfirm = false;

cancel.addEventListener("click", function() {
    window.location.href="./mypage";
});

pwbtn.addEventListener("click", function() {
    if(pw.value.length == 0) {
        alert('현재 비밀번호를 입력해주세요.');
        pw.focus();
        return;
    }
    if(!pwconfirm) {
        alert('새 비밀번호를 확인해주세요.');
        newPw.focus();
        return;
    }
    if(!pcconfirm) {
        alert('비밀번호가 일치하지 않습니다');
        newPw2.focus();
        return;
    }
    // console.log("click");
    pwfrm.submit();
})

newPw.addEventListener("keyup", function() {
    pwResult.innerHTML="8글자 이상 입력해주세요.";
    if(newPw.value.length >= 8) {
        pwResult.innerHTML="사용 가능한 비밀번호 입니다."
        pwconfirm = true;
        if(newPw.value.length > 12) {
            pwResult.innerHTML="12글자 이하로 입력해주세요"
            pwconfirm = false;
        }
    }
});

newPw.addEventListener("change", function() {
    newPw2.value='';
    pcResult.innerHTML='';
    newPw2.focus();
});

newPw2.addEventListener("keyup", function() {
    pcResult.innerHTML="비밀번호가 일치하지 않습니다.";
    if(newPw.value == newPw2.value) {
        pcResult.innerHTML="비밀번호가 일치합니다.";
        pcconfirm = true;
    }else {
        pcconfirm = false;
    }
});