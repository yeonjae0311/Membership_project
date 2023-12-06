<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프로필 사진 수정 중</title>
	<link href="${pageContext.request.contextPath}/resources/css/user/user_profile_photo_modify_form.css" rel="stylesheet" type="text/css">
	<script>
	function photo_upload(f){
		f.action="photo_upload";
		f.method="POST";
		f.submit();
	}
	</script>
</head>
<body>
	<div id="header_bar"></div>
	
	<form>
		사진 업로드 : 
		<input ${id.m_photo_name }>
		<input type="button" value="업로드 완료" onclick="photo_upload(this.form)">
	</form>
	
	<div id="footer_bar"></div>
</body>
</html>