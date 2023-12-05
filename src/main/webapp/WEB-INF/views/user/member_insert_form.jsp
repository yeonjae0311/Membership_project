<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/member_insert_form.js"></script>
</head>
<body>
	<form>
		<div>아이디</div>
			<div>
				<input name="m_id" id="m_id" onchange="change()">
				<input type="button" value="중복체크" onclick="javascript:check_id(this.form)">
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
				<input type="button" value="중복체크" onclick="check_email()" placeholder="OOO@OOO.OOO">
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
			<input type="button" value="가입" onclick="javascript:send(this.form)"> 
			<input type="button" value="취소" onclick="location.href='main'">
		</div>
				
	</form>
</body>
</html>