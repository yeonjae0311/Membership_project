let bl_isliked;
let b_idx, m_idx;

window.onload = function(){
	b_idx = document.getElementById('b_idx').value;
	m_idx = document.getElementById('m_idx').value;
	
	if(b_idx == '1'){
		bl_isliked = '1';
	}else{
		bl_isliked = '0';
	}
}

function send_reply(f){
	let r_content = f.r_content.value.trim();
	if(r_content==''){
		alert('빈 답글은 달 수 없습니다.');
		f.r_content.focus();
		return;
	}
	
	f.method="post";
	f.action="board_reply";
	f.submit();
}

function delete_board_post(){
	if(!confirm('정말로 삭제하시겠습니까?')){
		return;
	}
	let url = "delete_board_post";
	
   	const param = {
        "m_idx": encodeURIComponent(m_idx),
        "b_idx": encodeURIComponent(b_idx)
    };			
	
   	send_request(url,param,after_delete_board_post,'post');
}
function after_delete_board_post(...args){
	let res = args[0].res;
	if(res == 'success'){
		alert('게시글 삭제 성공');
		location.href='board';
	}else{
		alert('글 삭제 권한이 없습니다.');
	}
}
function board_like(b_idx){
	let like_button_class = document.getElementsByClassName('board_like_button');
	const like_img_b_id = document.getElementById('like_img_b_'+b_idx);
	
	if(like_button_class[0].value == '좋아요'){
		
		let url ="add_board_like";
		
		let param={
				"bl_isliked":encodeURIComponent("0"),
				"b_idx":encodeURIComponent(b_idx)
		};
		
		send_request(url,param,after_board_like,'post');
		
		like_img_b_id.src="/membership/resources/img/liker.png";
		like_button_class[0].value='좋아요 해제'
	}else{
		let url ="delete_board_to_unlike";
		
		let param={
				"bl_isliked":encodeURIComponent("1"),
				"b_idx":encodeURIComponent(b_idx)
		};
		
		send_request(url,param,after_board_like,'post');
		
		like_img_b_id.src="/membership/resources/img/likep.png";
		like_button_class[0].value='좋아요'
	}
}

function after_board_like(...args){
	let res = args[0].param;
	let like_count_id = document.getElementById('b_like_count');
	if(res=='plus'){
		like_count_id.value = Number(like_count_id.value)+1;
	}else if(res=='minus'){
		like_count_id.value = Number(like_count_id.value)-1;
	}
}

function reply_like(r_idx){
	let id = document.getElementById('rl_isliked_'+r_idx);
	const r_id = document.getElementById('like_img_r_'+r_idx);
	
	if(id.value=='0'){
		let url ="add_reply_like";
		
		let param={
				"rl_isliked":encodeURIComponent("0"),
				"r_idx":encodeURIComponent(r_idx)
		};
		
		send_request(url,param,after_reply_like,'post');
		id.value='1';
		r_id.src = "/membership/resources/img/liker.png";
	}else{
		let url ="delete_reply_to_unlike";
		
		let param={
				"rl_isliked":encodeURIComponent("1"),
				"r_idx":encodeURIComponent(r_idx)
		};
		
		send_request(url,param,after_reply_like,'post');
		id.value='0';
		r_id.src = "/membership/resources/img/likep.png";
	}
}

function after_reply_like(...args){
	let res = args[0].res;
	let r_idx = args[0].r_idx;
	let r_like_count_id = document.getElementById('r_like_count_'+r_idx);
	let rl_isliked_status_id = document.getElementById('rl_isliked_status_'+r_idx);
	if(res == 'plus'){     
		r_like_count_id.value= Number(r_like_count_id.value)+1;
		rl_isliked_status_id.value = '좋아요 해제';	
	}else if(res=='minus'){
		r_like_count_id.value= Number(r_like_count_id.value)-1;
		rl_isliked_status_id.value = '좋아요';				
	}else{
		alert('권한이 없습니다.');
	}
}

