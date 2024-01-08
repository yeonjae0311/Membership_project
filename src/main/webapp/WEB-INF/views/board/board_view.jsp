<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>게시글 상세보기~</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/board_view.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<jsp:include page="/WEB-INF/views/login_check.jsp" />
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="board_view_div">
		<input type="hidden" id="b_idx" value="${vo.b_idx}">
		<input type="hidden" id="m_idx" value="${id.m_idx}">
		<div id="id1">
			<table id="board_view_table">
				<tr>
					<td>
						<c:if test="${vo.b_m_idx == vo.m_idx || id.m_ismaster=='1'}">
							<img id="delete_button" src="${pageContext.request.contextPath}/resources/img/x_icon.png" onclick="delete_board_post()">
						</c:if>
						<c:if test="${vo.b_m_idx == id.m_idx}">
							<img id="edit_button" class="button_img" src="${pageContext.request.contextPath}/resources/img/edit.png" onclick="edit_board_post()">
						</c:if>
					</td>
				</tr>
				
				<tr id="like_count_div">
					<td>
						<c:choose>
							<c:when test="${vo.bl_isliked eq '0'}">
								<input type="hidden" id="like_count_id" value="0">
								<input type="hidden" class="board_like_button" value="좋아요" onclick="board_like('${vo.b_idx}')">
								<img class="like_img" id="like_img_b_${vo.b_idx}"
										src="${pageContext.request.contextPath}/resources/img/likep.png"
										onclick="board_like('${vo.b_idx}')">
							</c:when>
							
							<c:when test="${vo.bl_isliked eq '1'}">
								<input type="hidden" id="like_count_id" value="1">
								<input type="hidden" class="board_like_button" value="좋아요 해제" onclick="board_like('${vo.b_idx}')">
								<img class="like_img" id="like_img_b_${vo.b_idx}"
										src="${pageContext.request.contextPath}/resources/img/liker.png"
										onclick="board_like('${vo.b_idx}')">
							</c:when>
							
							<c:otherwise>
								${vo.bl_isliked }
							</c:otherwise>
						</c:choose>

						<input type="text" id="b_like_count" value=${vo.b_like_count} readonly>
					</td>
				</tr>
				
				<tr>
					<td id="post_title">${vo.b_title}</td>
				</tr>
				
				<tr>
					<td>${vo.m_username}</td>
				</tr>
				
				<tr>
					<td>${vo.b_posted_date}</td>
				</tr>
				
				<tr>
					<td>조회수: ${vo.b_read_hit}</td>
				</tr>
				
				<tr>
					<td id="board_content" colspan="2">
						<c:if test="${not empty vo.b_filename and vo.b_filename ne 'no_file'}">
						<div class="board_post_img_div">
							<img class="board_post_img" src="${pageContext.request.contextPath}/resources/upload/board/${vo.b_filename}" width="200">
						</div>
						</c:if>
						<div id="board_post_content_div">
							${vo.b_content }
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<img class="button_img" src="${pageContext.request.contextPath}/resources/img/arrow_back_icon.png" onclick="location.href='board'">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="reply_form_div">
			<div id="reply_form">
				<form>
					<input type="hidden" name="b_idx" value="${vo.b_idx}">
				
					<textarea id="reply_textarea" name="r_content"></textarea>
					
					<div id="submit_button_div">
						<input id="submit_button" type="button" value="댓글 달기" onclick="send_reply(this.form);">
					</div>
				</form>
			</div>

			<div id="reply_list">
				<c:forEach var="i" items="${reply_list}">
					<div class="reply_div" id="reply_div_${i.r_idx}">
						<div>
							<span>								
								<c:if test="${i.r_m_idx == id.m_idx || id.m_ismaster=='1'}">
									<img class="delete_reply_button" src="${pageContext.request.contextPath}/resources/img/x_icon.png" onclick="delete_reply(${i.r_idx})">
								</c:if>
							</span>
						</div>

						<div class="user_info_div">
							<div class="user_photo">
								<img class="user_image" src="${pageContext.request.contextPath}/resources/upload/user/${i.m_photo_name}" alt="이미지 유실">
							</div>
							
							<div class="user_info">
								<div>${i.m_username}</div>
								
								<div>${i.r_date}</div>
							</div>
						</div>
						
						<div class="reply_like_div">
							<c:choose>
								<c:when test="${i.rl_isliked eq '0'}">
									<input id="rl_isliked_status_${i.r_idx}" type="hidden" value="좋아요" onclick="reply_like(${i.r_idx})">
									<img class="like_img" id="like_img_r_${i.r_idx}"
											src="${pageContext.request.contextPath}/resources/img/likep.png"
											onclick="reply_like(${i.r_idx})">
								</c:when>
								<c:when test="${i.rl_isliked eq '1'}">
									<input id="rl_isliked_status_${i.r_idx}" type="hidden" value="좋아요 해제" onclick="reply_like(${i.r_idx})">
									<img class="like_img" id="like_img_r_${i.r_idx}"
											src="${pageContext.request.contextPath}/resources/img/liker.png"
											onclick="reply_like(${i.r_idx})">
								</c:when>
							</c:choose>

							<input class="reply_like_count" id="r_like_count_${i.r_idx}" type="text" value="${i.r_like_count}">
						</div>
						
						<div class="reply_text_div" id="reply_text_div_${i.r_idx}">
							${i.r_content}
						</div>		
						
						<input id="rl_isliked_${i.r_idx}" type="hidden" value="${i.rl_isliked}" onclick="reply_like(${i.r_idx})">
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>