<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<script type="text/javascript">
	
	function photo_upload(f){
		let m_photo_name = f.querySelector('[name="m_photo_name"]').value;
		m_photo_name = m_photo_name.split('/').pop();
		
		f.action="photo_upload";
		f.method="POST";
		f.submit();
	}
	
	function modify(f) {
        let m_photo_name = f.querySelector('[name="m_photo_name"]').value;
            m_photo_name = m_photo_name.split('/').pop();
            
            form.action = "user_profile_modify";
            form.method = "POST";
            form.submit();
        
	}
	</script>
</head>
	<body>
	<form enctype="multipart/form-data" align="center" name="myForm">
        <div id="m_photo_name">
            <!-- 이미지의 파일 이름을 m_photo_name에 설정 -->
            <img id="m_profile" src="${pageContext.request.contextPath}/resources/upload/user/${id.m_photo_name}">
            <input type="hidden" name="m_photo_name" value="${id.m_photo_name}">
            <input type="button" value="사진 변경" onclick="photo_upload(this.form)">
            <input type="hidden" name="m_idx" value="${id.m_idx}">
        </div>
        이름: "${id.m_name}"<br>
        닉네임: <input name="m_username" value="${id.m_username}">
        <input type="hidden" name="m_idx" value="${id.m_idx}">
        <input type="button" value="수정완료" onclick="modify(this.form)">
    </form>
	</body>
</html>