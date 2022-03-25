const updatefrm = document.querySelector("#updatefrm");
const updatebtn = document.querySelector("#updatebtn");
const name = document.getElementById("name");
const birth = document.getElementById("birth");
const phone = document.getElementById("phone");

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

updatebtn.addEventListener("click", function() {
    if(name.value.length == 0) {
        alert('필수입력 항목입니다.');
        name.focus();
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

    birth.value = year.value + "-" + month.value + "-" + day.value;
    phone.value = phone1.value + "-" + phone2.value + "-" + phone3.value;

    updatefrm.submit();
});


