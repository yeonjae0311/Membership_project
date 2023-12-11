<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<div id="user_edit">
		<div id="member_info_head_div">
			<div>
				<img id="member_photo" src="${pageContext.request.contextPath}/resources/upload/user/${vo.m_photo_name}">		
				
				<div id="user_info_form">
					<div class="member_info_head" onclick="send(event)">${vo.m_username}</div>
					<div class="member_info_head" onclick="send(event)">${vo.m_email}</div>
				</div>
			</div>
		</div>
		
		<div id="member_info_body_div">
			<div id="user_edit_profile" class="member_info_body">
				<img src="${pageContext.request.contextPath}/resources/img/user/user_profile.png">
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
