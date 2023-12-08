function modify(f){
	f.action="user_info_modify_form";
	f.method="POST";
	f.submit();
}

function leave(f){
	if(!confirm("정말 탈퇴하시겠습니까?")) {
		return;
	}

	let url = "del";
	let param = {"m_idx="+${id.m_idx}};
	
	sendRequest(url,param,del_check,"POST");
}

function del_check(){
	let res = args[0].param;
		
	let form = document.getElementsByTagName("form")[0];
} 