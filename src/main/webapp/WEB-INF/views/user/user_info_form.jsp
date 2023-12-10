<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<form>
		<div> 이름 : ${vo.m_name }		</div>
		<div> 연락처 : ${vo.m_tel }		</div>
		<div> 생년월일 : ${vo.m_date_of_birth }</div>
		<div> 이메일 : ${vo.m_email }		</div>
		<input type="hidden" name="m_idx" value="${vo.m_idx }">
		<input type="hidden" name="m_id" value="${vo.m_id }">
		<input type="button" name="modify_form" value="수정하기" onclick="modify(this.form)">
		<input type="button" value="회원탈퇴" onclick="delete_leave(this.form)">
	</form>
	
	<div id="footer_bar"></div>
</body>
</body>
</html>