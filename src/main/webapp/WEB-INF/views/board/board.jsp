<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>Board</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/board.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>	
</head>
<body>
	<div id="header_bar"></div>
	
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
						<tr>
							<th id="pinned_th">
								<img id="board_pin_icon" src="${pageContext.request.contextPath}/resources/img/pin_static_icon.png">
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
			<div class="search_td">
				<form>
					<select id="search_field">
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
					</select>
					<input type="text" id="search_word" placeholder="검색어를 입력해주세요">
					<input type="button" value="검색" onclick="search()">
				</form>
			</div>
		</div>
	</div>
		
	<div id="footer_bar"></div>
</body>
</html>