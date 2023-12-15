<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="login">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/id.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="id_body_div">
		<div id="id_result_div">
			<div id="id_header_div">
				아이디/비밀번호 찾기
			</div>
			<div id="id_result_content_div">
				요청하신 아이디 찾기 결과입니다.<br>
				회원님의 아이디는 ${id.m_id} 입니다
			</div>
			
			<div id="id_button_bar">
				<input type="button" value="로그인" onclick="location.href='login_form'">
				<input type="button" value="메인으로" onclick="location.href='main'">
			</div>
		</div>
	</div>
	<div id="footer_bar"></div>
</body>
</html>