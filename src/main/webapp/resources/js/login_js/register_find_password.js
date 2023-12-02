var b_emailCheck = false;
var b_email_auth = false;

function email_exist_check(){
	let m_email = document.getElementById("m_email").value.trim();

	//유효성
	if(m_email == ''){
		alert('이메일를 입력하세요');
		return;
	}	
	let url = 'check_email';
	let param = {"m_email" : encodeURIComponent(m_email)};
	
	sendRequest(url, param, resultFn, "post");
}

function resultFn(...args) {
	let res = args[0].param
	
	if(res == 'yes'){
		alert('이메일이 존재하지 않습니다.');
		return;
	} else {
		alert('이메일이 확인되었습니다.');
		b_emailCheck = true;
		b_email_auth = false;
		return;
	}

}

function newpwd_update(f){
	var m_pwd= f.m_pwd.value.trim();
	var re_pwd= f.re_pwd.value.trim();
	var m_email= f.m_email.value.trim();

	if(m_pwd == ''){
		alert('새로운 비밀번호를 입력하세요');
		return;
	}

	if(re_pwd == ''){
		alert('새로운 비밀번호를 재입력하세요');
		return;
	}

	if(m_pwd != re_pwd){
		alert("비밀번호가 다릅니다.");
		return;
	} 
	
	if(!b_emailCheck){
		alert("이메일 확인이 필요합니다.");
		return;
	}
	if(!b_email_auth){
		alert('이메일 인증을 하세요');
		return;
	}
	
	f.action="pwd_modify.do";
	f.method="POST";
	f.submit();
}

function che(){
	b_emailCheck = false;
	b_email_auth = false;
}



function chee(){
	b_email_auth = false;
}
