function send_id(f){
	let mail_check = document.getElementById("mail_check_input_info").value;
	
	if(mail_check.value == '인증번호가 일치합니다.'){
			f.action = "register_modify_id";
			f.submit();	
		} else {
			alert('인증번호를 정확히 적어주세요');
				return;
		}
	
}
