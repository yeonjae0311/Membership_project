<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>스토리</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<c:if test="${empty svo_list}">
		<c:choose>
		<c:when test="${id.m_ismaster eq '1' }">
			<div id="create_story" onclick="location.href='story_post'">
				<img src="${pageContext.request.contextPath}/resources/img/add_icon.png">
			</div>
		</c:when>
		<c:otherwise>
			<div id="no_story_list">
				현재 story가 한개도 없습니다!! 관리자가 곧 글을 작성할거예요~
			</div>
		</c:otherwise>
		</c:choose>
	</c:if>
	
	<div id="story_div">
		<div id="storyContainer">
			<c:forEach var="svo" items="${svo_list}" varStatus="loop">
				<div id="story_${svo.s_idx}" class="story" style="display: ${loop.index == 0 ? 'block' : 'none'}">
					<div class="story_main">
						<div class="left">
							<img class="left_button" src="${pageContext.request.contextPath}/resources/img/arrow_left_icon.png" onclick="show_previous()">
						</div>
						
						<div class="img_class">
							<img class="story_img" src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}"  alt="이미지 유실">
						</div>
						
						<c:if test="${id.m_ismaster eq '1' }">
							<div id="create_story" onclick="location.href='story_post'">
								<img src="${pageContext.request.contextPath}/resources/img/add_icon.png">
							</div>
						</c:if>
					
						<div class="right">
							<img class="right_button" src="${pageContext.request.contextPath}/resources/img/arrow_right_icon.png" onclick="show_next()">
						</div>
					</div>
					
					<div class="story_info_div">
						<input class="story_idx" type="hidden" value="${svo.s_idx}">
						<input type="hidden" id="liked_${svo.s_idx}" readonly value="${svo.sl_isliked}" class="liked valuebox">
						<input type="hidden" value="LIKE" onclick="liked2(${svo.s_idx},event)">
						
						<div class="count_list">
							<div class="count_info_div">
								<p class="count_info_like">
									좋아요: 
								</p>
								
								<input id="like_count_${svo.s_idx}" readonly class="like_count valuebox" value="${svo.s_like_count}">
							</div>
								
							<c:choose>
								<c:when test="${svo.sl_isliked eq '0'}">
									<div class="like_button_div" onclick="liked2(${svo.s_idx}, event)">
										<svg id="svg_test_${svo.s_idx}"
											 class="like_button"
											 xmlns="http://www.w3.org/2000/svg"
											 fill="white"
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
								</c:when>
								
								<c:when test="${svo.sl_isliked eq '1'}">
									<div class="like_button_div" onclick="liked2(${svo.s_idx}, event)">
										<svg id="svg_test_${svo.s_idx}"
											 class="like_button"
											 xmlns="http://www.w3.org/2000/svg"
											 fill="red"
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
								</c:when>
							</c:choose>
						</div>
					</div>
				
					<div class="comment">
						<textarea readonly >${svo.s_content }</textarea>
					</div>
				</div>
			</c:forEach>		
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>