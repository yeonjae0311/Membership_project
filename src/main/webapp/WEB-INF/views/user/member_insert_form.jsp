<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="resources/js/httpRequest.js"></script>
	<script type="text/javascript">
	
		let b_id_check = false;
		let b_email_check = false;
		
		function send(f){
			
			let m_id = document.getElementById("m_id");	
			let m_password = document.getElementById("m_password");
			let m_check_password = document.getElementById("m_check_password");
			
			
			
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
			
			if(!b_id_check){
				alert('아이디 중복체크를 하세요');
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
		<table border="1" align="center">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="m_id" id="m_id" onchange="change()">
					<input type="button" value="중복체크" onclick="check_id()">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="m_password" id="m_password" type="password">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input name="m_check_password" id="m_check_password" type="password">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="m_name" id="m_name">
				</td>
			</tr> 
			<tr>
				<th>닉네임</th>
				<td>
					<input name="m_username" id="m_username">
				</td>
			</tr> 
			<tr>
				<th>전화번호</th>
				<td>
					<input name="m_tel" id="m_tel">
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td><input name="m_email" id="m_email">
				<button id="auth_btn" type="button">이메일 인증하기</button><br>
				<input class="mail_check_input" disabled placeholder="인증번호를 적어주세요"><br>
				<div id="mail_check_input_info" ></div>
				</td>
				
			</tr>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/email.js"></script>
			<tr>
				<th>프로필사진 등록</th>
				<td><input name="m_name" id="m_name"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="가입" onclick="send(this.form)"> 
				<input type="button" value="취소" onclick="location.href='main'"></td>
			</tr>
		</table>
	</form>
</body>
</html>