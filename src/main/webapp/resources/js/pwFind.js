const pwbtn = document.querySelector("#pwbtn");
const pwfrm = document.querySelector("#pwfrm");
const cancel = document.querySelector("#cancel");
const id = document.querySelector("#id");
const email = document.querySelector("#email");
const newPw = document.querySelector("#newPw");
const newPw2 = document.querySelector("#newPw2");

let pwconfirm = false;
let pcconfirm = false;

pwbtn.addEventListener("click", function() {
    if(id.value.length == 0) {
        alert('아이디를 입력해주세요.');
        id.focus();
        return;
    }
    if(email.value.length == 0) {
        alert('이메일을 입력해주세요.');
        email.focus();
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