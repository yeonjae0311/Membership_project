<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login form</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/login_form.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
		
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		
	</head>
	<body>
	
		<form>
			<table border="1" align="center">
				<caption>:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="m_id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="m_password" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onclick="javascript:send(this.form)">
						<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
						<input type="button" value="취소" onclick="location.href='main'">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="아이디 찾기" onclick="location.href='register_find_id'">
						<input type="button" value="비밀번호 찾기" onclick="location.href='register_find_password'">
					</td>
				</tr>
				
				<ul>
					<li onclick="kakaoLogin();">
				      <a href="javascript:void(0)">
				          <span>카카오 로그인</span>
				      </a>
					</li>
					<li onclick="kakaoLogout();">
				      <a href="javascript:void(0)">
				          <span>카카오 로그아웃</span>
				      </a>
					</li>
				</ul>
				
			</table>
		</form>
	</body>
</html>