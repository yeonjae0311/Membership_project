<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			function send(f){
				var m_username = f.m_username.value.trim();
				var m_password = f.m_password.value.trim();
				
				//유효성 체크
				if(m_username == ''){
					alert('아이디를 입력해주세요');
					return;
				}
				
				if(m_password == ''){
					alert('비밀번호를 입력해주세요');
					return;
				}
				
				var url = "login";
				var param = "m_username="+encodeURIComponent(m_username)+"&m_password="+encodeURIComponent(m_password);
				
				sendRequest(url,param,myCheck,"POST");
			}
			
			//콜백함수
			function myCheck(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					if(json[0].param=='no_m_username'){
						alert('아이디가 존재하지 않습니다.');
					} else if(json[0].param == 'no_m_password'){
						alert('비밀번호가 일치하지 않습니다');
					} else {
						alert('로그인 성공');
						location.href='main';
					}
				}
			}
		</script>
	</head>
	<body>
	
		<form>
			<table border="1" align="center">
				<caption>:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="m_username"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="m_password" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onclick="send(this.form)">
						<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
						<input type="button" value="취소" onclick="location.href='main'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>