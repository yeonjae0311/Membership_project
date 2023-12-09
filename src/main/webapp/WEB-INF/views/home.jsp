<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/login_form.js"></script>
	<script>
		let isFilled = true;
		
		function change(event){
			if(isFilled){
				isFilled = !isFilled;
				
				event.target.style.fill = "red";
			}else{
				isFilled = !isFilled;
				
				event.target.style.fill = "white";
			}
		}
		function logout(){
			localStorage.clear();
			location.href='logout';
		}
	</script>
</head>
<body>
	<div id="header_bar"></div>
	<c:choose>
		<c:when test="${empty id}">
			<input type="button" value="로그인" onclick="location.href='login_form'">
			<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
			<input type="button" value="마이페이지" onclick="location.href='login_form'">
		</c:when>
		<c:when test="${not empty id }">
			<input type="button" value="로그아웃" onclick="logout()">
			<input type="button" value="마이페이지" onclick="location.href='user_edit'">
		</c:when>
	</c:choose>
	
	<div id="photo_gallery">
		 <id = "m_photo_gallery" {>
	
	
	</div>
	
	<div>
		<!-- 바꿔야 할것 id, onclick에 붙은 메서드 -->
		<svg id="svg_test"
			 onclick="change(event)"
			 xmlns="http://www.w3.org/2000/svg"
			 fill="blue"
			 width="24px"
			 height="24px"
			 viewBox="0 0 24 24"
			 >
			<path stroke="#121923"
				  stroke-width="1.2"
				  
				  d="M17 16c-1.2 1.323-4.5 4.5-4.5 4.5S9.2 17.323 8
				  	16c-2.8-3.088-3.5-4.294-3.5-6.5 0-2.206 1.6-4 4-4
				  	2 0 3.2 1.324 4 2.647.8-1.323 2-2.647 4-2.647 2.4
				  	0 4 1.794 4 4s-.7 3.412-3.5 6.5Z"/>
		</svg>
	</div>
	<div id="footer_bar"></div>
</body>
</html>