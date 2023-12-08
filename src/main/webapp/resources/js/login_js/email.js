let code = "num";  /*인증번호 저장할 곳*/

document.getElementById('auth_btn').addEventListener('click', function() {
    let m_email = document.getElementById('m_email').value;  /*입력한 이메일*/
    
    console.log('완성된 이메일 : ' + m_email); /* 이메일 오는지 확인*/
    let checkInput = document.getElementsByClassName('mail_check_input')[0]; /* 인증번호 입력 */

    fetch('mail_check?m_email=' + m_email)
        .then(response => response.text())
        .then(data => {
            console.log("data : " + data);
            checkInput.disabled = false; /*데이터가 성공적으로 들어오면 인증번호 입력란이 활성화되도록*/
            code = data;
            alert('인증번호가 전송되었습니다.');
        })
        .catch(error => console.error('Error:', error));
});

document.getElementsByClassName('mail_check_input')[0].addEventListener('input', function() {
    let inputCode = document.getElementsByClassName("mail_check_input")[0].value;   /*사용자가 입력한 전송 번호*/
    let checkResult = document.getElementById("mail_check_input_info");  /* 비교 결과 */

    if (inputCode === code) { // 일치할 경우
        checkResult.innerHTML = "인증번호가 일치합니다.";
        checkResult.className = "correct";
        document.getElementsByClassName("mail_check_input")[0].style.border = "1.5px solid #3781E3";/*일치할 경우 테두리 색 변경*/
        document.getElementsByClassName("mail_check_input")[0].style.color = "#3781E3";/*일치할 경우 글자 색 변경*/
        document.getElementById("mail_check_input_info").style.color = "#3781E3";
        b_email_auth = true;
    } else {                                            
        checkResult.innerHTML = "인증번호를 다시 확인해주세요.";
        checkResult.className = "correct";
        document.getElementsByClassName("mail_check_input")[0].style.border = "1.5px solid red";
        document.getElementsByClassName("mail_check_input")[0].style.color = "red";
        document.getElementById("mail_check_input_info").style.color = "red";
        b_email_auth = false;
    }
});