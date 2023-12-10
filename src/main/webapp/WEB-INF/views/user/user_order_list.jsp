<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="user_order_list">
		<c:forEach var="list" items="${user_order_list}">
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