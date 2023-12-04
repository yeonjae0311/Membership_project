<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/register_find_password.js"></script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::비밀번호 찾기:::</caption>
			
			<tr>
				<th>이메일</th>
				<td>
					<input name="m_email" id="m_email">
					<button id="auth_btn" type="button">이메일 인증하기</button><br>
					<input class="mail_check_input" name="m_mail" disabled placeholder="인증번호를 적어주세요"><br>
					<div id="mail_check_input_info"></div>
					<input disabled placeholder="인증번호가 비밀번호입니다"><br>
				</td>
			</tr>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/email.js"></script>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="완료" onclick="javascript:send_password(this.form)"> 
				<input type="button" value="취소" onclick="location.href='main'"></td>
		</table>
	</form>
</body>
</html>