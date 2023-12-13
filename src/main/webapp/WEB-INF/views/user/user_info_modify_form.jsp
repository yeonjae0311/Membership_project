<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_info_modify_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_info_modify_form.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="user_info_modify_form_div">
		<form>
			<div class="modify_form_input_div">
				 이름 : <input name="m_name" value="${vo.m_name}" >
			</div>
			<hr class="user_info_modify_form_hr">
			
			<div class="modify_form_input_div"> 
				 연락처 : <input name="m_tel" value="${vo.m_tel}" >
			</div>
			<hr class="user_info_modify_form_hr">
			
			<div class="modify_form_input_div">
				 생년월일 : <input name="m_date_of_birth" value="${vo.m_date_of_birth}">
			</div>
			<hr class="user_info_modify_form_hr">	
					
			<div class="modify_form_input_div">
				이메일 : <input name="m_email" value="${vo.m_email}" >
			</div>
			
			<input type="hidden" name="m_idx" value="${vo.m_idx}">
			
			<div id="user_info_modify_form_button_div">
				<input type="button" value="수정완료" onclick="send(this.form)">
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>