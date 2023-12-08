<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/user/member_insert_form.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script src="resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/member_insert_form.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<form>
		<div>회원가입</div>
		<div>아이디</div>
			<div>
				<input name="m_id" id="m_id" oninput="check_id(this.form)" placeholder= "아이디를 입력해주세요">
			</div>
			
			<div>
				<div id="id_check_alert"></div>
			</div>
			
		<div>비밀번호</div>
			<div>
				<input name="m_password" id="m_password" type="password" oninput="password_check(this.form)">
			</div>
			
		<div>
			<div id="password_check_alert"></div>
		</div>
		
		<div>비밀번호 확인</div>
			<div>
				<input name="m_re_password" id="m_re_password" type="password" oninput="re_password_check(this.form)">
			</div>
			
		<div>
			<div id="re_password_check_alert"></div>
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
				<input name="m_email" id="m_email" oninput="check_email(this.form)" placeholder="OOO@OOO.OOO">
				<button id="auth_btn" type="button" >이메일 인증하기</button>
				<div>
					<div id="email_check_alert"></div>
				</div>
				<input class="mail_check_input" id="mail_check_input" disabled placeholder="인증번호를 적어주세요">
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
	<div id="footer_bar"></div>
</body>
</html>