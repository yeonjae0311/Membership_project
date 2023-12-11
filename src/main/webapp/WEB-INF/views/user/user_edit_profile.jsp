<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<div>
		<form enctype="multipart/form-data" name="my_form" align="center">
	        <div class = 'container' id="m_photo_name">
	            <img id="m_profile" src="${pageContext.request.contextPath}/resources/upload/user/${vo.m_photo_name}">
	            <br>
	            <input type="hidden" name="m_photo_name" value="${vo.m_photo_name}">
	            <!-- 확장자 제한 기능 추가(완), 로컬저장소에 이미지 파일이 없을 경우 파일 생성하도록 추가 중 -->
	            <input type="file" id="photo_file_id" name="m_photo" accept=".gif, .jpg, .png, .BMP"
	             onchange="change_img()" >
	            <input type="button" value="기본프로필 사진으로 변경" onclick="photo_default_update(this.form)">
	        </div>
	        이름: <input name="m_name" value="${vo.m_name}" readonly><br>
	        닉네임: <input name="m_username" value="${vo.m_username}">
	        <input type="hidden" name="m_idx" value="${vo.m_idx}">
	        <input type="button" value="수정완료" onclick="modify(this.form)">
	    </form>
	</div>
    
	<div id="footer_bar"></div>
</body>
</html>