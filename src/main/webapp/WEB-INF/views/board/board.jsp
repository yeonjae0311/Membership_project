<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board</title>
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
	<script>			
		function managerfunc(){
			let unfixed_master_list = document.getElementById("unfixed_master_list");
			let unfixed_fan_list = document.getElementById("unfixed_fan_list");

			unfixed_master_list.style="display:block";
			unfixed_fan_list.style="display:none";				
		}
		
		//이 버튼이 눌렸을때 board_post_list를 ajax로 갱신
		function userfunc(){			
			let unfixed_master_list = document.getElementById("unfixed_master_list");
			let unfixed_fan_list = document.getElementById("unfixed_fan_list");

			unfixed_master_list.style="display:none";
			unfixed_fan_list.style="display:block";				
		}//이 버튼이 눌렸을때 board_post_list를 ajax로 갱신
	</script>
</head>
<body>
	board
	<input type="button" value="home" onclick="location.href='/membership/'">
	<br>
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
							<a href="board_view?b_idx=${i.b_idx}">${i.b_title}</a>
						</td>
						<td>${i.m_username}</td>
					</tr>
				</c:forEach> 
			</table>
		</div>
		<br>
		<hr>
		<br>
		
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
						<td><a href="board_view?b_idx=${i.b_idx}">${i.b_title}</a></td>
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
							<a href="board_view?b_idx=${i.b_idx}">${i.b_title}</a>
						</td>
						<td>${i.m_username}</td>
					</tr>
				</c:forEach> 
			</table>
		</div>
		<input type="button" value="글쓰기" onclick="location.href='board_post';">
	</body>
</html>