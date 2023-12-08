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
	function change_img() {
	    const img_file_id = document.getElementById("photo_file_id");
	    const image_id = document.getElementById("m_profile");

	    const img = img_file_id.files[0];
	    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp"];

	    if (img) {
	        const reader = new FileReader();

	        reader.onload = function(e) {
	            // 파일 내용을 읽어와서 이미지 소스로 설정
	            image_id.src = e.target.result;
	        };

	        // 파일의 확장자를 체크하여 허용된 확장자인 경우에만 이미지를 설정
	        let file_extension = img.name.split('.').pop().toLowerCase();
	        if (allowed_extensions.includes("." + file_extension)) {
	            // 파일을 읽어옴
	            reader.readAsDataURL(img);
	        } else {
	            alert("허용된 확장자가 아닙니다. GIF, JPG, PNG, BMP 파일만 업로드 가능합니다.");
	            img_file_id.value = ""; // 파일 선택 창 비우기
	        }
	    }
	}
	</script>
	<script type="text/javascript">
	
	function photo_default_update(f){
		url = "photo_default_upload";
		param = {
				"m_idx" : ${vo.m_idx}
		}
		sendRequest(url, param, default_update_check, "POST");
	}
		
	function default_update_check(...args) {
		let res = args[0].param;
		
		if(res == 'fail'){
			alert("사진을 바꾸는 것에 실패하였습니다.")
			return;
		} else{
			alert("사진을 변경했습니다.");
			let user_photo = document.getElementById("m_profile");
			user_photo.src="${pageContext.request.contextPath}/resources/upload/user/"+res;
		}
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
	<div id="footer_bar"></div>
	</body>
</html>