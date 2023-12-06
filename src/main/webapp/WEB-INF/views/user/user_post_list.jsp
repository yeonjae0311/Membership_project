<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/user/user_post_list.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<input type="button" value="user_edit" onclick="location.href='user_edit'">
	user_post_list
	<div id="user_post_list">
		<c:forEach var="list" items="${list}">
			<div>
				<div>${list.b_title}</div>
				<div>${list.b_content}</div>
				<div>${list.b_posted_date}</div>
				<div>${id.m_name}</div>
			</div>
			<hr>
		</c:forEach>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>