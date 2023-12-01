<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			let isMaster=false;
			function file_upload(){
				alert('파일업로드가 눌림');
				return;
			}

			function confirm(){
				alert('파일업로드가 눌림');
				return;
			}
		</script>
	</head>
	<body>
		<div id="board_post_div">
			<!-- form이 멀티파트 -->
			<form>
				<!-- 이부분이 옵션으로 바뀌는건가? -->
				<c:choose>
					<c:when test="{ismaster eq 1}">
						관리자
					</c:when>
					<c:otherwise>
						일반유저
					</c:otherwise>
				</c:choose>
				<input name="title">
				<textarea name="content" rows="5" cols="50"></textarea>
				<input type="button" value="파일업로드" onclick="file_upload()">
				<input type="button" value="확인" onclick="confirm()">
			</form>
		</div>
	</body>
</html>