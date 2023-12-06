let b_id_check = false;
let b_email_check = false;

function send(f){
	let m_id = document.getElementById("m_id");	
	let m_password = document.getElementById("m_password");
	let m_check_password = document.getElementById("m_check_password");
	let m_date_of_birth = document.getElementById("m_date_of_birth");
	let m_name = document.getElementById("m_name");	
	let m_username = document.getElementById("m_username");	
	let m_tel = document.getElementById("m_tel");	
	let m_email = document.getElementById("m_email");	
	let mail_check_input = document.getElementById("mail_check_input");	
	
	let reg_tel = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	let reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let reg_birth = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
	
	if(m_id.value == ''){
		alert('아이디를 입력하세요');
		return;
	}
	
	if(m_password.value == ''){
		alert('비밀번호를 입력하세요');
		return;
	}
	
	if(m_password.value != m_check_password.value) {
		alert("입력한 비밀번호를 다시 확인해주세요.");
		return;
	}
	
	if(m_name.value == ''){
		alert('이름을 입력하세요');
		return;
	}
	
	if(m_username.value == ''){
		alert('닉네임을 입력하세요');
		return;
	}
	
	if(!reg_tel.test(m_tel.value)){
		alert('전화번호 형식을 맞춰서 써주세요');
		return;
	}
	
	if(!reg_email.test(m_email.value)){
		alert('이메일 형식을 맞춰서 써주세요');
		return;
	}
	
	if(mail_check_input.value == ''){
		alert('인증번호를 입력하세요');
		return;
	}
	
	if(!reg_birth.test(m_date_of_birth.value)) {
		alert('생년월일 형식을 맞춰서 써주세요');
		return;
	}
	
	if(code != mail_check_input.value) {
		alert(code);
		alert('인증번호를 확인해주세요');
		return;
	}
	
	if(!b_id_check){
		alert('아이디 중복체크를 하세요');
		return;
	}
	
	if(!b_email_check){
		alert('이메일 중복체크를 하세요');
		return;
	}
	
	f.action = "member_insert";
	f.submit();
}

function check_id(f){
	let m_id = document.getElementById("m_id").value.trim();
	
	if(m_id == ''){
		alert('아이디를 입력하세요');
		return;
	}
	
	let url = "check_id";
	
	let param = {
		"m_id": encodeURIComponent(m_id)
		
	};	
		
	sendRequest(url, param, i_check, "post");
}

function i_check(...args){

	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'ok_m_id'){
		alert('사용 가능한 아이디 입니다.');
		b_id_check = true;
		form.m_id.focus();
		return;	
	} else {
		alert('중복된 아이디가 존재합니다.');
			
	}
}


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
		b_email_check = true;
		form.m_email.focus();
		return;
	} else {
		alert('이메일이 존재합니다');
	}
}


function change(){
	b_id_check = false;
	b_email_check = false;
}