<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">

	var b_idCheck = false;
	

	
	function send(f){
		var m_username = f.m_username.value.trim();
		var m_password = f.m_password.value.trim();
		
		
		if(m_username == ''){
			alert('아이디를 입력하세요')
			return;
		}
		
		if(m_password == ''){
			alert('비밀번호를 입력하세요')
			return;
		}
		
		if(!b_idCheck){
			alert('아이디 중복체크를 하세요')
			return;
		}
		
		f.action = "member_insert";
		f.submit();
	}


	function check_id(){
		var m_username = document.getElementById("m_username").value.trim();
		
		if(m_username == ''){
			alert('아이디를 입력하세요')
			return;
		}
		
		var url = "check_id";
		var param = "id="+encodeURIComponent(m_username);
		
		sendRequest(url,param,resultFn,"POST");
		
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 사용중인 아이디입니다.')
				return
			} else {
				alert('사용 가능한 아이디 입니다.')
				b_idCheck = true;
			}
		}
	}
	
	function che(){
		b_idCheck = false;
	}
</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td><input name="m_username" id="m_username" onchange="che()">
					<input type="button" value="중복체크" onclick="check_id()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="m_password" type="password"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input name="m_checkpassword" type="password"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="m_name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="m_email"></td>
			</tr>
			
		
			<tr>
				<td colspan="2" align="center"><input type="button" value="가입"
					onclick="send(this.form)"> <input type="button" value="취소"
					onclick="location.href='main'"></td>
			</tr>
		</table>
	</form>
</body>
</html>





