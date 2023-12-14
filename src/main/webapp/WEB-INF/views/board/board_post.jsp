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
			<table>
				<c:if test="${id.m_ismaster eq 1}">
					<div>
						<img id="fixoption" data-id="pin_icon.png" src="${pageContext.request.contextPath}/resources/img/pin_icon.png" onclick="check_fix()">
					</div><!-- 
					<input type="button" id="fixoption" value="공지글로 작성하기" onclick="check_fix()">	 -->					
				</c:if>
						
				<tr>
					<th>제목</th>
					<td>
						<input name="b_title">
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="b_content" rows="5" cols="50"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						<div id="file_upload_div">
							<input type="file" id="s_img" name="b_file">
							<label id="file_upload" for="s_img">
								<img src="${pageContext.request.contextPath}/resources/img/photo_upload_icon.png">
							</label>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="isfixed" value="0" name="b_isfixed">
						<input type="button" value="등록하기" onclick="send(this.form)">
						<input type="button" value="목록으로" onclick="location.href='board'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>