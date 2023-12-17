<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_info_form.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="user_info_form_div">
		<form>
			<p class="user_info_form"> 이름 : ${vo.m_name }</p>
			<hr class="user_info_form_hr">
			<p class="user_info_form"> 연락처 : ${vo.m_tel}</p>
			<hr class="user_info_form_hr">
			<p class="user_info_form"> 생년월일 : ${vo.m_date_of_birth }</p>
			<hr class="user_info_form_hr">
			<p class="user_info_form"> 이메일 : ${vo.m_email }</p>
			<input type="hidden" id="m_idx" name="m_idx" value="${vo.m_idx }">
			<input type="hidden" name="m_id" value="${vo.m_id }">
			<div id="user_info_form_button_bar_div">
				<input type="button" name="modify_form" value="수정하기" onclick="modify(this.form)" style="cursor: pointer;">
				<input type="button" value="회원탈퇴" onclick="delete_leave(this.form)" style="cursor: pointer;">
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</body>
</html>