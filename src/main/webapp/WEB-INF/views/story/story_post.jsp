<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<jsp:include page="/WEB-INF/views/login_check.jsp"/>
	<script type="text/javascript">
	// 이미지 change
	function change_img() {
	const img_file_id = document.getElementById("s_img");
	const image_id = document.getElementById("story_img");

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
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="story_post_div">
		<form id="story_post_form" method="post" enctype="multipart/form-data">
				 <img class="story_img" id="story_img" src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}"  
				 alt="이미지 유실">
			<div id="file_upload_div">
				<p>
					파일 업로드:
				</p>
				<input type="file" id="s_img" name="s_file" onchange="change_img()" >
			</div>
			
			<div id="caption">
				<textarea name="s_content" ></textarea>
			</div>
			
			<div>
				<input type="button" value="스토리 쓰기" onclick="send(this.form)">
			</div>			
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>