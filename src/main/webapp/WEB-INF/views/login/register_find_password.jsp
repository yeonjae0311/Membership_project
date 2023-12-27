<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="login">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/register_find_password.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/email.js" defer></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		<form id="find_password_form">	
			<p id="control_id">비밀번호 찾기</p>
			
			<div class="find_password">
				<p>
					<label class="control_label" for="m_id">아이디</label>
				</p>
				<p>
					<input class="form_control" type="text" id="m_id" name="m_id" placeholder="아이디를 적어주세요"/>
				</p>
			</div>
			
			<div class="find_password">
				<p>
					<label class="control_label" for="m_email">이메일</label>
				</p>
				<p>
					<input type="text" name="m_email" id="m_email" oninput="check_email(this.form)" placeholder="이메일을 적어주세요">
					<input id="auth_btn" type="button" value="인증하기">
				</p>
				<p>
				<input type="text" class="mail_check_input" id="m_code" name="m_code" placeholder="인증번호를 적어주세요">
				<div id="mail_check_input_info" ></div>
				
			</div>
			
			<div id="reg_btn_div">
				<input type="button" value="찾기" onclick="javascript:send_password(this.form)"> 
				<input type="button" value="취소" onclick="location.href='main'">
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>