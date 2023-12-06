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
			 
	} else if(story_liked.value == 1){
		story_liked.value = Number(story_liked.value)-1;
		story_like_count.value = Number(story_like_count.value)-1;
		
		let url="delete_story_to_unlike";
		 
		let param={
			"sl_isliked":encodeURIComponent(story_liked.value),
			"s_idx":encodeURIComponent(s_idx)
		}; 
		
		sendRequest(url,param,resultFn,'post');	
			
	} else{
		alert(story_liked.value);
		console.log(story_liked.value);
	}
}

function resultFn(...args){
	let res = args[0].param;
	alert(res);
}

window.onload = function() {	
		
	let beign_story_class = document.getElementsByClassName('story_idx');
	
	let s_idx = beign_story_class[0].value;
	
	let url = "story_update_read_hit";
	
	let param = {
		"s_idx": encodeURIComponent(s_idx)
	};
	
	sendRequest(url,param,resultFn2,'post');
};