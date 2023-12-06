<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login form</title>
	<link href="${pageContext.request.contextPath}/resources/css/login/login_form.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/login_form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	
</head>
<body>
	<div id="header_bar"></div>
	
	<form>
	<div>:::로그인:::</div>
		<div>
			아이디 <input name="m_id">
		</div>
		
		<div>
			비밀번호 <input name="m_password" type="password">
		</div>
		
		<div>
			<input type="button" value="로그인" onclick="send(this.form)">
			<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
			<input type="button" value="취소" onclick="location.href='main'">
		</div>
			
		<div>
			<input type="button" value="아이디 찾기" onclick="location.href='register_find_id'">
			<input type="button" value="비밀번호 찾기" onclick="location.href='register_find_password'">
		</div>
			
	</form>
	
	<div id="footer_bar"></div>
</body>
</html>