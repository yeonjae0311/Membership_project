<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스토리~</title>
	<link href="${pageContext.request.contextPath}/resources/css/shop/story.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/story_js/story.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	story	
	
	<c:if test="${not empty id }">
		<input type="button" value="스토리 작성하기" onclick="location.href='story_post'">
	</c:if>
	
	<div id="storyContainer">	
		<c:forEach var="svo" items="${svo_list}" varStatus="loop">			
			<div id="story_${svo.s_idx}" class="story" style="display: ${loop.index == 0 ? 'block' : 'none'}">
			
				<div class="left">
					<input type="button" value="LEFT" onclick="show_previous()">	
				</div>
			
				<img src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}"  alt="이미지 유실">
			
				<div class="comment">
					<textarea readonly>${svo.s_content }</textarea>
				</div>
				
				<input class="story_idx" type="hidden" value="${svo.s_idx}">
			
				<input class="s_read_hit" value="${svo.s_read_hit}">
					
				<input id="like_count_${svo.s_idx}" class="like_count" value="${svo.s_like_count}">
					
				<input id="liked_${svo.s_idx}" value="${svo.sl_isliked}" class="liked">
					
				<%-- <input type="hidden" value="${svo.sl_isliked}" class="liked_value"> --%>
				
				<input type="button" value="LIKE" onclick="liked2( ${svo.s_idx})">
				
				<div class="right">
					<input type="button" value="RIGHT" onclick="show_next()">	
				</div>
			</div>
		</c:forEach>		
	</div>
	
	<input type="button" value="home" onclick="location.href='/membership/'">
			
	<div id="footer_bar"></div>
</body>

</html>