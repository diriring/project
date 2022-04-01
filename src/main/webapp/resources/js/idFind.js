const idFindBtn = document.querySelector("#idFindBtn");
const idFindFrm = document.querySelector("#idFindFrm");
const email = document.querySelector("#email")

idFindBtn.addEventListener("click", function() {
    if (email.value.length == 0) {
        email.focus();
        return;
    }
    
    idFindFrm.submit();
});