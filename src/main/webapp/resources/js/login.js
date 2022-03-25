/**
 * 
 */

const loginbtn = document.querySelector("#loginbtn");
const loginfrm = document.querySelector("#loginfrm");
const id = document.getElementById("id");
const pw = document.getElementById("pw");

loginbtn.addEventListener("click", function() {
    if(id.value == "") {
        alert("아이디를 입력해주세요.");
    }else if(id.value != "" && pw.value == "") {
        alert("비밀번호를 입력해주세요.");
    }else if(id.value != "" && pw.value != "") {
        loginfrm.submit();
    }
});
