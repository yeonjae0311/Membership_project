<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script>
		let currentStoryIndex = 0;
		
		function showNext() {
		    let stories = document.querySelectorAll(".story");
		
		    // 현재 보여지고 있는 항목을 숨기고
		    stories[currentStoryIndex].style.display = "none";
		
		    // 다음 항목을 보여주고
		    currentStoryIndex = (currentStoryIndex + 1) % stories.length;
		    stories[currentStoryIndex].style.display = "block";
		}
		
		function showPrevious() {
		    let stories = document.querySelectorAll(".story");
		
		    // 현재 보여지고 있는 항목을 숨기고
		    stories[currentStoryIndex].style.display = "none";
		
		    // 다음 항목을 보여주고
		    currentStoryIndex = (currentStoryIndex - 1) % stories.length;
		    
		    if(currentStoryIndex==-1) 
		    	currentStoryIndex+=stories.length;
		    stories[currentStoryIndex].style.display = "block";
		}
		
		function like(s_idx,m_idx,sl_isliked){
		    let stories = document.querySelectorAll(".story");
		    let classname = stories[currentStoryIndex].getElementsByClassName('liked');
			
			let url = "change_like_status";
			let param = "s_idx="+s_idx+"&m_idx="+m_idx+"&sl_isliked="+sl_isliked;
			if(sl_isliked=="0"){
				sl_isliked="1";
			}else{
				sl_isliked="0";
			}
			sendRequest(url,param,revalidate,'post');
		}
		
		function revalidate(){
			if(xhr.readyState==4&&xhr.status==200){
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				//갱신시 바뀌어야하는 것들 재연산
				let stories = document.querySelectorAll(".story");
				let classname = stories[currentStoryIndex].getElementsByClassName('liked');
				classname[0].innerHTML = json[0].sl_isliked;
				alert('여기까지 도달')
			}
		} 
	</script>
</head>
<body>
	story	
	
	<div id="storyContainer">	
		<c:forEach var="svo" items="${svo_list}" varStatus="loop">
			
			<div class="story" style="display: ${loop.index == 0 ? 'block' : 'none'}">
			
				<div class="left">
					<input type="button" value="LEFT" onclick="showPrevious()">	
				</div>
			
				<img src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}"  alt="이미지 유실">
			
				<div class="comment">
					<textarea readonly>${svo.s_content }</textarea>
				</div>
			
				<div class="liked">					
					${svo.sl_isliked}
				</div>
				
				<input type="button" value="LIKE" onclick="like('${svo.s_idx}','${svo.m_idx}','${svo.sl_isliked }')">
				
				<div class="right">
					<input type="button" value="RIGHT" onclick="showNext()">	
				</div>
				
			</div>
		</c:forEach>		
	</div>	
    <button onclick="showNext()">Next</button>

    <script>

    </script>
	
	<input type="button" value="home" onclick="location.href='/membership/'">		

</body>

</html>