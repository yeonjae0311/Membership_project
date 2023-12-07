<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/user/user_edit.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script>
		function send(e){
			location.href=e.target.parentElement.id
		}
	</script>
</head>
<body>
	<div id="header_bar"></div>

	<header>
		<input type="button" value="home" onclick="location.href='/membership/'">
	</header>
	
	<div id="user_edit">
		<div id="member_info_head_div">
			<div>
				<img id="member_photo" src="${pageContext.request.contextPath}/resources/upload/${id.m_photo_name}">		
				
				<div id="user_info_form">
					<div class="member_info_head" onclick="send(event)">${id.m_username}</div>
					
					<div class="member_info_head" onclick="send(event)">${id.m_email}</div>
				</div>
			</div>
		</div>
		
		<div id="member_info_body_div">
			<div id="user_edit_profile" class="member_info_body">
				<img src="${pageContext.request.contextPath}/resources/img/user/user_profile.png" onclick="send(event)" >
				<div onclick="send(event)">
					user_edit_profile
				</div>
			</div>
			
			<div id="user_order_list" class="member_info_body">
				<img src="${pageContext.request.contextPath}/resources/img/user/won.png" onclick="send(event)" >
				<div onclick="send(event)">
					user_order_list
				</div>
			</div>
			
			<div id="user_post_list" class="member_info_body">
				<img src="${pageContext.request.contextPath}/resources/img/user/pen.png" onclick="send(event)" >
				<div onclick="send(event)">
					user_post_list
				</div>
			</div>
			
			<div id="logout" class="member_info_body">
				<img src="${pageContext.request.contextPath}/resources/img/user/logout.png" onclick="send(event)" >
				<div onclick="send(event)">
					logout
				</div>
			</div>
		</div>
	</div>
	<div id="footer_bar"></div>
</body>
</html>
