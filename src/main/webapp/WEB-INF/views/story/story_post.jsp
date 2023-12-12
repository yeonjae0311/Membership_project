<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>스토리 포스팅</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="story_post_div">
		<form id="story_post_form" method="post" enctype="multipart/form-data">
			<div id="story_img_div">
				<img class="story_img" id="story_img" src="${pageContext.request.contextPath}/resources/img/default/home_img.png">
			</div>
					 
			<div id="file_upload_div">
				<input type="file" id="s_img" name="s_file" onchange="change_img()">
				<label id="file_upload" for="s_img">
					<img src="${pageContext.request.contextPath}/resources/img/photo_upload_icon.png">
				</label>
				
				<!-- 버튼에 온클릭이 안됨 이유모름 -->
				<img src="${pageContext.request.contextPath}/resources/img/post_upload_icon.png" onclick="send(this.form)">
				<input type="button" onclick="send(this.form)">
			</div>
			
			<div id="caption">
				<textarea name="s_content"></textarea>
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>