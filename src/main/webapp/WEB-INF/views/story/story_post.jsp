<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<jsp:include page="/WEB-INF/views/login_check.jsp"/>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="story_post_div">
		<form id="story_post_form" method="post" enctype="multipart/form-data">
			<div id="file_upload_div">
				<p>
					파일 업로드:
				</p>
				
				<input type="file" name="s_file">
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