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
				//alert('left clicked');
				prev();
				return;
			}
			
			function right(){
				next();
				//alert('right clicked');
				return;
			}
			
			function like(){
				//ajax코드 필요
				alert('like clicked');
				return;
			}
			
			function reply(){
				alert('reply clicked');
				return;
			}
			
			//num이 바뀔때마다 liked상태인지와 likecount
			//해당이미지에 해당하는 
			function revalidate(){
				let url = '';//여기서부터 이어서
				let param = 'num='+num+'&m_idx='+${m_username.m_idx};
				
			}
			
		</script>
		<script>
		//이미지 로테이션 코드
			let num=1;//시작 번호
			let endnum=6; //마지막번호 개수가 바뀌면이부분을 수정
			let path = "${pageContext.request.contextPath}/resources/img/";
			let str_newjeans = "newjeans";
			
			function prev(){
				num--;
				if(num<1){
					num = endnum;
				} 
				let my_a = document.getElementById("gallery");
				my_a.src = path + str_newjeans + num + ".jpg";
				revalidate();
			}
			function next(){
				num++;
				if(num>endnum){
					 num=1;
				}
				let my_a = document.getElementById("gallery");
				my_a.src = path + str_newjeans + num + ".jpg";
				revalidate();
			}			
			//setInterval("next()",5000);
			//반복 기억하기 
		</script>
		
	</head>
	<body>
		story
		<input type="button" value="home" onclick="location.href='/membership/'">
		
		<input type="button" value="LEFT" onclick="left()">
		<div id="story_photo"><img id="gallery" src="${pageContext.request.contextPath}/resources/img/newjeans1.jpg" title="" alt="이미지없음"></div>
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