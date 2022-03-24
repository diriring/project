const idCheckBtn = document.getElementById("idCheckBtn");
const emailCheckBtn = document.getElementById("emailCheckBtn");
const id = document.querySelector("#id");

idCheckBtn.addEventListener("click", function() {
    // console.log("아이디 중복 체크")
    let xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./idCheck");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("id="+id.value);
    
});