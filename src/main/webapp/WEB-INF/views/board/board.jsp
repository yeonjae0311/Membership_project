<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	board
	<input type="button" value="home" onclick="location.href='/membership/'">
</body>
=======
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			let only_master = true; // true이면 관리자가 쓴글만 보이는 상태 기본값 true;			
			
			function managerfunc(){
				only_master = true;

				let board_post_list1 = document.getElementById("board_post_list1");
				let board_post_list2 = document.getElementById("board_post_list2");

				board_post_list1.style="display:none";
				board_post_list2.style="display:block";
				
				alert('매니저버튼 눌림');
				return;
			}
			//이 버튼이 눌렸을때 board_post_list를 ajax로 갱신
			function userfunc(){
				only_master = false;				

				let board_post_list1 = document.getElementById("board_post_list1");
				let board_post_list2 = document.getElementById("board_post_list2");

				board_post_list1.style="display:block";
				board_post_list2.style="display:none";
				
				
				alert('유저버튼 눌림');
				return;
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
		
		<div id="pinned_post_list1" style="display:none;">
			<table>
				<tr>
					<th></th>
					<th></th>
				</tr>
				<%-- <c:forEach var="r" items="${list1}">
					<tr>
						<td></td>
						<td></td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
		<br>
		<hr>
		<br>
		
		<div id="board_post_list1">
			<table>
				<tr>
					<th>번호</th><!-- 게시글번호 -->
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<c:forEach var="i" items="${list1}">
					<tr>
						<td>${i.b_idx}</td>
						<td>${i.b_title}</td>
						<td>${i.m_idx}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<hr>
		<br>
		
		<div id="board_post_list2">
			<table>
				<tr>
					<th>번호</th><!-- 게시글번호 -->
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<c:forEach var="i" items="${list2}">
					<tr>
						<td>${i.b_idx}</td>
						<td>${i.b_title}</td>
						<td>${i.m_idx}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
>>>>>>> 8d6115e8af3d73c42ec1b4588fe6e3f8d13605da
</html>