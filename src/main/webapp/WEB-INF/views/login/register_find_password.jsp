<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/register_find_password.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::비밀번호 찾기:::</caption>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="m_email" id="m_email" onchange=che()>
					<input type="button" value="확인" onclick="email_exist_check()">
				</td>
			</tr>
			<tr>
				<th>인증번호</th>
				<td>
					<input class="mail_check_input" disabled="disabled" onchange="chee()">
					<button type="button" id="auth_btn">인증번호 보내기</button>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div id="mail_check_input_info"></div>
				</td>
			</tr>
			
			<script src="${pageContext.request.contextPath }/resources/js/login_js/email_auth.js"></script>
			
			<tr>
				<th>새 비밀번호</th>
				<td><input type="password" name="m_pwd" id="m_pwd"></td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td><input type="password" name="re_pwd" id="re_pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="비밀번호 변경" onclick="newpwd_update(this.form)">
				<input type="button" value="취소" onclick="location.href='main'">
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>