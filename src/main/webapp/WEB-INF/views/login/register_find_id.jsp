<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/login/register_find_id.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/register_find_id.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<form>		
		<div>아이디 찾기</div>
		<div class="find_id">
			<label class="control_label" for="m_name">성명</label>
			<input class="form_control" type="text" id="m_name" name="m_name"/>
		</div>
		
		<div class="find_id">
			<label class="control_label" for="m_email">이메일</label>
			<input name="m_email" id="m_email" onchange="change()">
			<button id="auth_btn" type="button">이메일 인증하기</button>
			<input class="mail_check_input" id="m_code" placeholder="인증번호를 적어주세요">
			<div id="mail_check_input_info" ></div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/email.js"></script>
		</div>
		
		<div class="find_id">
			<input type="button" value="완료" onclick="javascript:send_id(this.form)"> 
			<input type="button" value="취소" onclick="location.href='main'">
		</div>
	</form>
	<div id="footer_bar"></div>
</body>
</html>