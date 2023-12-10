// tab icon
const icon_link = document.createElement("link");
icon_link.rel = "icon";
icon_link.href = window.location.origin + "/membership/resources/img/njr.ico"

document.head.appendChild(icon_link);

// header 만들기
const header_bar = document.getElementById("header_bar");

const buttons = ["story", "board", "shop"];

let left_header = document.createElement("div");
left_header.id = "left_header";

let button_main = document.createElement("input");
	
	button_main.type = "button";
	button_main.value = "main";
	button_main.addEventListener("click", () => {
		location.href = "main";
	});
	
	left_header.appendChild(button_main);

for(const element of buttons){
	let button = document.createElement("input");
	
	button.type = "button";
	button.value = element;
	button.addEventListener("click", () => {
		
		const check_membership = localStorage.getItem("isMembership");
		
		if(session == null){
		 
			location.href = "login_form";
		 
		} else{
		
			if(check_membership != "1"){
				alert("멤버십 가입이 필요한 서비스입니다.")	
			} else{
				send_main(element);
			}	
		}	
	});
	
	left_header.appendChild(button);
}

console.log(header_bar)
console.log(left_header)

header_bar.appendChild(left_header);

function send_main(page){
	location.href = page;
}

// footer 만들기
let footer = document.createElement("div");
footer.innerHTML = "membership page(newjeans)";

document.getElementById("footer_bar").appendChild(footer);

// localStorage login
const m_id = localStorage.getItem("id");
const m_password = localStorage.getItem("password");
const session = sessionStorage.getItem("session");

if(m_id != null && m_password != null && session === null){
	let url = "login";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_password": encodeURIComponent(m_password)
	};
	sendRequest(url, param, my_check, "post");
}

function my_check(...args){
	let res = args[0];

	console.log(res)
	
	let form = document.getElementsByTagName("form")[0];
	
	localStorage.setItem("idx", res.m_idx);
	localStorage.setItem("id", res.m_id);
	localStorage.setItem("password", res.m_password);
	localStorage.setItem("isMaster", res.m_ismaster);
	localStorage.setItem("isMembership", res.m_ismembership);

	sessionStorage.setItem("session", true);

	if(res["param"] == 'no_m_id'){
		alert('아이디가 존재하지 않습니다.');
		form.m_id.focus();
		return;
	} else if(res["param"] == 'no_m_password'){
		alert('비밀번호가 일치하지 않습니다');
		form.m_password.focus();
		return;
	} else {
		
		location.href='main';
	}
}