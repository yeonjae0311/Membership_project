<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_edit_profile</title>
	<script src="resources/js/http_request.js"></script>
	<script type="text/javascript">
	
	function photo_upload(f){
		//let origin_m_photo_name = f.querySelector('[name="m_photo_name"]').value;
		//origin_m_photo_name = origin_m_photo_name.split('/').pop();
		
		let new_m_photo_name = f.new_m_photo_name.value;
		
		console.log('name : ' + new_m_photo_name.split('\\')[2]);
		
		let url = "photo_upload";
		let param = {
				"new_m_photo_name" : new_m_photo_name.split('\\')[2], 
				"m_idx": ${id.m_idx}
		}
		
		sendRequest(url, param, photo_check, "POST");
	}
	
	function photo_check(...args){
		
		console.log("here");
		
		console.log(args);
		
		let res = args[0]["param"];
 		
		if(res == 'success'){
			alert("사진 변경에 성공");
		} 
	}
	
	function modify(f) {
        let m_photo_name = f.querySelector('[name="m_photo_name"]').value;
            m_photo_name = m_photo_name.split('/').pop();
            
            f.action = "user_profile_modify";
            f.method = "POST";
            f.submit();
        
	}
	</script>
</head>
	<body>
	<form enctype="multipart/form-data" align="center" name="myForm">
        <div id="m_photo_name">
            <img id="m_profile" src="${pageContext.request.contextPath}/resources/upload/user/${id.m_photo_name}">
            <input type="hidden" name="m_photo_name" value="${id.m_photo_name}">
            <input type="file" name="new_m_photo_name"	 value="사진 변경">
            <input type="button" value="사진 미리보기" onclick="photo_upload(this.form)">
            <input type="hidden" name="m_idx" value="${id.m_idx}">
        </div>
        이름: "${id.m_name}"<br>
        닉네임: <input name="m_username" value="${id.m_username}">
        <input type="hidden" name="m_idx" value="${id.m_idx}">
        <input type="button" value="수정완료" onclick="modify(this.form)">
    </form>
	</body>
</html>