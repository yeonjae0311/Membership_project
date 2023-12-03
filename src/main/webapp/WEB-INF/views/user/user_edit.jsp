<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<input type="button" value="home" onclick="location.href='/membership/'">
	</header>
	<div id="user_info_div">
	<div>${id.m_photo_name }</div>
		<img src="${pageContext.request.contextPath}/resources/upload/${id.m_photo_name}">
	</div>
</body>
</html>