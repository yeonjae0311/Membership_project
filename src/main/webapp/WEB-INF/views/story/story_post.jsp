<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.js" defer></script>
	<script type="text/javascript">
		function send(f){
			let s_content=f.s_content.value
			//빈 콘텐트도 가능
			f.method = "post";
			f.action = "story_post_insert";
			f.submit();
		}
	</script>
</head>
<body>
	
	<c:if test="${id.m_ismaster ne '1' }">
		<c:redirect url="logout"/>
	</c:if>

	<div id="header_bar"></div>
	
	<jsp:include page="/WEB-INF/views/login_check.jsp"/>
		
	<form method="post" enctype="multipart/form-data">
	
		파일 업로드 : <input type="file" name="s_file"><br>
		
		<textarea name="s_content" ></textarea>
		
		<input type="button" value="스토리 쓰기" onclick="send(this.form)">
		
	</form>
	
	<div id="footer_bar"></div>
</body>
</html>