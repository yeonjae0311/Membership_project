<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_edit_profile.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<div>
		<form enctype="multipart/form-data" name="my_form" align="center">
	        <div class = 'container' id="m_photo_name">
	            <img id="m_profile" src="${pageContext.request.contextPath}/resources/upload/user/${vo.m_photo_name}">
	            <br>
	            <input type="hidden" name="m_photo_name" value="${vo.m_photo_name}">
	        	<div id="file_upload_div">
	            	<input type="file" id="photo_file_id" 
	             	name="m_photo" accept=".gif, .jpg, .png, .BMP"
	             	onchange="change_img()" >
	             	<label id="file_upload" for="photo_file_id">
						<img src="${pageContext.request.contextPath}/resources/img/user/upload_photo.png">
					</label>
		            <input type="button" id="default_profile" name="default_profile" value="기본프로필 사진으로 변경" onclick="photo_default_update(this.form)">
		            <label id="delete_photo" for="default_profile">
		            	<img src="${pageContext.request.contextPath}/resources/img/user/delete_photo.png">
		            </label> 
	            </div>
	        </div>
	        <div id="profile_input_div">
	        	<div id="profile_name_div">
		       		<span>이름: ${vo.m_name}</span>
		       		<input type="hidden" name="m_name" class="input_border" value="${vo.m_name}" readonly><br>
		        </div>
		        <div id="profile_username_div">
		        	닉네임: <input name="m_username" class="input_border" value="${vo.m_username}">
		        </div>
		    </div>
	        <div id="profile_button_bar_div">
		        <input type="hidden" name="m_idx" value="${vo.m_idx}">
		        <input type="button" value="수정하기" onclick="modify(this.form)" style="cursor: pointer;">
	        </div>	        
	    </form>
	</div>
    
	<div id="footer_bar"></div>
</body>
</html>