<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function left(){
				alert('left clicked');
				return;
			}
			
			function right(){
				alert('right clicked');
				return;
			}
			
			function like(){
				alert('like clicked');
				return;
			}
			
			function reply(){
				alert('reply clicked');
				return;
			}
		</script>
	</head>
	<body>
		story
		<input type="button" value="home" onclick="location.href='/membership/'">
		
		<input type="button" value="LEFT" onclick="left()">
		<div id="story_photo"><img src="" title="" alt="이미지없음"></div>
		<input type="button" value="RIGHT" onclick="right()">
		
		<input type="button" value="LIKE" onclick="like()">
		<!-- 이 윗부분을 jsp include로 해야할듯? -->

		<div id="comment_form">
			<table>
				<tr>
					<th></th>
					<th></th>
				</tr>
				<%-- <c:forEach var="r" items="${list}">
					<tr>
						<td></td>
						<td></td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
	</body>
</html>