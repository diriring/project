const joinbtn = document.querySelector("#joinbtn");
const joinfrm = document.querySelector("#joinfrm");
const name = document.getElementById("name");
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const pwCheck = document.getElementById("pwCheck")
const birth = document.getElementById("birth");
const phone = document.getElementById("phone");
const email = document.getElementById("email");

const idCheckBtn = document.getElementById("idCheckBtn");
const emailCheckBtn = document.getElementById("emailCheckBtn");

let nameconfirm = false;
let idconfirm = false;
let uniqueId = false;
let pwconfirm = false;
let pcconfirm = false;
let uniqueEmail = false;
// let birthconfirm = false;
// let phoneconfirm = false;
// let emailconfirm = false;

const year = document.getElementById("year");
for(let i=2022;i>=1900;i--) {
    let option = document.createElement("option");
    option.setAttribute("value", i);
    option.innerHTML = i;

    year.append(option);
}

const month = document.getElementById("month");
for(let i=1;i<=12;i++) {
    let option = document.createElement("option");
    option.setAttribute("value", i);
    option.innerHTML = i;

    month.append(option);
}

const day = document.getElementById("day");
for(let i=1;i<=31;i++) {
    let option = document.createElement("option");
    option.setAttribute("value", i);
    option.innerHTML = i;

    day.append(option);
}

const phone1 = document.getElementById("phone1");
const phone2 = document.getElementById("phone2");
const phone3 = document.getElementById("phone3");
for(let i=10;i<=19;i++) {
    let option = document.createElement("option");
    option.setAttribute("value", "0"+i);
    option.innerHTML = "0"+i;

    phone1.append(option);
}

const email1 = document.getElementById("email1");
const email2 = document.getElementById("email2");

joinbtn.addEventListener("click", function() {
    
    if(!nameconfirm) {
        alert('필수입력 항목입니다.');
        name.focus();
        return;
    }
    if(!idconfirm) {
        alert('아이디를 입력해주세요.');
        id.focus();
        return;
    }
    if(!uniqueId) {
        alert('아이디 중복 확인이 필요합니다.');
        return;
    }
    if(!pwconfirm) {
        alert('비밀번호를 확인해주세요.');
        pw.focus();
        return;
    }
    if(!pcconfirm) {
        alert('비밀번호가 일치하지 않습니다');
        pwCheck.focus();
        return;
    }
    if(year.value.length == 0) {
        alert('생년월일을 입력해주세요.');
        return;
    }
    if(month.value.length == 0) {
        alert('생년월일을 입력해주세요.');
        return;
    }
    if(day.value.length == 0) {
        alert('생년월일을 입력해주세요.');
        return;
    }
    if(phone1.value.length == 0) {
        alert('전화번호를 입력해주세요.');
        return;
    }
    if(phone2.value.length == 0) {
        alert('전화번호를 입력해주세요.');
        return;
    }
    if(phone3.value.length == 0) {
        alert('전화번호를 입력해주세요.');
        return;
    }
    if(email1.value.length == 0) {
        alert('email을 입력하세요');
        return;
    }
    if(email2.value.length == 0) {
        alert('email을 입력하세요');
        return;
    }
    if(!uniqueEmail) {
        alert('이메일 중복 확인이 필요합니다.');
        return;
    }

    birth.value = year.value + "-" + month.value + "-" + day.value;
    phone.value = phone1.value + "-" + phone2.value + "-" + phone3.value;
    email.value = email1.value + "@" + email2.value;
    
    // console.log(phone.value);
    // console.log(birth.value);
    // console.log(email.value);

    joinfrm.submit();
});

name.addEventListener("blur", function() {
    if(name.value.length == 0) {
        nameResult.innerHTML="이름은 입력 필수 입니다."
    }else {
        nameconfirm = true;
    }
});

id.addEventListener("blur", function() {
    if(id.value.length == 0) {
        idResult.innerHTML="아이디는 입력 필수 입니다."
    }else {
        idconfirm = true;
    }
});

id.addEventListener("change", function() {
    uniqueId=false;
    idResult.innerHTML="아이디 중복 확인이 필요합니다."
});

pw.addEventListener("keyup", function() {
    pwResult.innerHTML="8글자 이상 입력해주세요.";
    if(pw.value.length >= 8) {
        pwResult.innerHTML="사용 가능한 비밀번호 입니다."
        pwconfirm = true;
        if(pw.value.length > 12) {
            pwResult.innerHTML="12글자 이하로 입력해주세요"
            pwconfirm = false;
        }
    }
});

pw.addEventListener("change", function() {
    pwCheck.value='';
    pcResult.innerHTML='';
    pwCheck.focus();
});

pwCheck.addEventListener("keyup", function() {
    pcResult.innerHTML="비밀번호가 일치하지 않습니다.";
    if(pw.value == pwCheck.value) {
        pcResult.innerHTML="비밀번호가 일치합니다.";
        pcconfirm = true;
    }else {
        pcconfirm = false;
    }
});

email1.addEventListener("change", function() {
    uniqueEmail=false;
    emailResult.innerHTML="이메일 중복 확인이 필요합니다."
})

email2.addEventListener("change", function() {
    uniqueEmail=false;
    emailResult.innerHTML="이메일 중복 확인이 필요합니다."
})
//-----------------------------------------------------------------
//중복 확인 ajax
idCheckBtn.addEventListener("click", function() {
    // console.log("아이디 중복 체크")
    let xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./idCheck");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("id="+id.value);

    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            let result = this.responseText.trim();
            if(result == '0') {
                alert("사용 가능한 아이디입니다.");
                idResult.innerHTML="사용 가능한 아이디입니다.";
                uniqueId=true;
            }else {
                alert("사용하실 수 없는 아이디입니다.");
                uniqueId=false;
            }
        }
    }
    
});

emailCheckBtn.addEventListener("click", function() {
    // console.log("이메일 중복 체크");
    email.value = email1.value + "@" + email2.value;
    let xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./emailCheck");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("email="+email.value);

    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            let result = this.responseText.trim();
            if(result == '0') {
                alert("사용 가능한 이메일입니다.");
                emailResult.innerHTML="사용 가능한 이메일입니다.";
                uniqueEmail=true;
            }else {
                alert("사용하실 수 없는 이메일입니다.");
                uniqueEmail=false;
            }
        }
    }
});


