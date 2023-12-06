<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script>
		let currentStoryIndex = 0;
		
		function story_update_read_hit(storyclass){
			let idx = storyclass.getElementsByClassName('story_idx');
			//console.log(idx[0].value);
			let s_idx = idx[0].value;
			
			let url = "story_update_read_hit";
			let param = {
				"s_idx": encodeURIComponent(s_idx)
			};
			
			sendRequest(url,param,resultFn2,'post');
		}
		function resultFn2(...args){
			let res = args[0].param;
			let s_idx = args[0].s_idx;
			
			let id = document.getElementById("story_"+s_idx);
			let s_read_hit_class = id.getElementsByClassName('s_read_hit');
			s_read_hit_class[0].value = Number(s_read_hit_class[0].value)+1;
			
			console.log(s_idx+" "+res);
		}
		
		
		function show_next() {
		    let stories = document.querySelectorAll(".story");
		
		    // 현재 보여지고 있는 항목을 숨기고
		    stories[currentStoryIndex].style.display = "none";
		
		    // 다음 항목을 보여주고
		    currentStoryIndex = (currentStoryIndex + 1) % stories.length;
		    stories[currentStoryIndex].style.display = "block";
		    story_update_read_hit(stories[currentStoryIndex]);
		}
		
		function show_previous() {
		    let stories = document.querySelectorAll(".story");
		
		    // 현재 보여지고 있는 항목을 숨기고
		    stories[currentStoryIndex].style.display = "none";
		
		    // 다음 항목을 보여주고
		    currentStoryIndex = (currentStoryIndex - 1) % stories.length;
		    
		    if(currentStoryIndex==-1) 
		    	currentStoryIndex+=stories.length;
		    stories[currentStoryIndex].style.display = "block";
		    story_update_read_hit(stories[currentStoryIndex]);
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
		
		function liked2(s_idx){
			
			const story_liked = document.getElementById("liked_" + s_idx);
			const story_like_count = document.getElementById("like_count_" + s_idx);
			
			//console.log(story_liked.value)
		
			if(story_liked.value == 0){
				console.log(story_liked.value);
				story_liked.value = Number(story_liked.value)+ 1;
				story_like_count.value = Number(story_like_count.value)+1;
				let url = "add_story_like";
				 
				let param={
					"sl_isliked":encodeURIComponent(story_liked.value),
					"s_idx":encodeURIComponent(s_idx)
				}; 
				sendRequest(url,param,resultFn,'post');		 
			}else if(story_liked.value == 1){
				story_liked.value = Number(story_liked.value)-1;
				story_like_count.value = Number(story_like_count.value)-1;
				
				let url="delete_to_unlike";
				 
				let param={
					"sl_isliked":encodeURIComponent(story_liked.value),
					"s_idx":encodeURIComponent(s_idx)
				}; 
				
				sendRequest(url,param,resultFn,'post');		
			}else{
				alert(story_liked.value);
				console.log(story_liked.value);
			}
		}
		function resultFn(...args){
			let res = args[0].param;
			alert(res);
		}
	</script>
</head>
<body>
	story	
	<c:if test="${not empty id }">
		<input type="button" value="스토리 작성하기" onclick="location.href='story_post'">
	</c:if>
	
	<div id="storyContainer">	
		<c:forEach var="svo" items="${svo_list}" varStatus="loop">			
			<div id="story_${svo.s_idx}" class="story" style="display: ${loop.index == 0 ? 'block' : 'none'}">
			
				<div class="left">
					<input type="button" value="LEFT" onclick="show_previous()">	
				</div>
			
				<img src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename}"  alt="이미지 유실">
			
				<div class="comment">
					<textarea readonly>${svo.s_content }</textarea>
				</div>
				
				<input class="story_idx" type="hidden" value="${svo.s_idx}">
			
				<input class="s_read_hit" value="${svo.s_read_hit}">
					
				<input id="like_count_${svo.s_idx}" class="like_count" value="${svo.s_like_count}">
					
				<input id="liked_${svo.s_idx}" value="${svo.sl_isliked}" class="liked">
					
				<%-- <input type="hidden" value="${svo.sl_isliked}" class="liked_value"> --%>
				
				<input type="button" value="LIKE" onclick="liked2( ${svo.s_idx})">
				
				<div class="right">
					<input type="button" value="RIGHT" onclick="show_next()">	
				</div>
			</div>
		</c:forEach>		
	</div>	
	<input type="button" value="home" onclick="location.href='/membership/'">		

</body>

</html>