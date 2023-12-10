<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>Board</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.js" defer></script>
	<style>
		.b_list{
			margin:0 auto;
			width:90%;
		}
		
		.b_list tbody tr td{
			text-align: center;
		}
		
		a{
			text-decoration: none;
		}
	</style>
</head>
<body>
	<div id="header_bar"></div>
	
	<input type="button" value="home" onclick="location.href='/membership/'">
	
	<div id="board_view_button_bar">
		<input type="button" value="관리자버튼" onclick="managerfunc()">	
		<input type="button" value="유저버튼" onclick="userfunc()">	
	</div>
	
	<div id="fixed_list">
		<table border="1" class="b_list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
				<c:forEach var="i" items="${fixed_list}">
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
		
		<div id="unfixed_master_list">
			<table border="1" class="b_list">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				
				<c:forEach var="i" items="${unfixed_master_list}">
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
			<table border="1" class="b_list">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				
				<c:forEach var="i" items="${unfixed_fan_list}">
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
		<input type="button" value="글쓰기" onclick="location.href='board_post'">
		
		<div id="footer_bar"></div>
	</body>
</html>