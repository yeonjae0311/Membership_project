<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<link href="${pageContext.request.contextPath}/resources/css/user/user_edit_profile.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript">
	function modify(f){
		f.action="user_profile_modify";
		f.method="POST";
		f.submit();
	}
	</script>
</head>
<body>
	<div id="header_bar"></div>
	
	<form>
		<div id="m_photo_name"> ${id.m_photo_name }  </div>
			<input type="button"  value="사진 변경" onclick="location.href='user_profile_photo_modify_form'">
			이 름	 : <input name="m_name" value="${id.m_name }">
			닉네임 : <input name="m_username" value="${id.m_username }">
			<input type="hidden" name="m_idx" value="${id.m_idx}">
			<input type="button" value="수정완료" onclick="modify(this.form)">
	</form>
	
	<div id="footer_bar"></div>
</body>
</html>