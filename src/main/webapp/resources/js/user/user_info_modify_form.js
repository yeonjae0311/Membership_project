
let b_birth_check = false;
let b_tel_check = false;

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

function toggle_password(e){
	let pw_input = document.getElementById("m_password");
	let toggle_icon = e.target;

	if(pw_input.type == "password"){
		pw_input.type = "text";
		toggle_icon.src = IMG_PATH + "eye_open_icon.png";
	}else{
		pw_input.type = "password";
		toggle_icon.src = IMG_PATH + "eye_closed_icon.png";
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

function send(f){
	
	let m_name = document.getElementById("m_name");	
	
	if(!b_birth_check){
		alert('생년월일을 형식에 맞게 써주세요');
		return;
	}
	
	if(!b_tel_check){
		alert('전화번호 형식에 맞게 써주세요');
		return;
	}
	
	if(m_name.value == ''){
		alert('이름을 입력해주세요');
		return;
	}

	f.action="user_info_modify";
	f.method="POST";
	f.submit();
}

