<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			var onlymaster = true; // true이면 관리자가 쓴글만 보이는 상태 기본값 true;			
	
			function managerfunc(){
				onlymaster = true;
				alert('매니저버튼 눌림');
				return;
			}//이 버튼이 눌렸을때 board_post_list를 ajax로 갱신
			
			function userfunc(){
				onlymaster = false;
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
		
		<div id="pinned_post_list">
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
		
		<div id="board_post_list">
			<table>
				<tr>
					<th></th>
					<th></th>
				</tr>
				<%-- <c:forEach var="r" items="${list2}">
					<tr>
						<td></td>
						<td></td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
	</body>
</html>