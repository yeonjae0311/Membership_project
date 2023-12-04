<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		//이미지 로테이션 코드///
	/* 	let num=1;//시작 번호
		let endnum=6; //마지막번호 개수가 바뀌면이부분을 수정
		let path = "${pageContext.request.contextPath}/resources/img/";
		let str_newjeans = "newjeans"; */
	</script>
	
<script>
	let svo_list = ${svo_list};
	alert('svo_list');
	alert('${svo_list}');
	alert('${svo_list[0].s_filename}')
	/* let svo_list =  */
	<!-- 이 윗부분을 jsp include로 해야할듯? -->
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
	//이미지 로테이션 코드///
	function left(){
		console.log('left clicked')
		prev();
		return;
	}
	
	function right(){
		console.log('right clicked')
		next();
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
		let url = 'test';//여기서부터 이어서
		let param = 'num='+num+'&m_idx=${m_username.m_idx}';
	} 
	</script>
</head>
<body>
	story
	<div id="content">
		<img src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}" alt="이미지 유실">
	</div>
	<div id="liked">
		${svo.sl_isliked}
	</div>
	<input type="button" value="LEFT" onclick="left()">	
	<input type="button" value="RIGHT" onclick="right()">	
	<input type="button" value="LIKE" onclick="like()">
	<input type="button" value="home" onclick="location.href='/membership/'">		

	<div id="comment_form">
		<table>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</table>
	</div>
</body>
</html>