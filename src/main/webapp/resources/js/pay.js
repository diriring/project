const selectBox = document.querySelector("#selectBox");
const addressNameResult = document.querySelector("#addressNameResult");
const addressResult = document.querySelector("#addressResult");


const pointBtn = document.querySelector("#pointBtn");
const payMoney = document.querySelector("#payMoney");
const totalPrice = document.querySelector("#totalPrice");
const pointUse = document.querySelector("#pointUse");
const pointSave = document.querySelector("#pointSave");

const payBtn = document.querySelector("#payBtn");
const payFrm = document.querySelector("#payFrm");

payBtn.addEventListener("click", function() {
    // console.log("click");
    let mAddress1 = document.querySelector("#mAddress1");
    let address = document.querySelector("#address");
    let detailAddress = document.querySelector("#detailAddress");
    let extraAddress = document.querySelector("#extraAddress");
    let arrive = document.querySelector("#arrive");

    arrive.value = address.value + extraAddress.value + detailAddress.value;
    if(mAddress1.value == "") {
        alert("우편번호는 필수입니다.")
        return;
    }
    if(detailAddress.value == "") {
        alert("상세주소를 입력해주세요.")
        detailAddress.focus();
        return;
    }
    
    //0408 value *1 넣어봄(재석) 일단뻄 중간
    payMoney.value = payMoney.value-pointUse.value;
    pointSave.value = (payMoney.value-pointUse.value)*0.05;

    // console.log("payMoney : ", payMoney.value);
    // console.log("totalPrice : ", totalPrice.value);
    // console.log(arrive.value);
    
    payFrm.submit();
})

pointBtn.addEventListener("click", function() {
    let max = pointUse.getAttribute("max");
    if(pointUse.value>max) {
        alert("보유하신 포인트를 초과하여 사용하실 수 없습니다.");
        pointUse.focus();
        return;
    }
    document.querySelector("#pointUseResult").innerHTML=(pointUse.value * 1).toLocaleString('ko-KR')+"M";
    document.querySelector("#totalPriceResult").innerHTML=(payMoney.value-pointUse.value).toLocaleString('ko-KR')+"원";
    //04.08 소숫점 값 내림 설정(재석)
    document.querySelector("#pointSaveResult").innerHTML =(math.floor((payMoney.value-pointUse.value)*0.05)).toLocaleString('ko-KR')+"M";
    //최종 결제할 때 totalPrice value 값 변경해줘야 함
})

selectBox.addEventListener("change", function(event) {
    // console.log("change");
    let maNum = event.target.value;
    // console.log(maNum);

    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../member/address/addressChoice?maNum="+maNum);
    xhttp.send();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            addressResult.innerHTML = this.responseText.trim();
        }
    }

});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('mAddress1').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
