function modify(f){
	f.action="user_info_modify_form";
	f.method="POST";
	f.submit();
}

function delete_leave(f){
	if(!confirm("정말 탈퇴하시겠습니까?")) {
		return;
	}
	let m_idx = document.getElementById('m_idx');

	let url = "delete_update";
	let param = { };
	
	send_request(url, param, del_check, "POST");
}

function del_check(...args){ 
	let res = args[0].param;
	
	if(res == 'success') {
		alert('탈퇴했습니다.');
		location.href='logout';
	} else if(res == 'fail'){
		alert('실패했습니다. 관리자에게 문의해주세요.');
		return;
	} else{
		
	}
		
} 