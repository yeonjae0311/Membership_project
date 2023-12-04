<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>프로필 사진 수정 중</title>
	<script>
	function photo_upload(f){
		f.action="photo_upload";
		f.method="POST";
		f.submit();
	}
	</script>
	</head>
	<body>
		<form method="post" enctype="multipart/form-data">
		사진 : <input type="file" name="m_photo_name"><br>
		<input type="hidden" name="m_idx">
		<input type="button" value="프로필 사진 변경" onclick="photo_upload(this.form)">
	</form>
	</body>
</html>