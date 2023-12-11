<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="home">
	<meta charset="UTF-8">
	<title>Welcome! This`s Newjeans_membership_homepage</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
		
	<div id="home_div">
		<div id="photo_container">
			<div id = "photo_banner">
				<div class="photo_main">
						<div class="left">
							<input type="button" value="LEFT" onclick="show_previous()">	
						</div>
						<div class="img_class">
							<img class="banner_img" src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans1.jpg"  
							alt="이미지 유실">
						</div>
						<div class="right">
							<input type="button" value="RIGHT" onclick="show_next()">	
						</div>
				</div>
			</div>
		</div>
		
		<!-- 스토리 4개 정도 출력해보기 -->
		<div id="story">
		
		</div>
		
		
		<!-- 공지사항 버튼, 관리자 버튼, 유저 버튼 만들어서 
		누르면 해당 게시글들 볼 수 있도록, 5개씩 정도 출력되도록 -->
		<div id="board">
			
				
		</div>
	</div> <!--</div id="home_div"> -->
	
	<div id="footer_bar"></div>
</body>
</html>