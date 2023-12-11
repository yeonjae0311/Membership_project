<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/email.js" defer></script>

</head>
<body>
	<div id="header_bar"></div>
	
	<div>
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
					<input name="m_password" id="m_password" type="password" oninput="password_check(this.form)" placeholder= "영어와 숫자를 조합한 8자리 이상">
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
					<input name="m_tel" id="m_tel" placeholder="01012345678" oninput="tel_check(this.form)">
				</div>
				<div>
					<div id="tel_check_alert"></div>
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
				</div>
		
				
			<div>생년월일</div>
				<div>
					<input name="m_date_of_birth" id="m_date_of_birth" placeholder="YYYYMMDD 형식으로 넣어주세요" oninput="birth_check(this.form)">
				</div>
				<div>
					<div id="birth_check_alert"></div>
				</div>
			
			<div>
				<input type="button" value="가입" onclick="send(this.form)"> 
				<input type="button" value="취소" onclick="location.href='main'">
			</div>			
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>