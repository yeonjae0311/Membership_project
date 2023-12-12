let currentStoryIndex = 0;

let img_class_array = document.getElementsByClassName("img_class");

for(let element of img_class_array){
	const story_img = element.lastElementChild;
	const story_img_height = story_img.naturalHeight;
	const story_img_width = story_img.naturalWidth;

	if(story_img_height >= story_img_width){
		story_img.style.height = "100%";
	}else{
		story_img.style.width = "100%";
	}
}

function story_update_read_hit(storyclass){
	let idx = storyclass.getElementsByClassName('story_idx');
	let s_idx = idx[0].value;
	
	let url = "story_update_read_hit";
	let param = {
		"s_idx": encodeURIComponent(s_idx)
	};
	
	send_request(url,param,after_story_update_read_hit,'post');
}

function after_story_update_read_hit(...args){
	let res = args[0].param;
	let s_idx = args[0].s_idx;
	
	let id = document.getElementById("story_"+s_idx);
	let s_read_hit_class = id.getElementsByClassName('s_read_hit');
	s_read_hit_class[0].value = Number(s_read_hit_class[0].value)+1;
}
		
function show_next() {
    let stories = document.querySelectorAll(".story");

    stories[currentStoryIndex].style.display = "none";

    currentStoryIndex = (currentStoryIndex + 1) % stories.length;
    stories[currentStoryIndex].style.display = "block";
    story_update_read_hit(stories[currentStoryIndex]);
}

function show_previous() {
    let stories = document.querySelectorAll(".story");

    stories[currentStoryIndex].style.display = "none";

    currentStoryIndex = (currentStoryIndex - 1) % stories.length;
    
    if(currentStoryIndex==-1) 
    	currentStoryIndex+=stories.length;
    stories[currentStoryIndex].style.display = "block";
    story_update_read_hit(stories[currentStoryIndex]);
}

function liked2(s_idx,event){
	change(event);
	
	const story_liked = document.getElementById("liked_" + s_idx);
	const story_like_count = document.getElementById("like_count_" + s_idx);
	const like_img_id = document.getElementById("like_img_id_" + s_idx);
	
	if(story_liked.value == 0){	
		story_liked.value = Number(story_liked.value)+ 1;
		story_like_count.value = Number(story_like_count.value)+1;
		like_img_id.src = "/membership/resources/img/liker.png";
		let url = "add_story_like";
		 
		let param={
			"sl_isliked":encodeURIComponent(story_liked.value),
			"s_idx":encodeURIComponent(s_idx)
		}; 
		
		send_request(url,param,resultFn,'post');	
			 
	} else if(story_liked.value == 1){
		story_liked.value = Number(story_liked.value)-1;
		story_like_count.value = Number(story_like_count.value)-1;
		like_img_id.src = "/membership/resources/img/likep.png";
		
		let url="delete_story_to_unlike";
		 
		let param={
			"sl_isliked":encodeURIComponent(story_liked.value),
			"s_idx":encodeURIComponent(s_idx)
		}; 
		
		send_request(url,param,resultFn,'post');	
			
	} else{
	}
}

function resultFn(...args){
	let res = args[0].param;
}

window.onload = function() {	
		
	let beign_story_class = document.getElementsByClassName('story_idx');
	
	if(beign_story_class!=null){
		let s_idx = beign_story_class[0].value;
		
		let url = "story_update_read_hit";
		
		let param = {
			"s_idx": encodeURIComponent(s_idx)
		};
		
		send_request(url,param,after_story_update_read_hit,'post');
	}
};

function change(event){
	if(event.target.style.fill=="white"){				
		event.target.style.fill = "red";
	}else{				
		event.target.style.fill = "white";
	}
}