function delete_reply(r_idx){
	if(!confirm('정말로 삭제하시겠습니까?')){
		return;
	}
	
	let url='delete_reply';
	let param = {
		"r_idx":encodeURIComponent(r_idx)
	}
	
	send_request(url,param,after_delete_reply,'post');
}

function after_delete_reply(...args){
	console.log(args[0]);
	let res = args[0].res;
	if(res=='success'){
		alert('댓글 삭제');
		location.href='board_view?b_idx='+b_idx;
	}else if(res=='fail'){
		alert('댓글 삭제 권한이 없습니다.');
	}else{
		alert('예외 발생 res값 : '+res);
	}
}

function edit_board_post(){
	let b_idx = document.getElementById('b_idx').value;
	let m_idx = document.getElementById('m_idx').value;
	
	let url = "check_edit_board_post";
	let param ={
		"b_idx" : b_idx,
		"m_idx" : m_idx
	};
	
	send_request(url,param,after_edit_board_post,"post")
}

function after_edit_board_post(...args){
	let res = args[0].res;
	if(res == 'success'){
		let b_idx = document.getElementById('b_idx').value;
		
		location.href='board_edit_form?b_idx='+b_idx;
	}else{
		alert('글 수정 권한이 없습니다.');
	}
}

function edit_reply(r_idx){
	
	let url = "check_edit_reply";
	let param = {
		"r_idx" : r_idx
	};
	
	send_request(url,param,after_try_edit_reply,"post");
}

function after_try_edit_reply(...args){
	let res = args[0].res;
	if(res == 'success'){
		let r_idx = Number(args[0].r_idx);
		let div_id = document.getElementById('reply_text_div_'+r_idx);
		
		let reply_edit_form = document.createElement('form');
		reply_edit_form.setAttribute('method','post');
		reply_edit_form.setAttribute('action','update_reply');
		
		let r_idx_child = document.createElement('input');
		r_idx_child.setAttribute('type','hidden');
		r_idx_child.setAttribute('name','r_idx');
		r_idx_child.setAttribute('value',r_idx);
		
		let b_idx_child = document.createElement('input');
		b_idx_child.setAttribute('type','hidden');
		b_idx_child.setAttribute('name','b_idx');
		b_idx_child.setAttribute('value',document.getElementById('b_idx').value);
		
		let input_child = document.createElement('textarea');
		input_child.setAttribute('name','r_content');
		input_child.value = escapeHTML(div_id.innerHTML);
		input_child.value = input_child.value.trim();
		
		let submit_child = document.createElement('button');
		submit_child.setAttribute('type','submit');			
		submit_child.textContent = 'Submit'; 
				
		reply_edit_form.addEventListener('submit', function(event) {
		    if (!validate_form()) {
		        event.preventDefault();
		    }
		});
		
		function validate_form() {
		    let content = input_child.value.trim();
		    
		    if (content == '') {
		        alert('빈 댓글은 입력할 수 없습니다.');
		        return false;
		    }

		    return true;
		}
		
		let content_temp = div_id.innerHTML;
		div_id.innerHTML="";
		
		let cancel_child = document.createElement('button');
		cancel_child.textContent = 'Cancel';
		cancel_child.addEventListener("click", function(){
			//let content = input_child.value;
			div_id.removeChild(reply_edit_form);
			div_id.innerHTML=content_temp;
			//div_id.innerHTML= content;
			let edit_button = document.getElementById('edit_reply_button_'+r_idx);		
			edit_button.style.visibility ="visible";
		});
		
		reply_edit_form.appendChild(r_idx_child);
		reply_edit_form.appendChild(b_idx_child);
		reply_edit_form.appendChild(input_child);
		reply_edit_form.appendChild(submit_child);
		reply_edit_form.appendChild(cancel_child);
				
		div_id.appendChild(reply_edit_form);
		
		let edit_button = document.getElementById('edit_reply_button_'+r_idx);
		console.log(edit_button);
		
		edit_button.style.visibility="hidden";
	}else{
		alert('댓글 수정 권한이 없습니다.');
	}
}

function escapeHTML(html) {
    return html.replace(/</g, '&lt;').replace(/>/g, '&gt;');
}