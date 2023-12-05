<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="resources/js/httpRequest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/check_email.js"></script>
	<script type="text/javascript">
	
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
			
			let check_tel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			let check_email = /^[A-z0-9]{2,20}+@[A-z]{2,20}+\.[a-z]{2,3}$/;
			let check_birth = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
			
			if(m_id.value == ''){
				alert('아이디를 입력하세요');
				return;
			}
			
			if(!b_id_check){
				alert('아이디 중복체크를 하세요');
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
			
			if(!check_tel.test(m_tel)){
				alert('전화번호 형식을 맞춰서 써주세요');
				return;
			}
			
			if(!check_email.test(m_email.value)){
				alert('이메일 형식을 맞춰서 써주세요');
				return;
			}
			
			if(mail_check_input.value == ''){
				alert('인증번호를 입력하세요');
				return;
			}
			
			if(!check_birth.test(m_date_of_birth.value)) {
				alert('생년월일 형식을 맞춰서 써주세요');
				return;
			}
			
			if(code != mail_check_input) {
				alert('인증번호를 확인해주세요');
				return;
			}
			
			f.action = "member_insert";
			f.submit();
		}
		
		function check_id(){
			let m_id = document.getElementById("m_id").value.trim();
			
			if(m_id == ''){
				alert('아이디를 입력하세요');
				return;
			}
			
			let url = "check_id";
			let param = "m_id="+encodeURIComponent(m_id);
				
			sendRequest(url,param,resultFn,"POST");
		}
		
		function resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let data = xhr.responseText;
				let json = (new Function('return'+data))();
				
				if(json[0].res == 'no'){
					alert('이미 사용중인 아이디입니다.');
					return;
				} else {
					alert('사용 가능한 아이디 입니다.');
					b_id_check = true;
				}
			}
		}
		
		function change(){
			b_id_check = false;
		}
		
		
		
	</script>
</head>
<body>
	<form>
		<div>아이디</div>
			<div>
				<input name="m_id" id="m_id" onchange="change()">
				<input type="button" value="중복체크" onclick="check_id()">
			</div>
			
		<div>비밀번호</div>
			<div>
				<input name="m_password" id="m_password" type="password">
			</div>
		
		<div>비밀번호 확인</div>
			<div>
				<input name="m_check_password" id="m_check_password" type="password">
			</div>
			
		<div>이름</div>
			<div>
				<input name="m_name" id="m_name">
			</div>
			
		<div>닉네임</div>
			<div>
				<input name="m_username" id="m_username">
			</div>
			
		<div>전화번호</div>
			<div>
				<input name="m_tel" id="m_tel" placeholder="010-1234-5678">
			</div>
			
		<div>이메일</div>
			<div>
				<input name="m_email" id="m_email" onchange="change()">
				<input type="button" value="중복체크" onclick="check_email()">
				<input class="mail_check_input" id="mail_check_input" disabled placeholder="인증번호를 적어주세요">
				<button id="auth_btn" type="button">이메일 인증하기</button><br>
				<div id="mail_check_input_info" ></div>
				<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/email.js"></script>
			</div>
			
		<div>생년월일</div>
			<div>
				<input name="m_date_of_birth" id="m_date_of_birth" placeholder="YYMMDD 형식으로 넣어주세요">
			</div>
		
		<div>
			<input type="button" value="가입" onclick="send(this.form)"> 
			<input type="button" value="취소" onclick="location.href='main'">
		</div>
				
	</form>
</body>
</html>