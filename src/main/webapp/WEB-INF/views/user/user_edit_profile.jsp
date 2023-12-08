<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<script src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/user/user_edit_profile.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript">
	function changeimg(){
		const img_file_id = document.getElementById("photo_file_id");
		const image_preview = document.getElementById("m_profile");
		
		const img = img_file_id.files[0];
		let allowed_files = ["img/.gif", "img/.jpg","img/png","img/BMP"];
		
		
		 if (img) {
	            const reader = new FileReader();

	            reader.onload = function(e) {
	                // 파일 내용을 읽어와서 이미지 소스로 설정
	                image_preview.src = e.target.result;
	                if(img)
	            };
	            // 파일을 읽어옴
	            reader.readAsDataURL(img);
	        }
	}
	</script>
	<script type="text/javascript">
	
	function photo_default_update(f){
		let change_photo = document.getElementById("m_profile");
		console.log("here");
		change_photo.src="${pageContext.request.contextPath}/resources/upload/user/default_profile.jpg";
	}
	
	function modify(f) {
            f.action = "user_profile_modify";
            f.method = "POST";
            f.submit();
	}
	</script>
</head>
	<body>
	<div id="header_bar"></div>
	<form enctype="multipart/form-data" name="myForm">
        <div id="m_photo_name">
            <img id="m_profile" src="${pageContext.request.contextPath}/resources/upload/user/${vo.m_photo_name}">
            <input type="hidden" name="new_m_photo_name" value="${vo.m_photo_name}">
            <!-- 확장자 제한 기능 추가(완), 로컬저장소에 이미지 파일이 없을 경우 파일 생성하도록 추가 중 -->
            <input type="file" id="photo_file_id" name="m_photo" accept=".gif, .jpg, .png, .BMP"
             onchange="changeimg()" >
            <input type="button" value="기본프로필 사진으로 변경" onclick="photo_default_update(this.form)">
        </div>
        이름: <input name="m_name" value="${vo.m_name}" readonly><br>
        닉네임: <input name="m_username" value="${vo.m_username}">
        <input type="hidden" name="m_idx" value="${vo.m_idx}">
        <input type="button" value="수정완료" onclick="modify(this.form)">
    </form>
	<div id="footer_bar"></div>
	</body>
</html>