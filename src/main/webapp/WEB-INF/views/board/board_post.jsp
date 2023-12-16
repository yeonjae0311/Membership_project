<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/board_post.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="board_post_div">
		<form id="board_post_form" method="post" enctype="multipart/form-data">
			<c:if test="${id.m_ismaster eq 1}">
				<div id="pin_button_div">
					<img id="fixoption" src="${pageContext.request.contextPath}/resources/img/pin_icon.png" onclick="check_fix()">
				</div>				
			</c:if>
			
			<div class="board_post_class">
				<input type="text" name="b_title">
			</div>
			
			<div class="board_post_class">
				<textarea name="b_content"></textarea>
			</div>

			<div id="file_upload_div">
				<div id="photo_preview" class="board_post_class">
					<img id="board_img" src="">
				</div>
				
				<div id="file_upload_button">
					<input type="file" id="b_img" name="b_file" onchange="change_img()">
					<label id="file_upload" for="b_img">
						<img src="${pageContext.request.contextPath}/resources/img/photo_upload_icon.png">
					</label>
				</div>
			</div>

			<div id="board_button_bar_div">
				<input type="hidden" id="isfixed" value="0" name="b_isfixed">
				<input type="button" value="등록하기" style="cursor: pointer;" onclick="send(this.form)">
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>