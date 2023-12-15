function send(e){
	location.href=e.target.parentElement.id;
}

function logout(){
	window.localStorage.clear();
	location.href='logout';
}
