<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
	<div id="body_div">
		<div id="photo_container"> <!-- 여유가 되면 여러개의 이미지를 두고 저절로 이미지가 넘어가게끔 하도록 만들 예정 -->
			<div id = "photo_banner">
				<div class="photo_main">
						<div class="left">
							<input type="button" value="LEFT" onclick="show_previous()">
						</div>
						<div class="img_class">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans1.jpg"  
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
			<div class="story container">
				<!-- 비로그인 및 멤버십 결제 회원이 아닐 경우 보여줄 스토리 사진 -->
				<c:forEach var="svo" items="${svo_list}" varStatus="status" end="3" >
				<c:if test="${empty membervo.m_ismembership or membervo.m_ismembership eq '0' }">
					<div  class="story_content" >
						<img id="lock_icon" style="heigth:100px"
						src="${pageContext.request.contextPath}/resources/img/photo_banner/lock_icon.jpg"
						>
						
					</div>
				</c:if>
				<c:if test="${membervo.m_ismembership eq '1' }">
						<div  class="story_content"  >
							<img id="story_id_${svo.s_idx }" 
							src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename }"
							>
							
						</div>
				</c:if>
			</c:forEach>
			</div>
		</div>
		
		
		<!-- 공지사항 버튼, 관리자 버튼, 유저 버튼 만들어서 
		누르면 해당 게시글들 볼 수 있도록, 5개씩 정도 출력되도록 -->
		<div id="board">
		<div id="board_view_button_bar">
			<input type="button" value="관리자버튼" onclick="managerfunc()">	
			<input type="button" value="유저버튼" onclick="userfunc()">	
		</div>
			<div id="fixed_list">
			<table class="b_list">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<c:forEach var="i" items="${fixed_list}" end="9">
					<tr>
						<td>${i.b_idx}</td>
						
						<td>
							<a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
						</td>
						
						<td>${i.m_username}</td>
					</tr>
				</c:forEach> 
			</table>
		</div>
		
		<div id="unfixed_list">
			<div id="unfixed_master_list">
				<table class="b_list">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					
					<c:forEach var="i" items="${unfixed_master_list}" end="9">
						<tr>
							<td>${i.b_idx}</td>
							
							<td>
								<a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
							</td>
							
							<td>${i.m_username}</td>
						</tr>
					</c:forEach> 
					
				</table>
			</div>
					
			<div id="unfixed_fan_list" style="display:none;">
				<table class="b_list">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					
					<c:forEach var="i" items="${unfixed_fan_list}" end="9">
						<tr>
							<td>${i.b_idx}</td>
							
							<td>
								<a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
							</td>
							
							<td>${i.m_username}</td>
						</tr>
					</c:forEach> 
					
				</table>
			</div>
		</div>
		</div>
	</div> <!--</div id="home_div"> -->
	
	<div id="footer_bar"></div>
</body>
</html>