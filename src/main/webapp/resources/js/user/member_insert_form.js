let b_id_check = false;
let b_password_check = false;
let b_email_check = false;
let b_email_auth = false;
let b_birth_check = false;
let b_tel_check = false;

function send(f){

	let m_name = document.getElementById("m_name");	
	let m_username = document.getElementById("m_username");	
	
	if(!b_id_check){
		alert('아이디 중복체크를 해주세요')
		return;
	}
	
	if(!b_password_check){
		alert('비밀번호를 동일하게 맞춰주세요')
		return;
	}
	
	if(!b_email_check){
		alert('이메일 중복체크를 해주세요');
		return;
	}
	
	if(!b_email_auth){
		alert('이메일 인증을 해주세요');
		return;
	}
	
	if(!b_birth_check){
		alert('생년월일을 형식에 맞게 써주세요');
		return;
	}
	
	if(m_name.value == ''){
		alert('이름을 입력해주세요');
		return;
	}
	
	if(m_username.value == ''){
		alert('사용하실 닉네임을 입력해주세요');
		return;
	}
	
	
	
	f.method = "post";
	f.action = "member_insert";
	f.submit();
}

function check_id(f){
	let m_id = document.getElementById("m_id").value.trim();
	
	if(m_id == ''){
		id_check_alert.innerText = '아이디를 입력해주세요';
		id_check_alert.style.color = 'red';
		b_id_check = false;
		return;
	}
	
	let url = "check_id";
	
	let param = {
		"m_id": encodeURIComponent(m_id)
		
	};	
		
	send_request(url, param, i_check, "post");
}

function i_check(...args){
	
	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'ok_m_id'){
		id_check_alert.innerText = "사용가능한 아이디입니다.";
		id_check_alert.style.color = "#3781E3";
		form.m_id.focus();
		b_id_check = true;
		return;	
	} else {
		id_check_alert.innerText = "이미 사용중인 아이디입니다.";
		id_check_alert.style.color = 'red';
		b_id_check = false;
	}
}

function password_check(f) {
	let password_check_alert = document.getElementById("password_check_alert");
	let reg_password = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
	
	let m_password = f.m_password.value;
	if(m_password == ''){
		password_check_alert.innerText = "비밀번호를 입력하세요";
		password_check_alert.style.color = 'red';
		return;
	}else if(!reg_password.test(m_password)){
		password_check_alert.innerText = "올바른 비밀번호 형식이 아닙니다";
		password_check_alert.style.color = 'red';
		return;
	} else {
		password_check_alert.innerText = "비밀번호를 입력하셨습니다.";
		password_check_alert.style.color = "#3781E3";
	}
}
function re_password_check(f) {
	let password_check_alert = document.getElementById("password_check_alert");
	let re_password_check_alert = document.getElementById("re_password_check_alert");
	
	let m_password = document.getElementById("m_password").value.trim();
	let m_re_password = document.getElementById("m_re_password").value.trim();
	
	if(m_re_password == ''){
		re_password_check_alert.innerText = "비밀번호를 다시 입력하세요.";
		re_password_check_alert.style.color = 'red';
		b_password_check = false;
		return;
	}else if(m_password != m_re_password){
		re_password_check_alert.innerText = "비밀번호가 다릅니다.";
		re_password_check_alert.style.color = 'red';
		b_password_check = false;
		return;	
	}else{
		re_password_check_alert.innerText = "비밀번호가 같습니다.";
		re_password_check_alert.style.color = "#3781E3";
		b_password_check = true;
	}
}

function check_email(f){
	let m_email = document.getElementById("m_email").value;
	
	let reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(m_email == ''){
		email_check_alert.innerText = '이메일을 입력하세요';
		email_check_alert.style.color = 'red';
		b_email_check = false;
		b_email_auth = false;
		return;
	}
	
	if(!reg_email.test(m_email)){
		email_check_alert.innerText = '올바른 이메일 형식이 아닙니다';
		email_check_alert.style.color = 'red';
		b_emai_check = false;
		b_email_auth = false;
		return;
	}
	
	let url = "check_email";

	let param = {
		"m_email": encodeURIComponent(m_email)
	};
	send_request(url, param, e_check, "post");
}

function e_check(...args){
	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'ok_m_email'){
		email_check_alert.innerText = "사용가능한 이메일입니다.";
		email_check_alert.style.color = "#3781E3";
		b_email_check = true;
		b_email_auth = false;
		form.m_email.focus();
		return;
	} else {
		email_check_alert.innerText = "이미 사용중인 이메일입니다.";
		email_check_alert.style.color = 'red';
		b_email_check = false;
		return;
	}
}

function birth_check(f) {
    let birth_check_alert = document.getElementById("birth_check_alert");
    let m_date_of_birth = document.getElementById("m_date_of_birth").value.replace(/[^0-9]/g, '');
    let year = Number(m_date_of_birth.substr(0, 4));
    let month = Number(m_date_of_birth.substr(4, 2));
    let day = Number(m_date_of_birth.substr(6, 2));
    let today = new Date();
    let yearNow = today.getFullYear();
    let result;

    if (m_date_of_birth.length === 8) {
        if (1900 > year || year > yearNow || month < 1 || month > 12 || day < 1 || day > 31 || ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) || (month == 2 && (day > 29 || (day == 29 && !(year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)))))) {
            result = false;
        } else if (new Date(year, month - 1, day) > today) {
            result = false;
        } else {
            result = true;
        }
    } else {
        result = false;
    }

    if (result) {
        birth_check_alert.innerText = "올바른 형식입니다";
        birth_check_alert.style.color = "#3781E3";
        b_birth_check = true;
        return;
    } else {
        birth_check_alert.innerText = "생년월일 형식에 맞게 입력해주세요";
        birth_check_alert.style.color = 'red';
        b_birth_check = false;
        return;
    }
}

function tel_check(f) {
	let tel_check_alert = document.getElementById("tel_check_alert");
	let reg_tel = /^010[0-9]{8}$/;
	
	let m_tel = f.m_tel.value;
	if(m_password == ''){
		tel_check_alert.innerText = "전화번호를 입력하세요";
		tel_check_alert.style.color = 'red';
		b_tel_check = false;
		return;
	}else if(!reg_tel.test(m_tel)){
		tel_check_alert.innerText = "올바른 전화번호 형식이 아닙니다";
		tel_check_alert.style.color = 'red';
		b_tel_check = false;
		return;
	} else {
		tel_check_alert.innerText = "올바른 전화번호 형식입니다";
		tel_check_alert.style.color = "#3781E3";
		b_tel_check = true;
	}
}
