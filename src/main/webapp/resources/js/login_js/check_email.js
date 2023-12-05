function check_email(f){
	let m_email = document.getElementById("m_email").value;
	
	if(m_email == ''){
		alert('이메일을 입력해주세요');
		f.m_email.focus();
		return;
	}
	
	let url = "check_email";

	let param = {
		"m_email": encodeURIComponent(m_email)
	};
	sendRequest(url, param, e_check, "post");
}

function e_check(...args){
	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'no m_email'){
		alert('사용 가능한 이메일입니다.');
		form.m_email.focus();
		return;
	} else {
		alert('이메일이 존재합니다');
	}
}
