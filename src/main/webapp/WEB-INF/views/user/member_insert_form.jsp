<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/member_insert_form.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/email.js" defer></script>

</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		<form id="insert_form">
			<p>회원가입</p>
				<div id="input_form">
					<label class="control_label" for="m_id">아이디   </label>
					<input name="m_id" id="m_id" type="text" oninput="check_id(this.form)" placeholder= "아이디를 입력해주세요">
				</div>
				
				<div id="check_alert">
					<div id="id_check_alert"></div>
				</div>
				
				<div id="input_form">
					<label class="control_label" for="m_password">비밀번호</label>
					<input name="m_password" id="m_password" type="password" 
					oninput="password_check(this.form)" placeholder= "영어와 숫자를 조합한 8자리 이상입니다">
				</div>
				
				<div id="check_alert">
					<div id="password_check_alert"></div>
				</div>
			
				<div id="input_form">
					<label class="control_label" for="m_re_password">비밀번호 확인</label>
					<input name="m_re_password" id="m_re_password" type="password" oninput="re_password_check(this.form)">
				</div>
				
				<div id="check_alert">
					<div id="re_password_check_alert"></div>
				</div>
				
				<div id="input_form">
					<label class="control_label" for="m_name">이름   </label>
					<input name="m_name" id="m_name" type="text">
				</div>
			
					<div id="input_form">
					<label class="control_label" for="m_username">닉네임   </label>
					<input name="m_username" id="m_username" type="text">
				</div>
				
				<div id="input_form">
					<label class="control_label" for="m_tel">전화번호</label>
					<input name="m_tel" id="m_tel" type="text" placeholder="01012345678" oninput="tel_check(this.form)">
				</div>
				<div id="check_alert">
					<div id="tel_check_alert"></div>
				</div>
				
				<div id="input_form">
					<label class="control_label" for="m_email">이메일</label>
					
						<input name="m_email" id="m_email" type="text" oninput="check_email(this.form)" placeholder="OOO@OOO.OOO">
					
						<input id="auth_btn" type="button" value="인증하기">
				</div>
				<div>
					<div id="check_alert">
						<div id="email_check_alert"></div>
					</div>
				<div id="input_form">
					<label class="control_label" for="m_mail_check_input">인증번호</label>
					<input class="mail_check_input" id="mail_check_input" type="text" disabled placeholder="인증번호를 적어주세요">
				</div>
				<div id="check_alert">
					<div id="mail_check_input_info" ></div>
				</div>
				</div>
		
				<div id="input_form">
					<label class="control_label" for="m_date_of_birth">생년월일</label>
					<input name="m_date_of_birth" id="m_date_of_birth" type="text" placeholder="YYYYMMDD 형식으로 넣어주세요" oninput="birth_check(this.form)">
				</div>
				<div id="check_alert">
					<div id="birth_check_alert"></div>
				</div>
			
			<div id="insert_btn_div">
				<input type="button" value="가입" onclick="send(this.form)"> 
				<input type="button" value="취소" onclick="location.href='main'">
			</div>			
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>