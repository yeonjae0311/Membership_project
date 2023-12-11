let bl_isliked;
let b_idx,m_idx;

window.onload = function(){
	b_idx = document.getElementById('b_idx').value;
	let m_idx = document.getElementById('m_idx').value;
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
	
	if(like_button_class[0].value == '좋아요'){
		
		let url ="add_board_like";
		
		let param={
				"bl_isliked":encodeURIComponent("0"),
				"b_idx":encodeURIComponent(b_idx)
		};
		
		send_request(url,param,after_board_like,'post');
		
		like_button_class[0].value='좋아요 해제'
	}else{
		let url ="delete_board_to_unlike";
		
		let param={
				"bl_isliked":encodeURIComponent("1"),
				"b_idx":encodeURIComponent(b_idx)
		};
		
		send_request(url,param,after_board_like,'post');
		
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
	
	if(id.value=='0'){
		console.log('up');
		let url ="add_reply_like";
		
		let param={
				"rl_isliked":encodeURIComponent("0"),
				"r_idx":encodeURIComponent(r_idx)
		};
		
		send_request(url,param,after_reply_like,'post');
		id.value='1';
	}else{
		console.log('down');
		let url ="delete_reply_to_unlike";
		
		let param={
				"rl_isliked":encodeURIComponent("1"),
				"r_idx":encodeURIComponent(r_idx)
		};
		
		send_request(url,param,after_reply_like,'post');
		id.value='0';
	}
}

function after_reply_like(...args){
	console.log(args[0]);
	let res = args[0].res;
	let r_idx = args[0].r_idx;
	let b_like_count_id = document.getElementById('r_like_count_'+r_idx);
	if(res == 'plus'){     
		b_like_count_id.value= Number(b_like_count_id.value)+1;
	}else if(res=='minus'){
		b_like_count_id.value= Number(b_like_count_id.value)-1;				
	}else{
		alert('권한이 없습니다.');
	}
}

function delete_reply(r_idx){
	
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