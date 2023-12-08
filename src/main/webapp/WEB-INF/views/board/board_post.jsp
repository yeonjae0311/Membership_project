<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/board/board_post.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script>
		function check_fix(){
			let isfixed = document.getElementById('isfixed');
			let fixoption = document.getElementById('fixoption');
			
			switch(isfixed.value){
			case "1":
				isfixed.value ="0";
				fixoption.value = "공지글로 작성하기";
				break;
			case "0":
				isfixed.value = "1";
				fixoption.value = "일반글로 작성하기";
				break;
			}
		}
	
		function send(f){				
			let title = f.b_title.value.trim();
			let content = f.b_content.value.trim();
			
			if(title == ''){
				alert('제목은 필수 사항입니다.')
				return;
			}
			
			if(content == ''){
				alert('내용은 필수 사항입니다.')
				return;
			}
			
			f.method = "post";
			f.action = "board_post_insert";
			f.submit();
		}
	</script>
</head>
<body>
	<div id="header_bar"></div>
	<jsp:include page="/WEB-INF/views/login_check.jsp"/>

	<div id="board_post_div">
		<form method="post" enctype="multipart/form-data">
			<table border="1" align="center">
			
			<caption>새글 작성하기</caption>
			
			<c:choose>
				<c:when test="${id.m_ismaster eq 1}">
					관리자<br>
					<input type="button" id="fixoption" value="공지글로 작성하기" onclick="check_fix()">						
				</c:when>
				<c:otherwise>
					일반유저
				</c:otherwise>
			</c:choose>	
					
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
				<th>이미지 첨부</th>
				<td><input type="file" name="b_file"></td>
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