<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="story">
	<meta charset="UTF-8">
	<title>스토리</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/story/story.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="story_div">
		<c:if test="${empty svo_list}">
			<c:choose>
				<c:when test="${id.m_ismaster eq '1' }">
					<div id="create_story" onclick="location.href='story_post'">
						<img src="${pageContext.request.contextPath}/resources/img/add_icon.png">
					</div>
				</c:when>
				<c:otherwise>
					<div id="no_story_list">
						작성된 글이 없습니다.
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<div id="storyContainer">
	
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
										<img class="like_img" id="like_img_id_${svo.s_idx}"
										src="${pageContext.request.contextPath}/resources/img/likep.png">
										
									</div>
								</c:when>
								
								<c:when test="${svo.sl_isliked eq '1'}">
									<div class="like_button_div" onclick="liked2(${svo.s_idx}, event)">
										<img class="like_img" id="like_img_id_${svo.s_idx}"
										src="${pageContext.request.contextPath}/resources/img/liker.png">
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