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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body>
	<div id="header_bar"></div>
		
	<div id="home_div">
	<input type="button" value="buy membership" onclick="shop_payment()">
		
		
		<div id="photo_banner">
			<div class="left">
				<input type="hidden" value="LEFT">
			</div>
				<div class="photo_main">
					<div class="img_container">
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans1.jpg"  
							alt="이미지 유실">
						</div>
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans6.jpg"  
							alt="이미지 유실">
						</div>
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans3.jpg"  
							alt="이미지 유실">
						</div>
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans4.jpg"  
							alt="이미지 유실">
						</div>
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/membership.jpg"  
							alt="이미지 유실">
						</div>
						<div class="img_slide">
							<img class="banner_img" 
							src="${pageContext.request.contextPath}/resources/img/photo_banner/bunnies_newjeans.jpg"  
							alt="이미지 유실">
						</div>
					</div>
				</div>
			<div class="right">
				<input type="hidden" value="RIGHT">
			</div>
			</div>
		</div>
		
		<!-- 스토리 4개 정도 출력해보기 -->
		<div id="story">
			<div class="story container">
				<c:if test="${membervo.m_ismembership eq '1' }">
				<c:forEach var="svo" items="${svo_list}" varStatus="status" end="3" >
						<div  class="story_content"  >
							<img class="story_img" 
							src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename }"
							onclick="location.href='story'">
						</div>
				</c:forEach>
				</c:if>
				
				<c:if test="${empty membervo or membervo.m_ismembership eq '0' }">
					<c:forEach begin="1" end="${s_count }">
					<!-- 비로그인 및 멤버십 결제 회원이 아닐 경우 보여줄 스토리 사진 -->
							<div  class="story_content"  >
								<img class="story_img"
								src="${pageContext.request.contextPath}/resources/img/photo_banner/story_lock.svg"
								onclick="location.href='login_form'">
							</div> 
					</c:forEach> 
				</c:if>
			</div>
		</div>
		
		
		
		<!-- 관리자 버튼, 유저 버튼 만들어서 누르면 해당 게시글들 볼 수 있도록, 5개씩 정도 출력되도록 -->
		<div id="board_div">
		<input id="priority" type="hidden" value="${priority}">
		
		<div id="board_view_button_bar">
			<div class="board_display_button">
				<img src="${pageContext.request.contextPath}/resources/img/new_jeans_rabbit_icon.png" onclick="master_board_first()">
				<p onclick="master_board_first()">New Jeans</p>
			</div>
			
			<div class="board_display_button">
				<img src="${pageContext.request.contextPath}/resources/img/new_jeans_rabbit_icon.png" onclick="all_board_first()">
				<p onclick="all_board_first()">Users</p>
			</div>	
		</div>
		
		<div id="board_view_list">
			<div class="board_list" id="fixed_list">
				<div id="fixed_list_table">
					<table class="b_list">
						<!--
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						-->
						
						<tr>
							<th id="pinned_th">
								<img id="board_pin_icon" src="${pageContext.request.contextPath}/resources/img/pin_icon.png">
								<div>
									Pinned Posts
								</div>
							</th>
						</tr>
						<c:forEach var="i" items="${fixed_list}">
							<tr>
								<td>
									<a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
								</td>
								
							</tr>
						</c:forEach> 
					</table>
				</div>
				
				<div id="adjust_size_button_div">
					<img id="adjust_size_button" data-value="down" src="${pageContext.request.contextPath}/resources/img/arrow_down_icon.png" onclick="adjust_size(event)">					
				</div>
			</div>
			
			<div id="board_list_header">
				<div id="board_title">All posts</div>
				<img id="board_post_icon" src="${pageContext.request.contextPath}/resources/img/post_upload_icon.png" onclick="location.href='board_post'">
			</div>
			
			<div class="board_list" id="unfixed_list">
				<div id="unfixed_master_list"  style="display:none;">
					<table class="b_list">
						<tr class="title_tr">
							<th>제목</th>
							<th>작성자</th>
						</tr>
	                    <c:forEach var="i" items="${unfixed_master_list}">
	                        <tr class="post_tr">
	                            <td class="board_post_title">
	                                <a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
	                            </td>
	                            
	                            <td class="board_post_username">${i.m_username}</td>
	                        </tr>
	                    </c:forEach> 
						<tr>
							<td colspan="2" class="paging_td">${pageMenu1}</td>
						</tr>
					</table>
				</div>
				
					
				<div class="board_list" id="unfixed_fan_list">
					<table class="b_list">
						<tr class="title_tr">
							<th>제목</th>
							<th>작성자</th>
						</tr>
						
						<c:forEach var="i" items="${unfixed_fan_list}">
							<tr class="post_tr">
								<td class="board_post_title">
									<a href="board_view?b_idx=${i.b_idx}">${i.b_title} [${i.b_reply_count}]</a>
								</td>
								
								<td class="board_post_username">${i.m_username}</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="2" class="paging_td">${pageMenu2}</td>
						</tr>
					</table>
				</div>
			</div>
	</div><!-- <div id="board"> -->
	</div> <!--</div id="body_div"> -->
	
	<div id="footer_bar"></div>
</body>
</html>